import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../logic/data_types.dart';
import '../utils/names_and_strings.dart';
import 'gear_thumbnail.dart';

class GearListing extends StatelessWidget {
  final GearPair gearPair;
  final Widget? trailing;
  final Color? color;

  const GearListing({
    super.key,
    required this.gearPair,
    this.trailing,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isFavourite =
        context.watch<UserFavourites?>()?.gearIds.contains(gearPair.gear.id) ??
        false;
    final extraStr = gearPair.gearExtra.extraHumanInfo;
    return Card(
      color: color,
      child: ListTile(
        onTap: () => context.push('/gear/${gearPair.gear.clubId}'),
        leading: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(6),
            child: GearThumbnail(gearPair: gearPair),
          ),
        ),
        title: Text(gearPair.gear.displayName),
        subtitle: extraStr != null ? Text(extraStr) : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${isFavourite ? "❤️ " : ""}${gearPair.gear.clubId}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
