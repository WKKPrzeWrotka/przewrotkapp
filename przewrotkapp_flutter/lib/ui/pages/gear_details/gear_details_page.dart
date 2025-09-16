import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_flutter/ui/common/copyable_text.dart';
import 'package:przewrotkapp_flutter/ui/common/utils.dart';

class GearDetailsPage extends StatelessWidget {
  final int gearId;

  const GearDetailsPage({super.key, required this.gearId});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    final gear = context
        .watch<List<GearPair>?>()
        ?.firstWhere((e) => e.gear.id == gearId)
        .gear;

    final client = context.read<Client>();
    final extraUser = context.watch<ExtraUserInfo?>();
    final isFavourite =
        extraUser?.favouritesJunctions?.any((e) => e.gear!.id == gearId) ??
            false;
    return Scaffold(
      appBar: AppBar(
        title: Text("Szczegóły $gearId"),
        actions: [
          IconButton(
            onPressed: gear != null
                ? () async {
                    final newState = !isFavourite;
                    client.user.updateGearFavourite(gear, newState);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text(
                          newState
                              ? "Dodano do ulubionych!"
                              : "Usunięto z ulubionych :(",
                        ),
                      ),
                    );
                  }
                : null,
            icon: Icon(
              isFavourite ? Icons.favorite : Icons.favorite_outline,
            ),
          ),
        ],
      ),
      body: gear != null
          ? ListView(
              padding: EdgeInsets.all(8),
              children: [
                if (gear.photoUrls?.isNotEmpty ?? false)
                  SizedBox(
                    height: 192,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        for (final uri in gear.photoUrls!)
                          Container(
                            padding: EdgeInsets.all(4),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(8),
                              // this doesn't actually splash... but okay...
                              child: InkWell(
                                onTap: () => context.push(
                                  '/gearDetails/$gearId/photos',
                                  extra: gear.photoUrls!,
                                ),
                                child: Image.network(uri.toString()),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ListTile(
                  title: CopyableText(
                    child: Text(
                      gear.displayName(),
                      style: tt.headlineMedium,
                    ),
                  ),
                  trailing: CopyableText(
                    child: Text(
                      gear.clubId,
                      style: tt.bodyLarge,
                    ),
                  ),
                ),
                // TODO: All details of the gear and other crazy shit
              ],
            )
          : Placeholder(),
    );
  }
}
