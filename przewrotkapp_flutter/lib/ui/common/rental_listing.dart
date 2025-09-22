import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import 'utils.dart';

class RentalListing extends StatelessWidget {
  final Rental rental;

  const RentalListing({super.key, required this.rental});

  @override
  Widget build(BuildContext context) {
    // THIS IS UGLY AS FUCk
    // TODO: All RentalGroup stuff
    return Card(
      child: ListTile(
        onTap: () => context.push('/user/${rental.userInfoId}'),
        title: Text("${rental.from.toStringDate(showYear: false)} do "
            "${rental.to.toStringDate(showYear: false)}"),
        subtitle: Row(
          spacing: 4,
          children: [
            CircularUserImage(userInfo: rental.userInfo),
            Text(rental.userInfo!.userName ?? ""),
          ],
        ),
      ),
    );
  }
}
