import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../../logic/data_types.dart';
import '../../common/hour_listing.dart';

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
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              constraints: BoxConstraints(maxHeight: 200),
              child: Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                thickness: 8,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (awaiting?.hours.isEmpty ?? false)
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          child: Text("Nie ma żadnych :D", style: tt.bodyLarge),
                        ),
                      for (final hour in awaiting?.hours ?? <Hour>[])
                        HourListing(hour: hour),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
