import 'dart:async';
import 'dart:math';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_flutter/ui/common/gear_listing.dart';
import 'package:przewrotkapp_flutter/ui/common/utils.dart';
import 'package:vibration/vibration.dart';
import '../common/utils.dart';

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
  final cart = <(Gear, dynamic)>[];
  final allGearCmpl = Completer<List<Gear>>();
  var selectedGearType = GearType.kayak;
  final searchBarCtrl = TextEditingController();
  var gearSelection = <Gear>[];
  final shoppingCart = <Gear>{};

  void filterGear() async {
    gearSelection = (await allGearCmpl.future).where((e) {
      if (e.type != selectedGearType) return false;
      final t = searchBarCtrl.text.toLowerCase();
      if (t.isNotEmpty) {
        final fullName = (e.clubId.toLowerCase()) +
            (e.manufacturer?.toLowerCase() ?? "") +
            (e.model?.toLowerCase() ?? "") +
            (e.friendlyName?.toLowerCase() ?? "");
        return fullName.contains(t);
      }
      return true;
    }).toList()
      ..sort((a, b) {
        final l = a.clubId.length.compareTo(b.clubId.length);
        return l != 0 ? l : a.clubId.compareTo(b.clubId);
      });
    setState(() {});
  }

  int hoursForGear(Set<Gear> gear, DateTime from, DateTime to) {
    return (gear.where((e) => e.type == GearType.kayak).length +
            [
              for (final type in GearType.values.toList()
                ..remove(GearType.kayak)
                ..remove(GearType.other))
                gear.where((e) => e.type == type).length
            ].reduce(max)) *
        (to.getDayDifference(from) + 1);
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      if (mounted) {
        final client = context.read<Client>();
        allGearCmpl.complete(await client.gearRead.getAllGear());
        filterGear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    return Scaffold(
      appBar: AppBar(title: Text("Wypożycz sprzęcior")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text('Wybierz termin:', style: tt.headlineMedium),
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.range,
            ),
            value: selectedDates,
            onValueChanged: (newDates) {
              selectedDates = newDates;
              // THIS IS VERY IMPORTANT !!
              if (selectedDates.isNotEmpty) {
                selectedDates[0] = selectedDates[0].copyWith(hour: 6);
              }
              if (selectedDates.length == 2) {
                selectedDates[1] = selectedDates[1].copyWith(hour: 23);
              }
              setState(() {});
            },
          ),
          Text(
            "Od ${selectedDates.elementAtOrNull(0)?.toStringDate() ?? "-"} do "
            "${selectedDates.elementAtOrNull(1)?.toStringDate() ?? "-"}",
          ),
          Text("Wybierz sprzęcior:", style: tt.headlineMedium),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              for (final type in GearType.values)
                ChoiceChip(
                  label: Text(type.toDisplayString()),
                  selected: selectedGearType == type,
                  onSelected: (v) {
                    if (v) selectedGearType = type;
                    filterGear();
                  },
                ),
            ],
          ),
          SearchBar(
            controller: searchBarCtrl,
            leading: Icon(Icons.search),
            trailing: [
              if (searchBarCtrl.text.isNotEmpty)
                IconButton(
                  onPressed: () {
                    searchBarCtrl.clear();
                    filterGear();
                    setState(() {});
                  },
                  icon: Icon(Icons.clear),
                ),
            ],
            onSubmitted: (v) {
              filterGear();
            },
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: FutureBuilder(
              future: allGearCmpl.future,
              builder: (context, snap) {
                return snap.hasData
                    ? ListView(
                        children: [
                          for (final gear in gearSelection)
                            GearListing(
                              gear: gear,
                              trailing: IconButton(
                                onPressed: shoppingCart.contains(gear)
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
                    : Placeholder();
              },
            ),
          ),
          Text("Wybrano:", style: tt.headlineMedium),
          Column(
            children: [
              for (final gear in shoppingCart)
                GearListing(
                  gear: gear,
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
            "Koszt: ${selectedDates.length == 2 ? hoursForGear(shoppingCart, selectedDates[0], selectedDates[1]) : "?"}h",
            style: tt.headlineMedium,
          ),
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
                        shoppingCart.toList(),
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
