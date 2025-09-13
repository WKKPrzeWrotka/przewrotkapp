// ignore_for_file: avoid_print
import 'dart:io';

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
    final List<Uri> uris = folder
        .listSync()
        .whereType<File>()
        .map((f) => urlBase.resolve('$clubId/${basename(f.path)}'))
        .toList();
    print('URIs for $clubId: $uris');
    // TODO: Actually insert
  }
}
