import 'package:flutter/material.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../data_types.dart';
import 'utils.dart';

class RentalGroupListing extends StatelessWidget {
  final RentalGroup rentalGroup;

  const RentalGroupListing({super.key, required this.rentalGroup});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // onTap: () => context.push('/user/${rental.userInfoId}'),
        title: Text("${rentalGroup.from.toStringDate(showYear: false)} do "
            "${rentalGroup.to.toStringDate(showYear: false)}"),
        subtitle: Row(
          spacing: 4,
          children: [
            Text("Jadą:"),
            for (final user in rentalGroup.rentals.map((r) => r.userInfo!))
              CircularUserImage(userInfo: user)
          ],
        ),
        // TODO:
        // trailing: TextButton(onPressed: () => context.push('/rentals/new'), child: Text("Jedź!")),
      ),
    );
  }
}
