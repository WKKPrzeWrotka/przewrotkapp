import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kalender/kalender.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../../data_types.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final calendarCtrl = CalendarController();

  @override
  Widget build(BuildContext context) {
    final rentals = context.watch<FutureRentals?>();
    final eventsCtrl = DefaultEventsController();
    eventsCtrl.addEvents([
      // TODO BIG: Whole rentals join by common date shannainan
      for (final rental in rentals ?? <Rental>[])
        CalendarEvent(
          canModify: false,
          data: rental,
          dateTimeRange: DateTimeRange(start: rental.from, end: rental.to),
        ),
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat(
            "MMMM",
          ).format(calendarCtrl.visibleDateTimeRange.value.dominantMonthDate),
        ),
        actions: [
          IconButton(
            onPressed: () => calendarCtrl.jumpToDate(DateTime.now()),
            icon: Icon(Icons.calendar_today),
          ),
          IconButton(
            onPressed: () => calendarCtrl.animateToPreviousPage(),
            icon: Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () => calendarCtrl.animateToNextPage(),
            icon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: CalendarView(
        calendarController: calendarCtrl,
        eventsController: eventsCtrl,
        viewConfiguration: MonthViewConfiguration.singleMonth(),
        header: CalendarHeader(),
        body: CalendarBody(
          monthTileComponents: TileComponents(
            tileBuilder: (event, range) => Container(
              color: Colors.blue,
              child: Text(
                (event.data as Rental).junctions!
                    .map((e) => e.gear!.clubId)
                    .join(", "),
              ),
            ),
          ),
          callbacks: CalendarCallbacks(
            onPageChanged: (_) => setState(() {}),
            onEventTapped: (event, _) {
              print('huurra! $event');
            },
          ),
        ),
        components: CalendarComponents(
          monthComponents: MonthComponents(
            headerComponents: MonthHeaderComponents(
              weekDayHeaderBuilder: (day, style) =>
                  Text(DateFormat("E").format(day)),
            ),
          ),
        ),
      ),
    );
  }
}
