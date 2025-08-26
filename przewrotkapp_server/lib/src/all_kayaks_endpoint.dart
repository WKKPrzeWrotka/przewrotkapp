import 'dart:math';

import 'package:serverpod/serverpod.dart';

import 'generated/protocol.dart';

class AllKayaksEndpoint extends Endpoint {
  Future<List<Gear>> getAllKayaks(Session session) async {
    await Future.delayed(Duration(seconds: 2));
    if (Random().nextBool()) throw KayakException(kayakId: 'KK-32');
    return Gear.db.find(session);
  }

  Future<void> addNewKayak(Session session, Gear newKayak) async {
    await Gear.db.insertRow(session, newKayak);
  }

  Future<String?> addKayakPhoto(Session session, String clubId) async {
    return session.storage.createDirectFileUploadDescription(
        storageId: 'public', path: 'photos/kayaks/$clubId/1.png');
  }

  Future<Uri?> getKayakPhoto(Session session, String clubId) async {
    if (!await session.storage
        .fileExists(storageId: 'public', path: 'photos/kayaks/$clubId/1.png')) {
      return null;
    }
    return await session.storage
        .getPublicUrl(storageId: 'public', path: 'photos/kayaks/$clubId/1.png');
  }
}
