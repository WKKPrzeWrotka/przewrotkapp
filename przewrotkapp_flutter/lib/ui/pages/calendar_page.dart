import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final rentals = context.watch<List<Rental>?>();
    return rentals != null
        ? MonthView(
            controller: EventController()
              ..addAll(
                [
                  for (final rental in rentals)
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
  }
}
