import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import 'favourite_gear_card.dart';
import 'hours_card.dart';
import 'upcoming_trips_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sm = context.read<SessionManager>();
    final user = sm.signedInUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Siemano ${user?.userName ?? 'ktoś'}'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: IconButton(
              iconSize: 48,
              padding: EdgeInsets.all(2),
              onPressed:
                  user == null ? null : () => context.push('/user/${user.id!}'),
              icon: CircularUserImage(
                userInfo: user,
                size: 48,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          HoursCard(),
          UpcomingTripsCard(),
          FavouriteGearCard(),
        ],
      ),
    );
  }
}
