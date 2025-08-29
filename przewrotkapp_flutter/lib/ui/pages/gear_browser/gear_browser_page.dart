import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_flutter/ui/common/gear_listing.dart';

class GearBrowserPage extends StatelessWidget {
  const GearBrowserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final client = context.read<Client>();
    return ListView(
      children: [
        FutureBuilder(
          future: client.allKayaks.getAllKayaks(),
          builder: (context, snap) {
            return snap.hasData
                ? Column(
                    children: [
                      for (GearKayak kayak in snap.data!)
                        GearListing(
                          gear: kayak.gear!,
                          subtypeData: kayak,
                        ),
                    ],
                  )
                : Placeholder();
          },
        ),
      ],
    );
  }
}
