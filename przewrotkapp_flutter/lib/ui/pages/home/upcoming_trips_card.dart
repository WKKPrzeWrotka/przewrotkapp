import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../logic/data_types.dart';
import '../../common/long_list_small_frame.dart';
import '../../common/rental_group_listing.dart';

class UpcomingTripsCard extends StatefulWidget {
  const UpcomingTripsCard({super.key});

  @override
  State<UpcomingTripsCard> createState() => _UpcomingTripsCardState();
}

class _UpcomingTripsCardState extends State<UpcomingTripsCard> {
  final foreverRentedDays = 30 * 12;
  final maxStartDateDifference = 3;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;

    final rentGroups = context.watch<FutureRentalGroups?>()?.where((event) {
      final isForeverRental = event.range.duration.inDays >= foreverRentedDays;

      final differenceForEvent = DateTime.now().difference(event.range.start);

      final isEventJoinable =
          differenceForEvent.isNegative || // Future event (now < eventDate)
          differenceForEvent.inDays <
              maxStartDateDifference; // Started less than 3 days ago

      return !isForeverRental && isEventJoinable;
    });

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            Text("Najbliższe wyjazdy:", style: tt.headlineSmall),
            if (rentGroups != null)
              LongListSmallFrame(
                maxHeight: 250,
                ifEmpty: Text("Na razie nuda 🥱"),
                children: [
                  for (final rental in rentGroups)
                    RentalGroupListing(rentalGroup: rental),
                ],
              ),
            if (rentGroups == null) Text("Ładowanie..."),
            FilledButton(
              onPressed: () => context.push('/rentals/edit'),
              child: Text('Nowe wypożyczenie'),
            ),
          ],
        ),
      ),
    );
  }
}
