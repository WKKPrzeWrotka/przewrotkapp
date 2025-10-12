import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_client/scopes.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../../logic/data_types.dart';
import '../../common/comment_listing.dart';
import '../../common/rental_listing.dart';
import '../../utils/names_and_strings.dart';
import 'gear_details_parameters.dart';
import 'gear_horizontal_photos.dart';

class GearDetailsPage extends StatelessWidget {
  final String clubId;

  const GearDetailsPage({super.key, required this.clubId});

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
    final sm = context.read<SessionManager>();
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
          if (sm.signedInUser?.scopeNames.contains(
                PrzeScope.sprzetowiec.name,
              ) ??
              false)
            IconButton(
              onPressed: () => context.push('/gear/$clubId/edit'),
              icon: Icon(Icons.edit),
            ),
          IconButton(
            onPressed: gear != null
                ? () async {
                    final newState = !isFavourite;
                    await client.user.updateGearFavourite(gear, newState);
                    if (context.mounted) {
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
            GearHorizontalPhotos(gearPair: gearPair!),
          if (gearPair != null) GearDetailsParameters(gearPair: gearPair),
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
