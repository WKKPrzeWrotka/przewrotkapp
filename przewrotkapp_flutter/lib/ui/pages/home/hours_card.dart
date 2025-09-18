import 'package:flutter/material.dart';

class HoursCard extends StatefulWidget {
  const HoursCard({super.key});

  @override
  State<HoursCard> createState() => _HoursCardState();
}

class _HoursCardState extends State<HoursCard> {
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Twoje godzinki:'),
            Text('69h', style: tt.displayMedium),
            ElevatedButton(onPressed: () {}, child: Text("Zarób!")),
          ],
        ),
      ),
    );
  }
}
