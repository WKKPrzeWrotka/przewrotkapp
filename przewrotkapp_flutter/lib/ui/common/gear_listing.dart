import 'package:flutter/material.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

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
          '${gear.manufacturer ?? ''} ${gear.model ?? ''}'
          '${gear.friendlyName != null ? ' (${gear.friendlyName})' : ''}',
        ),
        subtitle: switch (subtypeData) {
          GearKayak kayak =>
            Text('${kayak.type}, ${kayak.minWeight}-${kayak.maxWeight}kg'),
          GearPaddle paddle =>
            Text('${paddle.length}cm, ${paddle.rotation}°, ${paddle.type}'),
          _ => Text('to jest dupa')
        },
        trailing: trailing,
        // tileColor: Colors.red,
      ),
    );
  }
}
