import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_flutter/ui/common/utils.dart';

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
    final extraUser = context.watch<ExtraUserInfo?>();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Twój ulubiony sprzęt:", style: tt.headlineSmall),
            for (final gear
                in (extraUser?.favouritesJunctions ?? <FavouritesJunction>[])
                    .map((e) => e.gear!))
              Text(gear.displayName()),
            ElevatedButton(
              onPressed: () {},
              child: Text("Przeglądaj cały sprzęt"),
            ),
          ],
        ),
      ),
    );
  }
}
