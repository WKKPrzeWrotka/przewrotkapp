import 'dart:async';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kalender/kalender.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/hours_calculations.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_client/scopes.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../../logic/data_types.dart';
import '../../../logic/gear_search.dart';
import '../../../logic/utils.dart';
import '../../common/gear_listing.dart';
import '../../common/gear_search_filters.dart';
import '../../common/long_press_try_success_fail_button.dart';
import '../../common/user_chip.dart';

class RentalPage extends StatefulWidget {
  final Rental? rental;
  final DateTimeRange? initialRange;

  const RentalPage({super.key, this.rental, this.initialRange});

  @override
  State<RentalPage> createState() => _RentalPageState();
}

class _RentalPageState extends State<RentalPage> {
  var _shoppingCartSetUp = false;

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

  @override
  void initState() {
    super.initState();
    if (widget.rental != null) {
      selectedDates = [widget.rental!.start, widget.rental!.end];
    }
    if (widget.initialRange != null) {
      selectedDates = [widget.initialRange!.start, widget.initialRange!.end];
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    final you = context.read<SessionManager>().signedInUser;
    final client = context.read<Client>();
    final allGear = context.watch<AllGearCache?>();
    final userScopes = PrzeScope.fromNames(
      context.read<SessionManager>().signedInUser?.scopeNames ?? [],
    );
    final favs = context.watch<UserFavourites?>()?.gearIds;
    final filteredGear = sortGear(
      searchGear(allGear ?? [], params),
      favs ?? [],
    );
    final otherRentals = context.watch<FutureRentals?>();
    final overlappingRentals = range != null
        ? otherRentals?.where(
            (r) =>
                r.id != (widget.rental?.id ?? -1) &&
                DateTimeRange(start: r.start, end: r.end).overlaps(range!),
          )
        : null;
    final rentedGearIds = overlappingRentals?.fold(
      <int>[],
      (l, r) => l..addAll(r.junctions!.map((j) => j.gearId)),
    );
    final punishmentHours = shoppingCart.isNotEmpty
        ? hoursPunishmentForLateness(
            DateTime.now(),
            range?.start ?? DateTime.now().addDays(30),
          )
        : 0;
    if (widget.rental != null && !_shoppingCartSetUp && allGear != null) {
      final ids =
          widget.rental!.junctions
              ?.map((rj) => rj.gearId)
              .toList(growable: false) ??
          <int>[];
      shoppingCart.clear();
      shoppingCart.addAll(
        allGear.where((gp) => ids.contains(gp.gear.id!)).toSet(),
      );
      _shoppingCartSetUp = true;
    }
    final foreignRental =
        widget.rental?.userId != null && widget.rental?.userId != you?.id;

    return Scaffold(
      // this is to avoid https://github.com/flutter/flutter/issues/124205
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text("Wypożycz szpej${foreignRental ? " dla" : ""}"),
            if (foreignRental) ...[
              SizedBox(width: 4),
              UserChip(user: widget.rental!.user!),
            ],
          ],
        ),
        actions: [
          if (widget.rental != null)
            // TODO: A TextButton here instead of filled
            LongPressTrySuccessFailButton(
              onTry: () => client.rental.deleteRental(widget.rental!),
              onSuccess: () {
                if (context.mounted) context.pop();
              },
              style: TextButton.styleFrom(backgroundColor: Colors.red.shade700),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(Icons.delete),
                  SizedBox(width: 2),
                  Text("Usuń"),
                ],
              ),
            ),
        ],
      ),
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
            "Koszt: ${range != null ? hoursForGear(shoppingCart, (range!.duration.inDays + 1), userScopes) : "?"}h"
            "${punishmentHours > 0 ? " (+ ${punishmentHours}h za spóźnienie)" : ""}",
            style: tt.headlineMedium,
          ),
          LongPressTrySuccessFailButton(
            onTry: () async {
              if (range == null) throw "Nie wybrałeś żadnej daty!";
              if (rentedGearIds == null) {
                throw "Nie mam danych o innych wypożyczeniach! "
                    "Spróbuj za chwile albo odśwież czy coś...";
              }
              if (shoppingCart.any((g) => rentedGearIds.contains(g.gear.id))) {
                throw "O nie nie, twój sprzęt jest już wzięty "
                    "przez kogoś w tym terminie - znajdź sobie inny!";
              }
              await client.rental.createOrUpdateRental(
                // Use values from edited rental, or new ones if we're making
                // new one
                Rental(
                  id: widget.rental?.id,
                  userId: widget.rental?.userId ?? you!.id!,
                  created: widget.rental?.created ?? DateTime.now(),
                  lastModified: DateTime.now(),
                  start: range!.start,
                  end: range!.end,
                  junctions: shoppingCart
                      .map(
                        // this is on purpose - see server endpoint
                        // it overrides rentalId itself because Serverpod
                        // is annoying in this area
                        // https://github.com/serverpod/serverpod/issues/1343
                        (e) => RentalJunction(gearId: e.gear.id!, rentalId: -1),
                      )
                      .toList(),
                ),
              );
            },
            onSuccess: () async {
              await Future.delayed(Duration(milliseconds: 500));
              if (context.mounted) context.pop();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 24),
              child: Text("Bierz!"),
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
