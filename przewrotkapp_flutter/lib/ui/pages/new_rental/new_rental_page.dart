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
import '../../common/gear_listing.dart';
import '../../common/gear_search_filters.dart';
import '../../common/utils.dart';

class NewRentalPage extends StatefulWidget {
  const NewRentalPage({super.key});

  @override
  State<NewRentalPage> createState() => _NewRentalPageState();
}

enum _RentingState {
  selecting,
  loading,
  success,
  error,
}

class _NewRentalPageState extends State<NewRentalPage> {
  var rentingState = _RentingState.selecting;

  var selectedDates = <DateTime>[];
  var params = GearSearchParams.mainDefault;
  final cart = <GearPair>[];
  final shoppingCart = <GearPair>{};

  int hoursForGear(Set<GearPair> gear, DateTime from, DateTime to) {
    return (gear.where((e) => e.gear.type == GearType.kayak).length +
            [
              for (final type in GearType.values.toList()
                ..remove(GearType.kayak)
                ..remove(GearType.other))
                gear.where((e) => e.gear.type == type).length
            ].reduce(max)) *
        (to.difference(from).inDays + 1);
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
    final selectedRange = selectedDates.length == 2
        ? DateTimeRange(start: selectedDates[0], end: selectedDates[1])
        : null;
    final overlappingRentals = selectedRange != null
        ? otherRentals?.where(
            (r) =>
                DateTimeRange(start: r.from, end: r.to).overlaps(selectedRange),
          )
        : null;
    final rentedGearIds = overlappingRentals?.fold(
      <int>[],
      (l, r) => l..addAll(r.junctions!.map((j) => j.gearId)),
    );
    return Scaffold(
      appBar: AppBar(title: Text("Wypożycz sprzęcior")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text('Wybierz termin', style: tt.headlineMedium),
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.range,
            ),
            value: selectedDates,
            onValueChanged: (newDates) {
              selectedDates = newDates;
              // THIS IS VERY IMPORTANT !!
              if (selectedDates.isNotEmpty) {
                selectedDates[0] = selectedDates[0].withDefaultRentalFromTime();
              }
              if (selectedDates.length == 2) {
                selectedDates[1] = selectedDates[1].withDefaultRentalToTime();
              }
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
                            onPressed: shoppingCart.contains(gear) ||
                                    (rentedGearIds?.contains(gear.gear.id) ??
                                        false)
                                ? null
                                : () {
                                    shoppingCart.add(gear);
                                    setState(() {});
                                  },
                            icon: Icon(Icons.add_shopping_cart),
                          ),
                        )
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
            "Od ${selectedDates.elementAtOrNull(0)?.toStringDate() ?? "-"} do "
            "${selectedDates.elementAtOrNull(1)?.toStringDate() ?? "-"}",
          ),
          Text(
            "Koszt: ${selectedDates.length == 2 ? hoursForGear(shoppingCart, selectedDates[0], selectedDates[1]) : "?"}h",
            style: tt.headlineMedium,
          ),
          // TODO: Warning if there is no already-rented-check
          SizedBox(
            height: 64,
            child: FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Przytrzymaj :)")),
                );
              },
              onLongPress: () async {
                try {
                  Vibration.vibrate();
                } catch (e) {
                  // nothing, dont care
                }
                rentingState = _RentingState.loading;
                setState(() {});
                try {
                  await context.read<Client>().rental.rentGear(
                        shoppingCart.map((e) => e.gear).toList(),
                        selectedDates[0],
                        selectedDates[1],
                      );
                  rentingState = _RentingState.success;
                  setState(() {});
                  await Future.delayed(Duration(milliseconds: 500));
                  context.pop();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error! $e")),
                  );
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
