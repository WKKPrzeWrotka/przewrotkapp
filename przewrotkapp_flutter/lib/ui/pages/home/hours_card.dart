import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/magic_numbers.dart' as magick;
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../../logic/data_types.dart';
import '../../../logic/utils.dart';

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
    final userId = context.select<SessionManager, int>(
      (sm) => sm.signedInUser!.id!,
    );
    final hoursSum = context.watch<HoursSum?>()?.sum;
    final hoursNegative = hoursSum != null ? (hoursSum < 0) : false;
    final rentingBlocked = hoursSum != null
        ? (hoursSum < magick.hoursDebtRentingBlocked)
        : false;
    return Card(
      color: hoursNegative ? Colors.red.shade100 : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Twoje godzinki:'),
            Text(
              hoursSum != null
                  ? '${hoursNegative ? '❗' : ''}'
                        '${hoursSum}h'
                        '${hoursNegative ? '❗' : ''}'
                  : 'Ładowanie...',
              style: tt.displayMedium,
            ),
            if (hoursNegative)
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Masz dług godzinkowy! Odrób go jak najszybciej! '
                  'Sprawdź zadania pod przyciskiem "Zarób", '
                  'lub zapytaj klubowiczów w czym można pomóc 🤗',
                  style: tt.bodyLarge,
                ),
              ),
            if (hoursNegative)
              Container(
                alignment: AlignmentDirectional.center,
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  rentingBlocked
                      ? "Wypożyczanie zostało zablokowane - masz poniżej -10h!"
                      : "(Wypożyczanie sprzętu blokuje się poniżej -10h!)",
                  style: tt.bodyMedium?.copyWith(
                    color: Colors.red.shade800,
                    fontWeight: rentingBlocked ? FontWeight.bold : null,
                  ),
                ),
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
                    onPressed: () => context.push(
                      '/hours/edit',
                      extra: HourHandy.empty(userId),
                    ),
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
