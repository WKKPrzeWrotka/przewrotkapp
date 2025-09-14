import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

class NewRentalPage extends StatefulWidget {
  const NewRentalPage({super.key});

  @override
  State<NewRentalPage> createState() => _NewRentalPageState();
}

class _NewRentalPageState extends State<NewRentalPage> {
  var selectedDates = <DateTime>[];
  final cart = <(Gear, dynamic)>[];

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
          // TODO: Gear picker
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
