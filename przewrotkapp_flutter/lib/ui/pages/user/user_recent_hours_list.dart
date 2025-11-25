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
        ? Container(
            constraints: BoxConstraints(maxHeight: 200),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView(
              children: [for (final hour in hours) HourListing(hour: hour)],
            ),
          )
        : Text("Ładowanie...");
  }
}
