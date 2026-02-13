import 'dart:async';

import 'package:przewrotkapp_server/src/utils.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

import 'generated/protocol.dart';

final gearUpdateCtrl = StreamController<bool>.broadcast();

class GearReadEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  final _defaultGearInclude = Gear.include(
    comments: Comment.includeList(
      include: Comment.include(
        by: UserInfo.include(),
        resolvedBy: UserInfo.include(),
      ),
    ),
  );

  Future<List<(Gear, GearBelt)>> getAllBelts(Session session) async {
    return (await GearBelt.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearBelt.include(gear: _defaultGearInclude),
    )).map((g) => (g.gear!, g)).toList();
  }

  Stream<List<(Gear, GearBelt)>> watchAllBelts(Session session) =>
      watchX(() => getAllBelts(session), gearUpdateCtrl.stream);

  Future<List<(Gear, GearClothing)>> getAllClothes(Session session) async {
    return (await GearClothing.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearClothing.include(gear: _defaultGearInclude),
    )).map((g) => (g.gear!, g)).toList();
  }

  Stream<List<(Gear, GearClothing)>> watchAllClothes(Session session) =>
      watchX(() => getAllClothes(session), gearUpdateCtrl.stream);

  Future<List<(Gear, GearFloatbag)>> getAllFloatbags(Session session) async {
    return (await GearFloatbag.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearFloatbag.include(gear: _defaultGearInclude),
    )).map((g) => (g.gear!, g)).toList();
  }

  Stream<List<(Gear, GearFloatbag)>> watchAllFloatbags(Session session) =>
      watchX(() => getAllFloatbags(session), gearUpdateCtrl.stream);

  Future<List<(Gear, GearHelmet)>> getAllHelmets(Session session) async {
    return (await GearHelmet.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearHelmet.include(gear: _defaultGearInclude),
    )).map((g) => (g.gear!, g)).toList();
  }

  Stream<List<(Gear, GearHelmet)>> watchAllHelmets(Session session) =>
      watchX(() => getAllHelmets(session), gearUpdateCtrl.stream);

  Future<List<(Gear, GearKayak)>> getAllKayaks(Session session) async {
    return (await GearKayak.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearKayak.include(gear: _defaultGearInclude),
    )).map((g) => (g.gear!, g)).toList();
  }

  Stream<List<(Gear, GearKayak)>> watchAllKayaks(Session session) =>
      watchX(() => getAllKayaks(session), gearUpdateCtrl.stream);

  Future<List<(Gear, GearPaddle)>> getAllPaddles(Session session) async {
    return (await GearPaddle.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearPaddle.include(gear: _defaultGearInclude),
    )).map((g) => (g.gear!, g)).toList();
  }

  Stream<List<(Gear, GearPaddle)>> watchAllPaddles(Session session) =>
      watchX(() => getAllPaddles(session), gearUpdateCtrl.stream);

  Future<List<(Gear, GearPfd)>> getAllPfds(Session session) async {
    return (await GearPfd.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearPfd.include(gear: _defaultGearInclude),
    )).map((g) => (g.gear!, g)).toList();
  }

  Stream<List<(Gear, GearPfd)>> watchAllPfds(Session session) =>
      watchX(() => getAllPfds(session), gearUpdateCtrl.stream);

  Future<List<(Gear, GearSpraydeck)>> getAllSpraydecks(Session session) async {
    return (await GearSpraydeck.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearSpraydeck.include(gear: _defaultGearInclude),
    )).map((g) => (g.gear!, g)).toList();
  }

  Stream<List<(Gear, GearSpraydeck)>> watchAllSpraydecks(Session session) =>
      watchX(() => getAllSpraydecks(session), gearUpdateCtrl.stream);

  Future<List<(Gear, GearThrowbag)>> getAllThrowbags(Session session) async {
    return (await GearThrowbag.db.find(
      session,
      orderBy: (t) => t.gear.clubId,
      include: GearThrowbag.include(gear: _defaultGearInclude),
    )).map((g) => (g.gear!, g)).toList();
  }

  Stream<List<(Gear, GearThrowbag)>> watchAllThrowbags(Session session) =>
      watchX(() => getAllThrowbags(session), gearUpdateCtrl.stream);
}
