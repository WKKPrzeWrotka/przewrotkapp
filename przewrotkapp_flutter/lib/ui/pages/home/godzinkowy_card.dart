import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../../logic/data_types.dart';
import '../../common/hour_listing.dart';
import '../../common/long_list_small_frame.dart';

class GodzinkowyCard extends StatelessWidget {
  const GodzinkowyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    final awaiting = context.watch<AwaitingHours?>();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Narzędzia godzinowego ⏳", style: tt.headlineMedium),
            Text("Zgłoszenia do przejrzenia:"),
            LongListSmallFrame(
              ifEmpty: Text("Nie ma żadnych :D", style: tt.bodyLarge),
              children: [
                for (final hour in awaiting?.hours ?? <Hour>[])
                  HourListing(hour: hour),
              ],
            ),
            ElevatedButton(
              onPressed: () => context.push('/user'),
              child: Text("Zobacz wszystkich ludzi 👪"),
            ),
          ],
        ),
      ),
    );
  }
}
