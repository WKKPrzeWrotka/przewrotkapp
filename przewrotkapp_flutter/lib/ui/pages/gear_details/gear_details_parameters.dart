import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../utils/names_and_strings.dart';

class GearDetailsParameters extends StatelessWidget {
  final GearPair gearPair;

  const GearDetailsParameters({super.key, required this.gearPair});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    final gear = gearPair.gear;
    final extra = gearPair.gearExtra;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(gear.displayName, style: tt.headlineMedium),
        Divider(),
        for (final info in extra.extraHumanInfo)
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 8,
            children: [
              Text("${info.fieldName}:", style: tt.headlineSmall),
              Text(info.value, style: tt.headlineSmall),
              if (info.tip != null)
                SizedBox(
                  width: 36,
                  height: 36,
                  child: IconButton(
                    iconSize: 20,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              spacing: 16,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  // TODO: Finally take care of styling some day
                                  // and mae bodyMedium look berable
                                  child: Text(info.tip!, style: tt.bodyLarge),
                                ),
                                ElevatedButton(
                                  onPressed: () => context.pop(),
                                  child: Text("Okej"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.info_outline),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
