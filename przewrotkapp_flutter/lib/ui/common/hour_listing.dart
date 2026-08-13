import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_client/scopes.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../logic/data_types.dart';
import '../../logic/utils.dart';
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
    // Try to find corresponding rental and put a button instead of pure text id
    // note: for now, these are just future+last 2 weeks
    final allRentals = context.watch<FutureRentals?>();
    Rental? matchingRental;
    final match = RegExp(r"\(ID: ~\d+\)").firstMatch(hour.description);
    if (match != null) {
      final rentalId = int.tryParse(
        hour.description.substring(match.start + 6, match.end - 1),
      );
      if (rentalId != null) {
        matchingRental = allRentals?.firstWhereOrNull((r) => r.id == rentalId);
      }
    }
    return Card(
      child: ListTile(
        title: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              hour.description.substring(
                0,
                matchingRental != null ? match?.start : null,
              ),
            ),
            if (matchingRental != null)
              ActionChip(
                onPressed: () => context.push(
                  '/rentals/group/'
                  '${DateTimeRange(start: matchingRental!.start, end: matchingRental.end).dateRangeString()}',
                ),
                label: Text("ID: ${matchingRental.id ?? ""}"),
              ),
          ],
        ),
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
