import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_flutter/ui/common/utils.dart';

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
    final client = context.read<Client>();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        // TODO: StreamBuilder.
        // Actually, StreamBuilders everywhere...
        child: FutureBuilder(
            future: client.rental.getAllRentals(),
            builder: (context, snap) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text("Najbliższe wyjazdy:", style: tt.headlineSmall),
                  if (snap.hasData)
                    for (final rental in snap.data!.limit(10))
                      Text(
                        "- ${rental.from.toStringDate(showYear: false)} - "
                        "${rental.to.toStringDate(showYear: false)}",
                      ),
                  if (!snap.hasData) Text("Ładowanie..."),
                  ElevatedButton(
                    onPressed: () => context.push('/newRental'),
                    child: Text('Nowy wyjazd!'),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: Text('Zobacz kalendarz')),
                ],
              );
            }),
      ),
    );
  }
}
