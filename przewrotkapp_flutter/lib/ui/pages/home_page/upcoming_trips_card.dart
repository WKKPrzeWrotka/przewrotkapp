import 'package:flutter/material.dart';

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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            Text("Najbliższe wyjazdy:", style: tt.headlineSmall),
            Text('- Kolna 03.10 - 05.10'),
            Text('- dawajcie na troje 27.09 - 28.09'),
            ElevatedButton(onPressed: () {}, child: Text('Nowy wyjazd!')),
            ElevatedButton(onPressed: () {}, child: Text('Zobacz kalendarz')),
          ],
        ),
      ),
    );
  }
}
