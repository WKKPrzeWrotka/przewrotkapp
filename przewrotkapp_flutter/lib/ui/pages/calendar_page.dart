import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<Client>().rental.getAllRentals(),
      builder: (context, snap) {
        return snap.hasData
            ? MonthView(
                controller: EventController()
                  ..addAll(
                    [
                      for (final rental in snap.data!)
                        CalendarEventData(
                          title: rental.junctions!
                              .map((e) => e.gear!.clubId)
                              .join(", "),
                          date: rental.from,
                          endDate: rental.to,
                        ),
                    ],
                  ),
                cellAspectRatio: 1.0,
              )
            : Placeholder();
      },
    );
  }
}
