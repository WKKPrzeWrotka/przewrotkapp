import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../logic/data_types.dart';
import '../../common/rental_group_listing.dart';

class UpcomingTripsCard extends StatefulWidget {
  const UpcomingTripsCard({super.key});

  @override
  State<UpcomingTripsCard> createState() => _UpcomingTripsCardState();
}

class _UpcomingTripsCardState extends State<UpcomingTripsCard> {
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    final rentGroups = context.watch<FutureRentalGroups?>();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            Text("Najbliższe wyjazdy:", style: tt.headlineSmall),
            if (rentGroups != null)
              for (final rental in rentGroups.sublist(
                0,
                // TODO: Replace that with ListView
                min(rentGroups.length, 10),
              ))
                RentalGroupListing(rentalGroup: rental),
            if (rentGroups == null) Text("Ładowanie..."),
            FilledButton(
              onPressed: () => context.push('/rentals/new'),
              child: Text('Nowe wypożyczenie'),
            ),
            // gtfo with this fucking caledar jezus chirst
            // ElevatedButton(
            //   onPressed: () => context.push('/calendar'),
            //   child: Text('Zobacz kalendarz'),
            // ),
          ],
        ),
      ),
    );
  }
}
