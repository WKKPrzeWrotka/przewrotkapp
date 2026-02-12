import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_client/scopes.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../logic/data_types.dart';
import '../utils/names_and_strings.dart';
import '../utils/ui_ux_stuff.dart';
import 'gear_chip.dart';
import 'user_chip.dart';

class CommentListing extends StatelessWidget {
  final Comment comment;

  const CommentListing({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    // TODO: Unify this with server
    final allowEdit = context.select<SessionManager, bool>(
      (sm) =>
          (sm.signedInUser!.scopeNames.contains(PrzeScope.godzinkowy.name) ||
          sm.signedInUser!.scopeNames.contains(PrzeScope.zarzad.name) ||
          sm.signedInUser!.id == comment.by!.id),
    );

    final gearPair = comment.gearId != null
        ? context.watch<AllGearCache>().firstWhereOrNull(
            (g) => g.gear.id == comment.gearId,
          )
        : null;
    return Card(
      color: comment.type.backgroundColor,
      child: ListTile(
        title: Text(comment.type.emoji + comment.text),
        subtitle: Wrap(
          spacing: 8,
          children: [
            if (gearPair != null) GearChip(gearPair: gearPair),
            // i think there is 0% chance that this is null but whatever
            if (comment.by != null) UserChip(user: comment.by!),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (comment.hoursForResolving != null)
              Text("💸${comment.hoursForResolving}H", style: tt.titleLarge),
            if (allowEdit)
              IconButton(
                onPressed: () => context.push(
                  '/comments/edit?emptyFields=false',
                  extra: comment,
                ),
                icon: Icon(Icons.edit),
              ),
          ],
        ),
      ),
    );
  }
}
