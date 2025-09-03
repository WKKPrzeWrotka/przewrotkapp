import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_flutter/ui/common/gear_listing.dart';

class GearBrowserPage extends StatelessWidget {
  const GearBrowserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final client = context.read<Client>();
    return FutureBuilder(
      future: _getAllGear(client),
      builder: (context, snap) {
        return snap.hasData
            ? ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  for ((Gear, dynamic) gear in snap.data!)
                    GearListing(
                      gear: gear.$1,
                      subtypeData: gear.$2,
                    ),
                ],
              )
            : Placeholder();
      },
    );
  }
}

Future<List<(Gear, dynamic)>> _getAllGear(Client client) async {
  final all = await Future.wait([
    client.gearRead.getAllBelts(),
    client.gearRead.getAllClothes(),
    client.gearRead.getAllFloatbags(),
    client.gearRead.getAllHelmets(),
    client.gearRead.getAllKayaks(),
    client.gearRead.getAllPaddles(),
    client.gearRead.getAllPfds(),
    client.gearRead.getAllSpraydecks(),
    client.gearRead.getAllThrowbags(),
  ]);
  return [for (final a in all) ...a]
      .map((dynamic e) => (e.gear as Gear, e))
      .toList();
}
