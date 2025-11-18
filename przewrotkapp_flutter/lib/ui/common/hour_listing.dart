import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_client/scopes.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../utils/names_and_strings.dart';
import 'user_chip.dart';

class HourListing extends StatelessWidget {
  final Hour hour;

  const HourListing({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    final isGodzinkowy = context.select<SessionManager, bool>(
      (sm) => sm.signedInUser!.scopeNames.contains(PrzeScope.godzinkowy.name),
    );
    return Card(
      child: ListTile(
        title: Text(hour.description),
        trailing: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(hour.amount.toString(), style: tt.headlineSmall),
            if (isGodzinkowy)
              IconButton(
                onPressed: () =>
                    context.push('/hours/edit?emptyFields=false', extra: hour),
                icon: Icon(Icons.edit),
              ),
          ],
        ),
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
