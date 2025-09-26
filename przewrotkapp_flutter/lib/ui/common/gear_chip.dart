import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octo_image/octo_image.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import 'octo_blurhash.dart';
import 'utils.dart';

class GearChip extends StatelessWidget {
  final GearPair gearPair;

  const GearChip({super.key, required this.gearPair});

  @override
  Widget build(BuildContext context) {
    final g = gearPair.gear;
    return ActionChip(
      onPressed: () => context.push('/gear/${g.clubId}'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      avatar: Container(
        decoration: BoxDecoration(shape: BoxShape.circle),
        clipBehavior: Clip.antiAlias,
        child: g.thumbnailOrFist != null
            ? OctoImage(
                width: 64,
                height: 64,
                fit: BoxFit.cover,
                image: NetworkImage(g.thumbnailOrFist.toString()),
                placeholderBuilder: g.thumbnailUrl?.blurhash != null
                    ? blurHashPlaceholderBuilder(g.thumbnailUrl!.blurhash!)
                    : null,
              )
            : Text(gearTypeToEmoji(g.type)),
      ),
      label: Text(gearPair.gear.clubId),
    );
  }
}
