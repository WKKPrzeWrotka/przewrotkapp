import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../../di.dart';
import '../../common/hour_listing.dart';
import '../../common/long_list_small_frame.dart';

class UserRecentHoursList extends StatelessWidget {
  const UserRecentHoursList({super.key});

  @override
  Widget build(BuildContext context) {
    final hours = context.select<UserPageCubit, List<Hour>?>(
      (p) => p.state.hours,
    );
    return hours != null
        ? LongListSmallFrame(
            maxHeight: 300,
            ifEmpty: Text("Na razie nic nie wypożycza..."),
            children: [for (final hour in hours) HourListing(hour: hour)],
          )
        : Text("Ładowanie...");
  }
}
