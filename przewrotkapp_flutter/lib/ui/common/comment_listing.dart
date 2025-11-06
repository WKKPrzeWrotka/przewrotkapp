import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../logic/data_types.dart';
import 'gear_chip.dart';
import 'user_chip.dart';

class CommentListing extends StatelessWidget {
  final Comment comment;

  const CommentListing({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    final gearPair = comment.gearId != null
        ? context.watch<AllGearCache>().firstWhereOrNull(
            (g) => g.gear.id == comment.gearId,
          )
        : null;
    return Card(
      color: switch (comment.type) {
        CommentType.neutral => null,
        CommentType.warning => Colors.orange.shade200,
        CommentType.broken => Colors.red.shade700,
      },
      child: ListTile(
        title: Text(
          switch (comment.type) {
                CommentType.neutral => 'ℹ️',
                CommentType.warning => '⚠️',
                CommentType.broken => '🚨',
              } +
              comment.text,
        ),
        subtitle: Wrap(
          spacing: 8,
          children: [
            if (gearPair != null) GearChip(gearPair: gearPair),
            // i think there is 0% chance that this is null but whatever
            if (comment.by != null) UserChip(user: comment.by!),
          ],
        ),
      ),
    );
  }
}
