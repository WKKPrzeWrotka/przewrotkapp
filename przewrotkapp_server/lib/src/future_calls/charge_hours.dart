import 'package:przewrotkapp_client/hours_calculations.dart' as client;
import 'package:przewrotkapp_client/przewrotkapp_client.dart' as client;
import 'package:przewrotkapp_client/scopes.dart' as scopes;
import 'package:przewrotkapp_server/src/hours_endpoint.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

import '../generated/protocol.dart';

class ChargeHoursFutureCall extends FutureCall<Rental> {
  static const callName = 'ChargeHoursFutureCall';

  static String getIdentifier(Rental rental) => 'chargeHours-${rental.id!}';

  @override
  String get name => callName;

  @override
  Future<void> invoke(Session session, Rental? rental) async {
    // make sure we have fresh and whole-grain rental
    rental = await Rental.db.findFirstRow(
      session,
      where: (r) => r.id.equals(rental!.id!),
      include: Rental.include(
        user: UserInfo.include(),
        junctions: RentalJunction.includeList(
          include: RentalJunction.include(gear: Gear.include()),
        ),
      ),
    );
    rental!;

    final clientGear = await Stream.fromIterable(rental.junctions!)
        .asyncMap(
          (j) => _getPairFromSoleGear(
            session,
            client.Gear.fromJson(j.gear!.toJson()),
          ),
        )
        .toSet();
    final days = rental.end.difference(rental.start).inDays + 1;
    final hours = client.hoursForGear(
      clientGear,
      days,
      scopes.PrzeScope.fromNames(rental.user!.scopeNames),
    );
    await Hour.db.insertRow(
      session,
      Hour(
        userId: rental.userId,
        amount: -hours,
        description: "Wypożyczenie sprzętu na $days dni (ID: ~${rental.id!})",
        category: HourCategory.rental,
        date: rental.end,
        approved: true,
      ),
    );
    hoursUpdateCtrl.add(rental.userId);
  }

  static Future<void> schedule(Serverpod pod, Rental rental) async {
    await pod.cancelFutureCall(getIdentifier(rental));
    await pod.futureCallAtTime(
      callName,
      rental,
      rental.end,
      identifier: getIdentifier(rental),
    );
  }
}

// This absolute pile of garbage is here because we have to convert
// server-ish-classes into client-ish classes - because Client
// cannot depend anyhow on the server.
//
// And, the logic of hoursForGear() is actually pretty complex
// (even differentiating kayak *types*), so it needs *whole-grain* GearPair
//
// ...i know 😑
//
// Only solution to avoid this would be to move hoursForGear() to the
// server completely and require client to call it
Future<client.GearPair> _getPairFromSoleGear(
  Session session,
  client.Gear gear,
) async => client.GearPair(
  gear: gear,
  gearExtra: switch (gear.type) {
    client.GearType.belt => client.GearBelt.fromJson(
      (await GearBelt.db.findFirstRow(
        session,
        where: (e) => e.gearId.equals(gear.id),
      ))!.toJson(),
    ),
    client.GearType.clothing => client.GearClothing.fromJson(
      (await GearClothing.db.findFirstRow(
        session,
        where: (e) => e.gearId.equals(gear.id),
      ))!.toJson(),
    ),
    client.GearType.floatbag => client.GearFloatbag.fromJson(
      (await GearFloatbag.db.findFirstRow(
        session,
        where: (e) => e.gearId.equals(gear.id),
      ))!.toJson(),
    ),
    client.GearType.helmet => client.GearHelmet.fromJson(
      (await GearHelmet.db.findFirstRow(
        session,
        where: (e) => e.gearId.equals(gear.id),
      ))!.toJson(),
    ),
    client.GearType.kayak => client.GearKayak.fromJson(
      (await GearKayak.db.findFirstRow(
        session,
        where: (e) => e.gearId.equals(gear.id),
      ))!.toJson(),
    ),
    client.GearType.paddle => client.GearPaddle.fromJson(
      (await GearPaddle.db.findFirstRow(
        session,
        where: (e) => e.gearId.equals(gear.id),
      ))!.toJson(),
    ),
    client.GearType.pfd => client.GearPfd.fromJson(
      (await GearPfd.db.findFirstRow(
        session,
        where: (e) => e.gearId.equals(gear.id),
      ))!.toJson(),
    ),
    client.GearType.spraydeck => client.GearSpraydeck.fromJson(
      (await GearSpraydeck.db.findFirstRow(
        session,
        where: (e) => e.gearId.equals(gear.id),
      ))!.toJson(),
    ),
    client.GearType.throwbag => client.GearThrowbag.fromJson(
      (await GearThrowbag.db.findFirstRow(
        session,
        where: (e) => e.gearId.equals(gear.id),
      ))!.toJson(),
    ),
    client.GearType.other => client.GearExtra(),
  },
);
