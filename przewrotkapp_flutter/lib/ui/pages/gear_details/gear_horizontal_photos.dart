import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octo_image/octo_image.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../common/octo_blurhash.dart';

class GearHorizontalPhotos extends StatefulWidget {
  final GearPair gearPair;

  const GearHorizontalPhotos({super.key, required this.gearPair});

  @override
  State<GearHorizontalPhotos> createState() => _GearHorizontalPhotosState();
}

class _GearHorizontalPhotosState extends State<GearHorizontalPhotos> {
  final ScrollController photosCtrl = ScrollController();

  @override
  Widget build(BuildContext context) {
    final gear = widget.gearPair.gear;
    final clubId = gear.clubId;
    return SizedBox(
      height: 192,
      child: Scrollbar(
        controller: photosCtrl,
        thumbVisibility: true,
        trackVisibility: true,
        thickness: 10,
        child: ListView(
          controller: photosCtrl,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            for (final uri in gear.photoUrls ?? <Uri>[])
              Container(
                padding: EdgeInsets.all(4),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8),
                  // this doesn't actually splash... but okay...
                  child: InkWell(
                    onTap: () => context.push(
                      '/gear/$clubId/photos?initialIndex=${gear.photoUrls!.indexOf(uri)}',
                    ),
                    child: OctoImage(
                      image: NetworkImage(uri.toString()),
                      fadeInDuration: Duration(milliseconds: 250),
                      fadeOutDuration: Duration(milliseconds: 250),
                      placeholderBuilder:
                          uri.queryParameters['blurhash'] != null
                          ? blurHashPlaceholderBuilder(
                              uri.queryParameters['blurhash']!,
                              width: int.tryParse(
                                uri.queryParameters['width'] ?? '',
                              ),
                              height: int.tryParse(
                                uri.queryParameters['height'] ?? '',
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
