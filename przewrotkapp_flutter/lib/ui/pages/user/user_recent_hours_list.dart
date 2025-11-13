import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../../di.dart';
import '../../common/hour_listing.dart';

class UserRecentHoursList extends StatelessWidget {
  const UserRecentHoursList({super.key});

  @override
  Widget build(BuildContext context) {
    final hours = context.select<UserPageCubit, List<Hour>?>(
      (p) => p.state.hours,
    );
    return hours != null
        ? Column(
            children: [
              for (final hour in hours.sublist(0, min(hours.length, 5)))
                HourListing(hour: hour),
            ],
          )
        : Text("Ładowanie...");
  }
}
