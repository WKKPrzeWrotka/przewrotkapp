import 'package:flutter/material.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_flutter/ui/common/utils.dart';

class GearListing extends StatelessWidget {
  final Gear gear;
  final dynamic subtypeData;
  final Widget? trailing;

  const GearListing({
    super.key,
    required this.gear,
    this.subtypeData,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final emoji = gearTypeToEmoji(gear.type);
    return Card(
      child: ListTile(
        leading: AspectRatio(
          aspectRatio: 1.777,
          child: gear.photoUrls?.firstOrNull != null
              ? ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(6),
                  child: Image.network(
                    gear.photoUrls!.first.toString(),
                  ),
                )
              : Icon(Icons.kayaking),
        ),
        title: Text(
          "$emoji "
          "${(gear.manufacturer == null && gear.model == null) ? gear.friendlyName.toString() : '${gear.manufacturer ?? ''} ${gear.model ?? ''}'
              '${gear.friendlyName != null ? ' (${gear.friendlyName})' : ''}'}",
        ),
        subtitle: Text(
          switch (subtypeData) {
            GearBelt belt => "${belt.length}m",
            GearClothing clothing =>
              "${clothing.type}${clothing.typeDescription != null ? ", ${clothing.typeDescription}" : ""}",
            GearFloatbag floatbag =>
              floatbag.volume != null ? "${floatbag.volume}L" : "",
            GearHelmet helmet => "${helmet.size}",
            GearKayak kayak =>
              '${kayak.type}, ${kayak.minWeight}-${kayak.maxWeight}kg',
            GearPaddle paddle =>
              '${paddle.length.toString().replaceFirst(".0", "")}cm, ${paddle.rotation}°, ${paddle.type}',
            GearPfd pfd => "${pfd.type}, ${pfd.size}",
            GearSpraydeck spraydeck =>
              "${spraydeck.deckSize}, ${spraydeck.waistSize}",
            GearThrowbag throwbag => "${throwbag.length}m",
            _ => 'to jest dupa',
          },
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(gear.clubId, style: Theme.of(context).textTheme.bodyMedium),
            if (trailing != null) trailing!,
          ],
        ),
        // tileColor: Colors.red,
      ),
    );
  }
}
