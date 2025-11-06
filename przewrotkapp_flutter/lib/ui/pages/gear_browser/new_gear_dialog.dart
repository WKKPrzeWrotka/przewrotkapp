import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../utils/names_and_strings.dart';

class NewGearDialog extends StatefulWidget {
  const NewGearDialog({super.key});

  @override
  State<NewGearDialog> createState() => _NewGearDialogState();
}

class _NewGearDialogState extends State<NewGearDialog> {
  final GearPair newPair = GearPair(
    gear: Gear(clubId: '', type: GearType.kayak),
    gearExtra: GearKayak(gearId: -1, type: KayakType.creek, length: -1),
  );
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              DropdownMenuFormField(
                initialSelection: newPair.gear.type,
                dropdownMenuEntries: GearType.values
                    .map(
                      (e) => DropdownMenuEntry(
                        value: e,
                        label: e.emoji + e.humanName(plural: false),
                      ),
                    )
                    .toList(),
                onSelected: (t) {
                  newPair.gear.type = t!;
                  newPair.gearExtra = emptyExtra(t);
                },
                label: Text("Typ"),
              ),
              TextFormField(
                onChanged: (t) => newPair.gear.clubId = t.trim().toUpperCase(),
                validator: (t) =>
                    t?.trim().isEmpty ?? true ? "Nie może być puste!" : null,
                decoration: InputDecoration(
                  label: Text("Klubowe ID (KK-01, WK-10, KS-03 itp)"),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FilledButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      context.push(
                        '/gear/${newPair.gear.clubId}/edit?emptyFields=true',
                        extra: newPair,
                      );
                    }
                  },
                  child: Text("Okej"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GearExtra emptyExtra(GearType type) => switch (type) {
    GearType.belt => GearBelt(gearId: -1, length: -1),
    GearType.clothing => GearClothing(
      gearId: -1,
      size: GenericGearSize.m,
      type: ClothingType.neopreneFoam,
    ),
    GearType.floatbag => GearFloatbag(gearId: -1),
    GearType.helmet => GearHelmet(gearId: -1, size: GenericGearSize.m),
    GearType.kayak => GearKayak(gearId: -1, type: KayakType.creek, length: -1),
    GearType.paddle => GearPaddle(
      gearId: -1,
      type: PaddleType.gorskie,
      length: -1,
      rotation: 180,
    ),
    GearType.pfd => GearPfd(
      gearId: -1,
      size: GenericGearSize.m,
      type: PfdType.gorska,
    ),
    GearType.spraydeck => GearSpraydeck(
      gearId: -1,
      deckSize: SpraydeckDeckSize.huge,
      waistSize: GenericGearSize.m,
    ),
    GearType.throwbag => GearThrowbag(gearId: -1, length: -1),
    GearType.other => throw UnimplementedError(),
  };
}
