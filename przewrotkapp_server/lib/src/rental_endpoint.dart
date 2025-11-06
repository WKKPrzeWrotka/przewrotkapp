import 'dart:async';

import 'package:przewrotkapp_server/src/generated/protocol.dart';
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
                DateTime.now().subtract(Duration(days: 30)),
              ),
        include: Rental.include(
          user: UserInfo.include(),
          junctions: RentalJunction.includeList(
            include: RentalJunction.include(gear: Gear.include()),
          ),
        ),
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
    await session.db.transaction((t) async {
      final newRental = await Rental.db.insertRow(
        session,
        Rental(
          userId: auth!.userId,
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
    });
    _rentalsUpdateCtrl.add(true);
  }
}
