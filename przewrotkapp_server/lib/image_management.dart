import 'dart:isolate';
import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:image/image.dart' as img;
import 'package:przewrotkapp_client/magic_numbers.dart' as magick;
import 'package:przewrotkapp_server/src/generated/gear/gear.dart';
import 'package:serverpod/serverpod.dart';

Future<img.Image> getThumbnail(img.Image image) => Isolate.run(
  () => img.copyResize(
    image,
    height: magick.thumbnailHeight,
    interpolation: img.Interpolation.cubic,
  ),
);

Future<String> getBlurhash(img.Image image) => Isolate.run(
  () => BlurHash.encode(
    img.copyResize(
      image,
      height: magick.thumbnailHeight,
      interpolation: img.Interpolation.nearest,
    ),
    numCompX: magick.blurhashCompSize,
    numCompY: magick.blurhashCompSize,
  ).hash,
);

String getThumbnailPath(String clubId) => '/thumbnails/$clubId.jpg';

Uri getRichUri(Uri uri, img.Image image, String blurhash) {
  final params = Map<String, String>.from(uri.queryParameters);
  params['width'] = image.width.toString();
  params['height'] = image.height.toString();
  params['blurhash'] = blurhash;
  return uri.replace(queryParameters: params);
}

class ThumbnailFutureCall extends FutureCall<Gear> {
  static const callName = "Thumbnail generation";

  @override
  String get name => callName;

  @override
  Future<void> invoke(Session session, Gear? gear) async {
    final first = gear!.photoUrls?.firstOrNull;
    if (first == null) {
      session.log(
        "Thumbnail generation for $gear failed beacause it doesn't have any photos",
        level: LogLevel.warning,
      );
      return;
    }
    final firstImageStoragePath = first.queryParameters['path']!;
    final byteData = await session.storage.retrieveFile(
      storageId: magick.storagePublic,
      path: firstImageStoragePath,
    );
    if (byteData == null) {
      session.log(
        "Thumbnail generation for $gear failed because storage didn't return anything for $firstImageStoragePath",
        level: LogLevel.warning,
      );
      return;
    }
    final image = await Isolate.run(
      () => img.decodeImage(Uint8List.sublistView(byteData)),
    );
    if (image == null) {
      session.log(
        "Thumbnail generation for $gear failed - can't decode ByteData",
        level: LogLevel.warning,
      );
      return;
    }
    final thumbnail = await getThumbnail(image);
    final thumbnailBlurhash = await getBlurhash(thumbnail);
    await session.storage.storeFile(
      storageId: magick.storagePublic,
      path: getThumbnailPath(gear.clubId),
      byteData: ByteData.sublistView(
        img.encodeJpg(
          thumbnail,
          quality: magick.gearThumbnailCompressionLevel,
          chroma: img.JpegChroma.yuv420,
        ),
      ),
    );
    final pubUri = await session.storage.getPublicUrl(
      storageId: magick.storagePublic,
      path: getThumbnailPath(gear.clubId),
    );
    final newUri = getRichUri(pubUri!, thumbnail, thumbnailBlurhash);
    await Gear.db.updateRow(session, gear.copyWith(thumbnailUrl: newUri));
    session.log(
      'Successfully generated thumbnail for $gear 🎉',
      level: LogLevel.debug,
    );
  }
}
