import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../../data_types.dart';
import '../../common/copyable_text.dart';
import '../../common/utils.dart';

class GearDetailsPage extends StatelessWidget {
  final String clubId;
  final ScrollController photosCtrl = ScrollController();

  GearDetailsPage({super.key, required this.clubId});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    final gear = context
        .watch<AllGearCache?>()
        ?.firstWhere((e) => e.gear.clubId == clubId)
        .gear;

    final client = context.read<Client>();
    final isFavourite =
        context.watch<UserFavourites?>()?.gearIds.contains(gear?.id) ?? false;
    final rentals = context.watch<FutureRentals?>();
    final thisRentals = gear != null
        ? rentals
            ?.where((r) => r.junctions!.map((j) => j.gearId).contains(gear.id))
        : null;
    return Scaffold(
      appBar: AppBar(
        title: Text("Szczegóły $clubId"),
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
                    child: Scrollbar(
                      controller: photosCtrl,
                      thumbVisibility: true,
                      trackVisibility: true,
                      thickness: 10,
                      child: ListView(
                        controller: photosCtrl,
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
                                    '/gear/$clubId/photos',
                                    extra: gear.photoUrls!,
                                  ),
                                  child: Image.network(uri.toString()),
                                ),
                              ),
                            ),
                        ],
                      ),
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
                Text("Nadchodządce wypożyczenia", style: tt.headlineMedium),
                for (final rental in thisRentals ?? <Rental>[])
                  // TODO RentalListing()
                  Text(
                      "${rental.from.toStringDate()} - ${rental.to.toStringDate()}")
                // TODO: All details of the gear and other crazy shit
              ],
            )
          : Placeholder(),
    );
  }
}
