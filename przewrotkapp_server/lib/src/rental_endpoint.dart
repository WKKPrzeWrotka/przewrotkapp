import 'dart:async';

import 'package:przewrotkapp_client/editing_permissions.dart';
import 'package:przewrotkapp_client/magic_numbers.dart' as magick;
import 'package:przewrotkapp_client/przewrotkapp_client.dart' as client;
import 'package:przewrotkapp_client/scopes.dart';
import 'package:przewrotkapp_server/src/future_calls/charge_hours.dart';
import 'package:przewrotkapp_server/src/generated/protocol.dart';
import 'package:przewrotkapp_server/src/hours_endpoint.dart';
import 'package:przewrotkapp_server/src/utils.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class RentalEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  final _rentalsUpdateCtrl = StreamController<bool>.broadcast();

  Future<List<Rental>> getRentals(Session session, {bool past = false}) =>
      Rental.db.find(
        session,
        where: past
            ? null
            : (r) => r.end.notBetween(
                DateTime(1970),
                // This value (30 days) is very randomly chosen by my anxiety
                // right now. It should be smaller (preferably, 0).
                // maybe a week?
                // maybe consider this option, and all streams used with it,
                // to be usable only for tasks like making a new rental
                // and every calendar page or whatever will have to use
                // some pagination
                DateTime.now().subtract(Duration(days: 7)),
              ),
        include: Rental.include(
          user: UserInfo.include(),
          junctions: RentalJunction.includeList(
            include: RentalJunction.include(gear: Gear.include()),
          ),
        ),
        orderBy: (r) => r.start,
      );

  Stream<List<Rental>> watchRentals(Session session, {bool past = false}) =>
      watchX(() => getRentals(session, past: past), _rentalsUpdateCtrl.stream);

  Future<void> rentGear(
    Session session,
    List<Gear> gear,
    DateTime from,
    DateTime to,
  ) async {
    if (to.isBefore(from)) throw "Invalid dates";
    final auth = await session.authenticated;
    final userHours = await HoursEndpoint.getHoursSumStatic(
      session,
      auth!.userId,
    );
    if (userHours < magick.hoursDebtRentingBlocked) {
      throw PrzException(
        message: "Masz mniej niż ${magick.hoursDebtRentingBlocked} godzinek!",
      );
    }
    await session.db.transaction((t) async {
      final newRental = await Rental.db.insertRow(
        session,
        Rental(
          userId: auth.userId,
          created: DateTime.now(),
          lastModified: DateTime.now(),
          start: from,
          end: to,
        ),
        transaction: t,
      );
      await RentalJunction.db.insert(
        session,
        gear
            .map((g) => RentalJunction(gearId: g.id!, rentalId: newRental.id!))
            .toList(),
        transaction: t,
      );
      await ChargeHoursFutureCall.schedule(pod, newRental);
    });
    _rentalsUpdateCtrl.add(true);
  }

  Future<void> deleteRental(Session session, Rental rental) async {
    // re-fetch from db so they can't spoof values
    rental = (await Rental.db.findById(session, rental.id!))!;
    final auth = (await session.authenticated)!;
    if (!canDeleteRental(
      auth.userId,
      PrzeScope.fromNames(auth.scopes.map((s) => s.name!)),
      client.Rental.fromJson(rental.toJson()),
    )) {
      throw 'Nie możesz usunąć tego wypożyczenia!';
    }
    await Rental.db.deleteRow(session, rental);
    _rentalsUpdateCtrl.add(true);
    await ChargeHoursFutureCall.cancel(session.serverpod, rental);
  }
}
