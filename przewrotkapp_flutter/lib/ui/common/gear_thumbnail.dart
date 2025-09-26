import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../utils/names_and_strings.dart';
import '../utils/ui_ux_stuff.dart';
import 'octo_blurhash.dart';

class GearThumbnail extends StatelessWidget {
  final GearPair gearPair;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const GearThumbnail({
    super.key,
    required this.gearPair,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    final g = gearPair.gear;
    final t = Theme.of(context);
    final tt = t.textTheme;
    return g.thumbnailOrFist != null
        ? OctoImage(
            width: width,
            height: height,
            fit: fit,
            fadeInDuration: Duration(milliseconds: 250),
            fadeOutDuration: Duration(milliseconds: 250),
            image: NetworkImage(g.thumbnailOrFist.toString()),
            placeholderBuilder: g.thumbnailUrl?.blurhash != null
                ? blurHashPlaceholderBuilder(
                    g.thumbnailUrl!.blurhash!,
                    width: g.thumbnailUrl?.width,
                    height: g.thumbnailUrl?.height,
                  )
                : null,
          )
        : CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: Container(
              constraints: BoxConstraints.loose(Size(28, 28)),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  g.type.emoji,
                  style: tt.displayLarge!.copyWith(fontSize: 128),
                ),
              ),
            ),
          );
  }
}
