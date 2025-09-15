import 'package:przewrotkapp_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class RentalEndpoint extends Endpoint {
  Future<List<Rental>> getAllRentals(Session session) => Rental.db.find(
        session,
        include: Rental.include(
          junctions: RentalJunction.includeList(
            include: RentalJunction.include(gear: Gear.include()),
          ),
        ),
      );

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
  }
}
