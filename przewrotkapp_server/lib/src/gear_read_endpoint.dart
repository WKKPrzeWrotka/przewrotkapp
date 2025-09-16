import 'package:serverpod/serverpod.dart';

import 'generated/protocol.dart';

class GearReadEndpoint extends Endpoint {
  Future<List<GearPair>> getAllGear(Session session) async {
    return session.db.transaction((t) async {
      return [
        ...(await GearBelt.db.find(
          session,
          transaction: t,
          orderBy: (t) => t.gear.clubId,
          include: GearBelt.include(gear: Gear.include()),
        ))
            .map((g) => GearPair(gear: g.gear!, gearExtra: g)),
        ...(await GearClothing.db.find(
          session,
          transaction: t,
          orderBy: (t) => t.gear.clubId,
          include: GearClothing.include(gear: Gear.include()),
        ))
            .map((g) => GearPair(gear: g.gear!, gearExtra: g)),
        ...(await GearFloatbag.db.find(
          session,
          transaction: t,
          orderBy: (t) => t.gear.clubId,
          include: GearFloatbag.include(gear: Gear.include()),
        ))
            .map((g) => GearPair(gear: g.gear!, gearExtra: g)),
        ...(await GearHelmet.db.find(
          session,
          transaction: t,
          orderBy: (t) => t.gear.clubId,
          include: GearHelmet.include(gear: Gear.include()),
        ))
            .map((g) => GearPair(gear: g.gear!, gearExtra: g)),
        ...(await GearKayak.db.find(
          session,
          transaction: t,
          orderBy: (t) => t.gear.clubId,
          include: GearKayak.include(gear: Gear.include()),
        ))
            .map((g) => GearPair(gear: g.gear!, gearExtra: g)),
        ...(await GearPaddle.db.find(
          session,
          transaction: t,
          orderBy: (t) => t.gear.clubId,
          include: GearPaddle.include(gear: Gear.include()),
        ))
            .map((g) => GearPair(gear: g.gear!, gearExtra: g)),
        ...(await GearPfd.db.find(
          session,
          transaction: t,
          orderBy: (t) => t.gear.clubId,
          include: GearPfd.include(gear: Gear.include()),
        ))
            .map((g) => GearPair(gear: g.gear!, gearExtra: g)),
        ...(await GearSpraydeck.db.find(
          session,
          transaction: t,
          orderBy: (t) => t.gear.clubId,
          include: GearSpraydeck.include(gear: Gear.include()),
        ))
            .map((g) => GearPair(gear: g.gear!, gearExtra: g)),
        ...(await GearThrowbag.db.find(
          session,
          transaction: t,
          orderBy: (t) => t.gear.clubId,
          include: GearThrowbag.include(gear: Gear.include()),
        ))
            .map((g) => GearPair(gear: g.gear!, gearExtra: g)),
      ];
    });
  }
}
