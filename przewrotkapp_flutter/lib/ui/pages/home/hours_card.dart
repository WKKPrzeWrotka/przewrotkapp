import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../logic/data_types.dart';

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
    final hoursSum = context.watch<HoursSum?>();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Text('Twoje godzinki:'),
            Text(
              hoursSum != null ? '${hoursSum}h' : 'Ładowanie...',
              style: tt.displayMedium,
            ),
            Align(
              child: Wrap(
                spacing: 4,
                runSpacing: 4,
                children: [
                  FilledButton(
                    onPressed: () => context.push('/comments'),
                    child: Text("Zarób!"),
                  ),
                  ElevatedButton(
                    onPressed: () => context.push('/hours/claim'),
                    child: Text("Zgłoś należne"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
