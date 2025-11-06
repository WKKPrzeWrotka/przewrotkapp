import 'package:flutter/material.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../utils/names_and_strings.dart';
import 'user_chip.dart';

class HourListing extends StatelessWidget {
  final Hour hour;

  const HourListing({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    return Card(
      child: ListTile(
        title: Text(hour.description),
        trailing: Text(hour.amount.toString(), style: tt.headlineSmall),
        subtitle: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            if (hour.user != null) UserChip(user: hour.user!),
            Text(hour.date.toStringDate()),
          ],
        ),
      ),
    );
  }
}
