import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../../logic/data_types.dart';
import '../../common/comment_listing.dart';
import '../../common/copyable_text.dart';
import '../../common/octo_blurhash.dart';
import '../../common/rental_listing.dart';
import '../../utils/names_and_strings.dart';

class GearDetailsPage extends StatelessWidget {
  final String clubId;
  final ScrollController photosCtrl = ScrollController();

  GearDetailsPage({super.key, required this.clubId});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    // WARN: no error handling here if it's not found
    // todo?
    final gearPair = context.watch<AllGearCache?>()?.firstWhere(
      (e) => e.gear.clubId == clubId,
    );
    final gear = gearPair?.gear;
    final client = context.read<Client>();
    final isFavourite =
        context.watch<UserFavourites?>()?.gearIds.contains(gear?.id) ?? false;
    final rentals = context.watch<FutureRentals?>();
    final thisRentals = gear != null
        ? rentals?.where(
            (r) => r.junctions!.map((j) => j.gearId).contains(gear.id),
          )
        : null;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${gear != null ? gear.type.toDisplayString(plural: false) : ''} $clubId",
        ),
        actions: [
          IconButton(
            onPressed: gear != null
                ? () async {
                    final newState = !isFavourite;
                    await client.user.updateGearFavourite(gear, newState);
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
            icon: Icon(isFavourite ? Icons.favorite : Icons.favorite_outline),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          if (gear?.photoUrls?.isNotEmpty ?? false)
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
                    for (final uri in gear!.photoUrls!)
                      Container(
                        padding: EdgeInsets.all(4),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(8),
                          // this doesn't actually splash... but okay...
                          child: InkWell(
                            onTap: () => context.push(
                              '/gear/$clubId/photos?initialIndex=${gear.photoUrls!.indexOf(uri)}',
                            ),
                            child: OctoImage(
                              image: NetworkImage(uri.toString()),
                              fadeInDuration: Duration(milliseconds: 250),
                              fadeOutDuration: Duration(milliseconds: 250),
                              placeholderBuilder:
                                  uri.queryParameters['blurhash'] != null
                                  ? blurHashPlaceholderBuilder(
                                      uri.queryParameters['blurhash']!,
                                      width: int.tryParse(
                                        uri.queryParameters['width'] ?? '',
                                      ),
                                      height: int.tryParse(
                                        uri.queryParameters['height'] ?? '',
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          if (gear != null)
            ListTile(
              title: CopyableText(
                child: Text(gear.displayName, style: tt.headlineMedium),
              ),
              trailing: CopyableText(
                child: Text(gear.clubId, style: tt.bodyLarge),
              ),
            ),
          Divider(),
          if (thisRentals?.isNotEmpty ?? false)
            Text("Nadchodządce wypożyczenia", style: tt.headlineMedium),
          for (final rental in thisRentals ?? <Rental>[])
            RentalListing(rental: rental),
          if (gear?.comments?.isNotEmpty ?? false)
            Text("Komentarze", style: tt.headlineMedium),
          for (final comment in gear?.comments ?? <Comment>[])
            CommentListing(comment: comment),
          // // TODO: Adding comments
        ],
      ),
    );
  }
}
