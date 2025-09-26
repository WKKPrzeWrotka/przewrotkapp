import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import 'gear_thumbnail.dart';

class GearChip extends StatelessWidget {
  final GearPair gearPair;

  const GearChip({super.key, required this.gearPair});

  @override
  Widget build(BuildContext context) {
    final g = gearPair.gear;
    return ActionChip(
      onPressed: () => context.push('/gear/${g.clubId}'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      avatar: Container(
        decoration: BoxDecoration(shape: BoxShape.circle),
        clipBehavior: Clip.antiAlias,
        child: GearThumbnail(gearPair: gearPair, width: 64, height: 64, fit: BoxFit.cover,),
      ),
      label: Text(gearPair.gear.clubId),
    );
  }
}
