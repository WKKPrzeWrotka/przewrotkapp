import 'dart:typed_data';

import 'package:przewrotkapp_client/scopes.dart';
import 'package:przewrotkapp_server/src/gear_read_endpoint.dart';
import 'package:przewrotkapp_server/src/utils.dart';
import 'package:serverpod/serverpod.dart';

import 'generated/protocol.dart';

class GearManageEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => {PrzeScope.sprzetowiec}.toScopes();

  Future<void> _insertOrUpdate<T extends TableRow>(
    Session session,
    T row, {
    Transaction? t,
  }) async => row.id != null
      ? await session.db.updateRow<T>(row, transaction: t)
      : await session.db.insertRow<T>(row, transaction: t);

  Future<Uri> uploadGearImage(
    Session session,
    ByteData imageBytes,
    String clubId,
  ) async {
    final path = '/${clubId.toUpperCase()}/${Uuid().v4()}.jpg';
    await session.storage.storeFile(
      storageId: 'public',
      path: path,
      byteData: imageBytes,
    );
    return (await session.storage.getPublicUrl(
      storageId: 'public',
      path: path,
    ))!;
  }

  Future<void> _createOrUpdateGearPair(
    Session session,
    GearPair gearPair,
  ) async {
    final g = gearPair.gear;
    final x = gearPair.gearExtra;
    await session.db.transaction((t) async {
      if (gearPair.gear.id != null) {
        final old = await Gear.db.findById(
          session,
          gearPair.gear.id!,
          transaction: t,
        );
        await Gear.db.updateRow(
          session,
          old!.copyWith(
            manufacturer: g.manufacturer,
            model: g.model,
            friendlyName: g.friendlyName,
            photoUrls: g.photoUrls,
            thumbnailUrl: g.thumbnailUrl,
          ),
          transaction: t,
        );
      }
      // I shoooould also put .copyWith everything in here, in case client
      // messes up IDs for some reason.
      // BUUUUUT it would be 20x longer -_-
      await switch (x) {
        GearBelt belt => _insertOrUpdate<GearBelt>(session, belt, t: t),
        GearClothing clothing => _insertOrUpdate<GearClothing>(
          session,
          clothing,
          t: t,
        ),
        GearFloatbag floatbag => _insertOrUpdate<GearFloatbag>(
          session,
          floatbag,
          t: t,
        ),
        GearHelmet helmet => _insertOrUpdate<GearHelmet>(session, helmet, t: t),
        GearKayak kayak => _insertOrUpdate<GearKayak>(session, kayak, t: t),
        GearPaddle paddle => _insertOrUpdate<GearPaddle>(session, paddle, t: t),
        GearPfd pfd => _insertOrUpdate<GearPfd>(session, pfd, t: t),
        GearSpraydeck spraydeck => _insertOrUpdate<GearSpraydeck>(
          session,
          spraydeck,
          t: t,
        ),
        GearThrowbag throwbag => _insertOrUpdate<GearThrowbag>(
          session,
          throwbag,
          t: t,
        ),
        GearExtra() => throw UnimplementedError(),
      };
      gearUpdateCtrl.add(true);
    });
  }

  Future<void> createOrUpdateBelt(Session session, Gear gear, GearBelt belt) =>
      _createOrUpdateGearPair(session, GearPair(gear: gear, gearExtra: belt));

  Future<void> createOrUpdateClothing(
    Session session,
    Gear gear,
    GearClothing clothing,
  ) => _createOrUpdateGearPair(
    session,
    GearPair(gear: gear, gearExtra: clothing),
  );

  Future<void> createOrUpdateFloatbag(
    Session session,
    Gear gear,
    GearFloatbag floatbag,
  ) => _createOrUpdateGearPair(
    session,
    GearPair(gear: gear, gearExtra: floatbag),
  );

  Future<void> createOrUpdateHelmet(
    Session session,
    Gear gear,
    GearHelmet helmet,
  ) =>
      _createOrUpdateGearPair(session, GearPair(gear: gear, gearExtra: helmet));

  Future<void> createOrUpdateKayak(
    Session session,
    Gear gear,
    GearKayak kayak,
  ) => _createOrUpdateGearPair(session, GearPair(gear: gear, gearExtra: kayak));

  Future<void> createOrUpdatePaddle(
    Session session,
    Gear gear,
    GearPaddle paddle,
  ) =>
      _createOrUpdateGearPair(session, GearPair(gear: gear, gearExtra: paddle));

  Future<void> createOrUpdatePfd(Session session, Gear gear, GearPfd pfd) =>
      _createOrUpdateGearPair(session, GearPair(gear: gear, gearExtra: pfd));

  Future<void> createOrUpdateSpraydeck(
    Session session,
    Gear gear,
    GearSpraydeck spraydeck,
  ) => _createOrUpdateGearPair(
    session,
    GearPair(gear: gear, gearExtra: spraydeck),
  );

  Future<void> createOrUpdateThrowbag(
    Session session,
    Gear gear,
    GearThrowbag throwbag,
  ) => _createOrUpdateGearPair(
    session,
    GearPair(gear: gear, gearExtra: throwbag),
  );
}
