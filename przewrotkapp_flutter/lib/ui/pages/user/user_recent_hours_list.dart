import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../common/hour_listing.dart';

class UserRecentHoursList extends StatelessWidget {
  final int userId;

  const UserRecentHoursList({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final client = context.read<Client>();
    return StreamBuilder(
      stream: client.hours.watchHours(userId: userId),
      builder: (_, snap) => snap.hasData
          ? Column(
              children: [
                for (final hour in snap.data!.sublist(
                  0,
                  min(snap.data!.length, 10),
                ))
                  HourListing(hour: hour),
              ],
            )
          : Text("Ładowanie..."),
    );
  }
}
