import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/scopes.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../../logic/data_types.dart';
import '../../utils/names_and_strings.dart';
import 'favourite_gear_card.dart';
import 'godzinkowy_card.dart';
import 'hours_card.dart';
import 'upcoming_trips_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sm = context.read<SessionManager>();
    final user = sm.signedInUser;
    final t = Theme.of(context);
    final tt = t.textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Siemano ${user?.name ?? 'yyy'}'),
            if (context.watch<AllGearCache?>() == null)
              Text("🟠 Ładowanie...", style: tt.labelMedium),
          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: IconButton(
              iconSize: 48,
              padding: EdgeInsets.all(2),
              onPressed: user == null
                  ? null
                  : () => context.push('/user/${user.id!}'),
              icon: CircularUserImage(userInfo: user, size: 48),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(6),
        children: [
          HoursCard(),
          if (user?.scopeNames.contains(PrzeScope.godzinkowy.name) ?? false)
            GodzinkowyCard(),
          UpcomingTripsCard(),
          FavouriteGearCard(),
        ],
      ),
    );
  }
}
