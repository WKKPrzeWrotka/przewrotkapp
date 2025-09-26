import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../../logic/data_types.dart';
import '../../common/gear_listing.dart';

class FavouriteGearCard extends StatefulWidget {
  const FavouriteGearCard({super.key});

  @override
  State<FavouriteGearCard> createState() => _FavouriteGearCardState();
}

class _FavouriteGearCardState extends State<FavouriteGearCard> {
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    final favGear = context.watch<UserFavourites?>()?.gearPairs;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Twój ulubiony sprzęt:", style: tt.headlineSmall),
            for (final gear in favGear ?? <GearPair>[])
              GearListing(gearPair: gear),
            SizedBox(height: 4),
            ElevatedButton(
              onPressed: () => context.push('/gear'),
              child: Text("Przeglądaj cały sprzęt"),
            ),
          ],
        ),
      ),
    );
  }
}
