import 'package:serverpod/serverpod.dart';

import 'generated/protocol.dart';

class GearReadEndpoint extends Endpoint {
  Future<List<GearBelt>> getAllBelts(Session session) async {
    return await GearBelt.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearBelt.include(gear: Gear.include()),
    );
  }

  Future<List<GearClothing>> getAllClothes(Session session) async {
    return await GearClothing.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearClothing.include(gear: Gear.include()),
    );
  }

  Future<List<GearFloatbag>> getAllFloatbags(Session session) async {
    return await GearFloatbag.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearFloatbag.include(gear: Gear.include()),
    );
  }

  Future<List<GearHelmet>> getAllHelmets(Session session) async {
    return await GearHelmet.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearHelmet.include(gear: Gear.include()),
    );
  }

  Future<List<GearKayak>> getAllKayaks(Session session) async {
    return await GearKayak.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearKayak.include(gear: Gear.include()),
    );
  }

  Future<List<GearPaddle>> getAllPaddles(Session session) async {
    return await GearPaddle.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearPaddle.include(gear: Gear.include()),
    );
  }

  Future<List<GearPfd>> getAllPfds(Session session) async {
    return await GearPfd.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearPfd.include(gear: Gear.include()),
    );
  }

  Future<List<GearSpraydeck>> getAllSpraydecks(Session session) async {
    return await GearSpraydeck.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearSpraydeck.include(gear: Gear.include()),
    );
  }

  Future<List<GearThrowbag>> getAllThrowbags(Session session) async {
    return await GearThrowbag.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearThrowbag.include(gear: Gear.include()),
    );
  }
}
