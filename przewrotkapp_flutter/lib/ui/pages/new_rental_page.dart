import 'dart:async';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_flutter/ui/common/gear_listing.dart';
import 'package:przewrotkapp_flutter/ui/common/utils.dart';

class NewRentalPage extends StatefulWidget {
  const NewRentalPage({super.key});

  @override
  State<NewRentalPage> createState() => _NewRentalPageState();
}

class _NewRentalPageState extends State<NewRentalPage> {
  var selectedDates = <DateTime>[];
  final cart = <(Gear, dynamic)>[];
  final allGearCmpl = Completer<List<Gear>>();
  var selectedGearType = GearType.kayak;
  final searchBarCtrl = TextEditingController();
  var gearSelection = <Gear>[];

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
          SizedBox(
            height: 300,
            child: FutureBuilder(
              future: allGearCmpl.future,
              builder: (context, snap) {
                return snap.hasData
                    ? ListView(
                        children: [
                          for (final gear in gearSelection)
                            GearListing(gear: gear)
                        ],
                      )
                    : Placeholder();
              },
            ),
          ),
        ],
      ),
    );
  }
}

extension on DateTime {
  String toStringDate() => "$year-"
      "${month.toString().padLeft(2, '0')}-"
      "${day.toString().padLeft(2, '0')}";
}

extension on GearType {
  String toHumanString() => switch (this) {
        GearType.belt => "Pasy transportowe",
        GearType.clothing => "Ubrania",
        GearType.floatbag => "Komory",
        GearType.helmet => "Kaski",
        GearType.kayak => "Kajaki",
        GearType.paddle => "Wiosła",
        GearType.pfd => "Kamizelki",
        GearType.spraydeck => "Fartuchy",
        GearType.throwbag => "Rzutki",
        GearType.other => "Inne",
      };

  String toDisplayString() => gearTypeToEmoji(this) + toHumanString();
}
