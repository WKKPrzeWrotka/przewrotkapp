import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../data_types.dart';
import '../../common/utils.dart';

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
    final rentals = context.watch<FutureRentals?>();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        // TODO: StreamBuilder.
        // Actually, StreamBuilders everywhere...
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Text("Najbliższe wyjazdy:", style: tt.headlineSmall),
            if (rentals != null)
              for (final rental in rentals.limit(10))
                Text(
                  "- ${rental.from.toStringDate(showYear: false)} - "
                  "${rental.to.toStringDate(showYear: false)}",
                ),
            if (rentals == null) Text("Ładowanie..."),
            FilledButton(
              onPressed: () => context.push('/rentals/new'),
              child: Text('Nowe wypożyczenie'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/calendar'),
              child: Text('Zobacz kalendarz'),
            ),
          ],
        ),
      ),
    );
  }
}
