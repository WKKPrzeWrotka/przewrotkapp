// ignore_for_file: avoid_print
import 'dart:io';
import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:image/image.dart' as img;
import 'package:przewrotkapp_server/src/generated/gear/gear.dart';
import 'package:serverpod/serverpod.dart';

Future<void> insertPhotoUrls(
  Session session,
  Uri urlBase,
  Directory photosFolder,
) async {
  print("Filling photo urls from $photosFolder...");
  basename(String path) => path.split(Platform.pathSeparator).last;
  for (final folder in photosFolder.listSync().whereType<Directory>()) {
    final clubId = basename(folder.path);
    final gear = await Gear.db.findFirstRow(
      session,
      where: (t) => t.clubId.equals(clubId),
    );
    if (gear == null) {
      print('Did not find $clubId');
      continue;
    }
    final urls = <Uri>[];
    Uri? thumbUrl;
    var first = true;
    for (final file in folder.listSync().whereType<File>().toList()
      ..sort((a, b) => basename(a.path).compareTo(basename(b.path)))) {
      print(file);
      final bytes = await file.readAsBytes();
      final image = img.decodeJpg(bytes)!;
      final (ogWidth, ogHeight) = (image.width, image.height);
      img.resize(
        image,
        height: 128,
        interpolation: img.Interpolation.cubic,
      );
      final hash = BlurHash.encode(image, numCompX: 4, numCompY: 4);
      if (first) {
        final path = '/$clubId/thumbnail.jpg';
        await session.storage.storeFile(
          storageId: 'public',
          path: path,
          byteData: ByteData.sublistView(
            img.encodeJpg(image, quality: 60, chroma: img.JpegChroma.yuv420),
          ),
        );
        final pubUrl =
            await session.storage.getPublicUrl(storageId: 'public', path: path);
        final params = Map<String, String>.from(pubUrl!.queryParameters);
        params['width'] = image.width.toString();
        params['height'] = image.height.toString();
        params['blurhash'] = hash.hash;
        thumbUrl = pubUrl.replace(queryParameters: params);
        first = false;
      }
      final path = '/$clubId/${basename(file.path)}';
      await session.storage.storeFile(
          storageId: 'public',
          path: path,
          byteData: ByteData.sublistView(bytes));
      final pubUrl =
          await session.storage.getPublicUrl(storageId: 'public', path: path);
      final params = Map<String, String>.from(pubUrl!.queryParameters);
      params['width'] = ogWidth.toString();
      params['height'] = ogHeight.toString();
      params['blurhash'] = hash.hash;
      urls.add(pubUrl.replace(queryParameters: params));
    }
    await Gear.db.updateRow(
        session, gear.copyWith(photoUrls: urls, thumbnailUrl: thumbUrl));
  }
  print("Photos done!");
}
