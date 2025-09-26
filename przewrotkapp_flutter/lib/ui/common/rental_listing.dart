import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../data_types.dart';
import 'gear_chip.dart';
import 'utils.dart';

class RentalListing extends StatelessWidget {
  final Rental rental;

  const RentalListing({super.key, required this.rental});

  @override
  Widget build(BuildContext context) {
    final allGear = context.watch<AllGearCache?>();
    // THIS IS UGLY AS FUCk
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () => context.push('/user/${rental.userInfoId}'),
            title: Text(
              "${rental.from.toStringDate(showYear: false)} do "
              "${rental.to.toStringDate(showYear: false)}",
            ),
            subtitle: Row(
              spacing: 4,
              children: [
                CircularUserImage(userInfo: rental.userInfo),
                Text(rental.userInfo!.userName ?? ""),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                if (allGear != null)
                  for (final gear in rental.gearPairs(allGear))
                    GearChip(gearPair: gear),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
