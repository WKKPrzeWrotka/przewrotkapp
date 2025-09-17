import 'dart:async';

import 'package:serverpod/serverpod.dart';

import 'generated/protocol.dart';

class GearReadEndpoint extends Endpoint {
  Future<List<(Gear, GearBelt)>> getAllBelts(Session session) async {
    return (await GearBelt.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearBelt.include(gear: Gear.include()),
    ))
        .map((g) => (g.gear!, g))
        .toList();
  }

  Future<List<(Gear, GearClothing)>> getAllClothes(Session session) async {
    return (await GearClothing.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearClothing.include(gear: Gear.include()),
    ))
        .map((g) => (g.gear!, g))
        .toList();
  }

  Future<List<(Gear, GearFloatbag)>> getAllFloatbags(Session session) async {
    return (await GearFloatbag.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearFloatbag.include(gear: Gear.include()),
    ))
        .map((g) => (g.gear!, g))
        .toList();
  }

  Future<List<(Gear, GearHelmet)>> getAllHelmets(Session session) async {
    return (await GearHelmet.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearHelmet.include(gear: Gear.include()),
    ))
        .map((g) => (g.gear!, g))
        .toList();
  }

  Future<List<(Gear, GearKayak)>> getAllKayaks(Session session) async {
    return (await GearKayak.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearKayak.include(gear: Gear.include()),
    ))
        .map((g) => (g.gear!, g))
        .toList();
  }

  Future<List<(Gear, GearPaddle)>> getAllPaddles(Session session) async {
    return (await GearPaddle.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearPaddle.include(gear: Gear.include()),
    ))
        .map((g) => (g.gear!, g))
        .toList();
  }

  Future<List<(Gear, GearPfd)>> getAllPfds(Session session) async {
    return (await GearPfd.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearPfd.include(gear: Gear.include()),
    ))
        .map((g) => (g.gear!, g))
        .toList();
  }

  Future<List<(Gear, GearSpraydeck)>> getAllSpraydecks(Session session) async {
    return (await GearSpraydeck.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearSpraydeck.include(gear: Gear.include()),
    ))
        .map((g) => (g.gear!, g))
        .toList();
  }

  Future<List<(Gear, GearThrowbag)>> getAllThrowbags(Session session) async {
    return (await GearThrowbag.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearThrowbag.include(gear: Gear.include()),
    ))
        .map((g) => (g.gear!, g))
        .toList();
  }
}
