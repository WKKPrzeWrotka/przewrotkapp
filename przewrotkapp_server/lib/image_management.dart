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

class ImagesRefreshFutureCall extends FutureCall<Gear> {
  static const callName = "Images refreshment";

  @override
  String get name => callName;

  @override
  Future<void> invoke(Session session, Gear? gear) async {
    Uri? newThumbnailUri;
    var first = true;
    final richUris = await Stream.fromIterable(gear?.photoUrls ?? <Uri>[]).asyncMap((
      imageUri,
    ) async {
      final imageStoragePath = imageUri.queryParameters['path']!;
      final byteData = await session.storage.retrieveFile(
        storageId: magick.storagePublic,
        path: imageStoragePath,
      );
      if (byteData == null) {
        session.log(
          "Image refreshing for $gear -> $imageUri failed because storage didn't return anything for $imageStoragePath",
          level: LogLevel.warning,
        );
        return imageUri;
      }
      final image = await Isolate.run(
        () => img.decodeImage(Uint8List.sublistView(byteData)),
      );
      if (image == null) {
        session.log(
          "Image refreshing for $gear -> $imageUri failed - can't decode ByteData",
          level: LogLevel.warning,
        );
        return imageUri;
      }
      final resizedImage = await getThumbnail(image);
      final blurhash = await getBlurhash(resizedImage);

      // Thumbnail itself
      if (first) {
        first = false;
        await session.storage.storeFile(
          storageId: magick.storagePublic,
          path: getThumbnailPath(gear!.clubId),
          byteData: ByteData.sublistView(
            img.encodeJpg(
              resizedImage,
              quality: magick.gearThumbnailCompressionLevel,
              chroma: img.JpegChroma.yuv420,
            ),
          ),
        );
        final pubThumbnailUri = await session.storage.getPublicUrl(
          storageId: magick.storagePublic,
          path: getThumbnailPath(gear.clubId),
        );
        newThumbnailUri = getRichUri(pubThumbnailUri!, resizedImage, blurhash);
      }
      session.log(
        'Successfully generated thumbnail for $gear 🎉',
        level: LogLevel.debug,
      );
      return getRichUri(imageUri, image, blurhash);
    }).toList();

    if (gear != null) {
      await Gear.db.updateRow(
        session,
        gear.copyWith(photoUrls: richUris, thumbnailUrl: newThumbnailUri),
      );
    }
  }
}
