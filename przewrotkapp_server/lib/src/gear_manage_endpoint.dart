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

  Future<T> _insertOrUpdate<T extends TableRow>(
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
    final gear = gearPair.gear;
    final extra = gearPair.gearExtra;
    await session.db.transaction((t) async {
      final gearToCopy = gear.id != null
          ? (await Gear.db.findById(session, gear.id!, transaction: t))!
          : ((await Gear.db.find(
                  session,
                  where: (g) => g.clubId.equals(gear.clubId),
                )).isNotEmpty
                ? throw PrzException(
                    message: "Takie klubowe ID jest już zajęte",
                  )
                : Gear(clubId: gear.clubId, type: gear.type));
      final freshDbGear = await _insertOrUpdate(
        session,
        gearToCopy.copyWith(
          manufacturer: gear.manufacturer,
          model: gear.model,
          friendlyName: gear.friendlyName,
          photoUrls: gear.photoUrls,
          thumbnailUrl: gear.thumbnailUrl,
        ),
        t: t,
      );

      await switch (extra) {
        GearBelt belt => _insertOrUpdate<GearBelt>(
          session,
          belt.copyWith(gearId: freshDbGear.id),
          t: t,
        ),
        GearClothing clothing => _insertOrUpdate<GearClothing>(
          session,
          clothing.copyWith(gearId: freshDbGear.id),
          t: t,
        ),
        GearFloatbag floatbag => _insertOrUpdate<GearFloatbag>(
          session,
          floatbag.copyWith(gearId: freshDbGear.id),
          t: t,
        ),
        GearHelmet helmet => _insertOrUpdate<GearHelmet>(
          session,
          helmet.copyWith(gearId: freshDbGear.id),
          t: t,
        ),
        GearKayak kayak => _insertOrUpdate<GearKayak>(
          session,
          kayak.copyWith(gearId: freshDbGear.id),
          t: t,
        ),
        GearPaddle paddle => _insertOrUpdate<GearPaddle>(
          session,
          paddle.copyWith(gearId: freshDbGear.id),
          t: t,
        ),
        GearPfd pfd => _insertOrUpdate<GearPfd>(
          session,
          pfd.copyWith(gearId: freshDbGear.id),
          t: t,
        ),
        GearSpraydeck spraydeck => _insertOrUpdate<GearSpraydeck>(
          session,
          spraydeck.copyWith(gearId: freshDbGear.id),
          t: t,
        ),
        GearThrowbag throwbag => _insertOrUpdate<GearThrowbag>(
          session,
          throwbag.copyWith(gearId: freshDbGear.id),
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
