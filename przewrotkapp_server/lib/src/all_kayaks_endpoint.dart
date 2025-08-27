import 'package:serverpod/serverpod.dart';

import 'generated/protocol.dart';

class AllKayaksEndpoint extends Endpoint {
  Future<List<Gear>> getAllKayaks(Session session) async {
    return [
      (await GearKayak.db.findFirstRow(
        session,
        where: (kayakTable) => kayakTable.gear.clubId.equals('KK-32'),
        include: GearKayak.include(
          gear: Gear.include(),
        ),
      ))!
          .gear!
    ];
  }

  Future<void> addNewKayak(
      Session session, Gear gear, GearKayak kayak) async {
    final result = await session.db.transaction((trans) async {
      final insertedGear =
          await Gear.db.insertRow(session, gear, transaction: trans);
      session.log('new gear: $insertedGear');
      final insertedKayak = await GearKayak.db.insertRow(
          session, kayak.copyWith(gearId: insertedGear.id),
          transaction: trans);
      session.log('new kayak: $insertedKayak');
    });
    session.log('adding kayak $result');
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
