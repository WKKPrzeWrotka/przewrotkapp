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
    return Scaffold(
      appBar: AppBar(
        title: Text("Szczegóły $gearId"),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Dodano do ulubionych! (Naprawde to nie)"),
                ),
              );
            },
            icon: Icon(Icons.favorite_outline),
          )
        ],
      ),
      body: FutureBuilder(
        future: getAllGearWithExtras(context.read<Client>())
            .then((e) => e.firstWhere((e) => e.$1.id == gearId)),
        builder: (context, snap) {
          final gear = snap.data?.$1;
          return snap.hasData
              ? ListView(
                  padding: EdgeInsets.all(8),
                  children: [
                    if (snap.data!.$1.photoUrls?.isNotEmpty ?? false)
                      SizedBox(
                        height: 192,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            for (final uri in snap.data!.$1.photoUrls!)
                              Container(
                                padding: EdgeInsets.all(4),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadiusGeometry.circular(8),
                                  // this doesn't actually splash... but okay...
                                  child: InkWell(
                                    onTap: () => context.push(
                                      '/gearDetails/$gearId/photos',
                                      extra: snap.data!.$1.photoUrls!,
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
                          gear!.displayName(),
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
              : Placeholder();
        },
      ),
    );
  }
}
