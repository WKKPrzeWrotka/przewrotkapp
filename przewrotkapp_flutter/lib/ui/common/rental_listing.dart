import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../logic/data_types.dart';
import '../../logic/utils.dart';
import '../utils/names_and_strings.dart';
import 'gear_chip.dart';
import 'user_chip.dart';

class RentalListing extends StatelessWidget {
  final Rental rental;

  const RentalListing({super.key, required this.rental});

  @override
  Widget build(BuildContext context) {
    final allGear = context.watch<AllGearCache?>();
    // THIS IS UGLY AS FUCk. Edit: not as much anymore
    // TODO: Some 'edit' button here (once we have those)
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  "${rental.start.toStringDate(showYear: false)} do "
                  "${rental.end.toStringDate(showYear: false)}",
                ),
                UserChip(user: rental.user!),
                Text("bierze:"),
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
