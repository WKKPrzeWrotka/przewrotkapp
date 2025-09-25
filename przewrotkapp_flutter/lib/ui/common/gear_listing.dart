import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../data_types.dart';
import 'octo_blurhash.dart';
import 'utils.dart';

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
    final thumbnailUrl =
        gearPair.gear.thumbnailUrl ?? gearPair.gear.photoUrls?.first;
    final blurhash = thumbnailUrl?.queryParameters['blurhash'];

    return Card(
      color: color,
      child: ListTile(
        onTap: () => context.push('/gear/${gearPair.gear.clubId}'),
        leading: AspectRatio(
          aspectRatio: 1,
          child: thumbnailUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(6),
                  child: OctoImage(
                    image: NetworkImage(
                      gearPair.gear.photoUrls!.first.toString(),
                    ),
                    fadeInDuration: Duration(milliseconds: 250),
                    fadeOutDuration: Duration(milliseconds: 250),
                    placeholderBuilder: blurhash != null
                        ? blurHashPlaceholderBuilder(
                            blurhash,
                            width: int.tryParse(
                              thumbnailUrl.queryParameters['width'] ?? '',
                            ),
                            height: int.tryParse(
                              thumbnailUrl.queryParameters['height'] ?? '',
                            ),
                          )
                        : null,
                  ),
                )
              // TODO: Type-specific emoji here
              : Icon(Icons.kayaking),
        ),
        title: Text(gearPair.gear.displayName()),
        subtitle: Text(switch (gearPair.gearExtra) {
          GearBelt belt => "${belt.length}m",
          GearClothing clothing =>
            "${clothing.type}${clothing.typeDescription != null ? ", ${clothing.typeDescription}" : ""}",
          GearFloatbag floatbag =>
            floatbag.volume != null ? "${floatbag.volume}L" : "",
          GearHelmet helmet => "${helmet.size}",
          GearKayak kayak =>
            '${kayak.type}, ${kayak.minWeight}-${kayak.maxWeight}kg',
          GearPaddle paddle =>
            '${paddle.length.toString().replaceFirst(".0", "")}cm, ${paddle.rotation}°, ${paddle.type}',
          GearPfd pfd => "${pfd.type}, ${pfd.size}",
          GearSpraydeck spraydeck =>
            "${spraydeck.deckSize}, ${spraydeck.waistSize}",
          GearThrowbag throwbag => "${throwbag.length}m",
          _ => 'to jest dupa',
        }),
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
        // tileColor: Colors.red,
      ),
    );
  }
}
