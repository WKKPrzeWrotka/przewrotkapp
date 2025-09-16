import 'dart:async';

import 'package:przewrotkapp_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class RentalEndpoint extends Endpoint {
  final _rentalsUpdateCtrl = StreamController<bool>.broadcast();

  Future<List<Rental>> getRentals(Session session, {bool past = false}) =>
      Rental.db.find(
        session,
        where: past
            ? null
            : (r) => r.to.notBetween(
                  DateTime(1970),
                  // This value (30 days) is very randomly chosen by my anxiety
                  // right now. It should be smaller (preferably, 0).
                  // maybe a week?
                  // maybe consider this option, and all streams used with it,
                  // to be usable only for tasks like making a new rental
                  // and every calendar page or whatever will have to use
                  // some pagination
                  DateTime.now().subtract(Duration(days: 30)),
                ),
        include: Rental.include(
          userInfo: UserInfo.include(),
          junctions: RentalJunction.includeList(
            include: RentalJunction.include(gear: Gear.include()),
          ),
        ),
      );

  Stream<List<Rental>> watchRentals(
    Session session, {
    bool past = false,
  }) async* {
    yield await getRentals(session, past: past);
    await for (final _ in _rentalsUpdateCtrl.stream) {
      yield await getRentals(session, past: past);
    }
  }

  Future<void> rentGear(
      Session session, List<Gear> gear, DateTime from, DateTime to) async {
    final auth = await session.authenticated;
    // TODO BIG: Check if given gear is rented for this range
    await session.db.transaction((t) async {
      final newRental = await Rental.db.insertRow(
          session,
          Rental(
            userInfoId: auth!.userId,
            created: DateTime.now(),
            lastModified: DateTime.now(),
            from: from,
            to: to,
          ),
          transaction: t);
      await RentalJunction.db.insert(
        session,
        gear
            .map((g) => RentalJunction(gearId: g.id!, rentalId: newRental.id!))
            .toList(),
        transaction: t,
      );
    });
    _rentalsUpdateCtrl.add(true);
  }
}
