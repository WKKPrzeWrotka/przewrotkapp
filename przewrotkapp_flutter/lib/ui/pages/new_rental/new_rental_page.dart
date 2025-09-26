import 'dart:async';
import 'dart:math';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kalender/kalender.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:vibration/vibration.dart';

import '../../../data_types.dart';
import '../../../gear_search.dart';
import '../../../logic/utils.dart';
import '../../common/gear_listing.dart';
import '../../common/gear_search_filters.dart';

class NewRentalPage extends StatefulWidget {
  final DateTimeRange? initialRange;

  const NewRentalPage({super.key, this.initialRange});

  @override
  State<NewRentalPage> createState() => _NewRentalPageState();
}

enum _RentingState { selecting, loading, success, error }

class _NewRentalPageState extends State<NewRentalPage> {
  var rentingState = _RentingState.selecting;

  // This is only for UI. Use range below
  var selectedDates = <DateTime>[];
  var params = GearSearchParams.mainDefault;
  final cart = <GearPair>[];
  final shoppingCart = <GearPair>{};

  DateTimeRange? get range => selectedDates.isNotEmpty
      ? DateTimeRange(
          // The default times are very important!!
          start: selectedDates[0].withDefaultRentalFromTime(),
          end: (selectedDates.elementAtOrNull(1) ?? selectedDates[0])
              .withDefaultRentalToTime(),
        )
      : null;

  int hoursForGear(Set<GearPair> gear, DateTimeRange range) {
    return (gear.where((e) => e.gear.type == GearType.kayak).length +
            [
              for (final type
                  in GearType.values.toList()
                    ..remove(GearType.kayak)
                    ..remove(GearType.other))
                gear.where((e) => e.gear.type == type).length,
            ].reduce(max)) *
        (range.duration.inDays + 1);
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialRange != null) {
      selectedDates = [widget.initialRange!.start, widget.initialRange!.end];
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    final allGear = context.watch<AllGearCache?>();
    final favs = context.watch<UserFavourites?>()?.gearIds;
    final filteredGear = sortGear(
      searchGear(allGear ?? [], params),
      favs ?? [],
    );
    final otherRentals = context.watch<FutureRentals?>();
    final overlappingRentals = range != null
        ? otherRentals?.where(
            (r) => DateTimeRange(start: r.from, end: r.to).overlaps(range!),
          )
        : null;
    final rentedGearIds = overlappingRentals?.fold(
      <int>[],
      (l, r) => l..addAll(r.junctions!.map((j) => j.gearId)),
    );
    return Scaffold(
      appBar: AppBar(title: Text("Wypożycz sprzęcior")),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Text('Wybierz termin', style: tt.headlineMedium),
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.range,
              firstDayOfWeek: DateTime.monday,
            ),
            value: selectedDates,
            onValueChanged: (newDates) {
              selectedDates = newDates;
              setState(() {});
            },
          ),
          Text("Wybierz sprzęcior", style: tt.headlineMedium),
          GearSearchFilters(
            // well, feels like i'm spinning in circle trying to keep this
            // widget stateful...
            initialParams: GearSearchParams.mainDefault,
            onFiltersChange: (newParams) {
              params = newParams;
              setState(() {});
            },
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: allGear != null
                ? ListView(
                    children: [
                      for (final gear in filteredGear)
                        GearListing(
                          color:
                              (rentedGearIds?.contains(gear.gear.id) ?? false)
                              ? Colors.red.shade700
                              : null,
                          gearPair: gear,
                          trailing: IconButton(
                            onPressed:
                                shoppingCart.contains(gear) ||
                                    (rentedGearIds?.contains(gear.gear.id) ??
                                        false)
                                ? null
                                : () {
                                    shoppingCart.add(gear);
                                    setState(() {});
                                  },
                            icon: Icon(Icons.add_shopping_cart),
                          ),
                        ),
                    ],
                  )
                : Placeholder(),
          ),
          Text("Wybrano:", style: tt.headlineMedium),
          Column(
            children: [
              for (final gear in shoppingCart)
                GearListing(
                  color: (rentedGearIds?.contains(gear.gear.id) ?? false)
                      ? Colors.red.shade700
                      : null,
                  gearPair: gear,
                  trailing: IconButton(
                    color: Colors.red,
                    onPressed: () {
                      shoppingCart.remove(gear);
                      setState(() {});
                    },
                    icon: Icon(Icons.remove_shopping_cart),
                  ),
                ),
            ],
          ),
          Text(
            range != null
                ? "${range!.dateRangeString()} (${range!.duration.inDays + 1} dni)"
                : "Nie wybrano daty",
          ),
          Text(
            "Koszt: ${range != null ? hoursForGear(shoppingCart, range!) : "?"}h",
            style: tt.headlineMedium,
          ),
          SizedBox(
            height: 64,
            child: FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Przytrzymaj :)")));
              },
              onLongPress: () async {
                try {
                  Vibration.vibrate();
                } catch (e) {
                  // nothing, dont care
                }
                if (range == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 5),
                      backgroundColor: Colors.deepOrange,
                      content: Text("Nie wybrałeś żadnej daty!"),
                    ),
                  );
                  return;
                }
                if (rentedGearIds == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 5),
                      backgroundColor: Colors.deepOrange,
                      content: Text(
                        "Nie mam danych o innych wypożyczeniach! "
                        "Spróbuj za chwile albo odśwież czy coś...",
                      ),
                    ),
                  );
                  return;
                }
                if (shoppingCart.any(
                  (g) => rentedGearIds.contains(g.gear.id),
                )) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 5),
                      backgroundColor: Colors.red.shade700,
                      content: Text(
                        "O nie nie, twój sprzęt jest już wzięty "
                        "przez kogoś w tym terminie - znajdź sobie inny!",
                      ),
                    ),
                  );
                  return;
                }
                rentingState = _RentingState.loading;
                setState(() {});
                try {
                  await context.read<Client>().rental.rentGear(
                    shoppingCart.map((e) => e.gear).toList(),
                    range!.start,
                    range!.end,
                  );
                  rentingState = _RentingState.success;
                  setState(() {});
                  await Future.delayed(Duration(milliseconds: 500));
                  context.pop();
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Error! $e")));
                  rentingState = _RentingState.selecting;
                  setState(() {});
                }
              },
              child: switch (rentingState) {
                _RentingState.selecting => Text("Bierz!"),
                _RentingState.loading => CircularProgressIndicator(),
                _RentingState.success => Icon(Icons.check),
                _RentingState.error => Icon(Icons.error),
              },
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
