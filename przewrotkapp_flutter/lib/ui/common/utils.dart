import 'dart:math';

import 'package:przewrotkapp_client/przewrotkapp_client.dart';

String gearTypeToEmoji(GearType type) => switch (type) {
      GearType.belt => '🪢',
      GearType.clothing => '👕',
      GearType.floatbag => '🎈',
      GearType.helmet => '🪖',
      GearType.kayak => '🛶',
      GearType.paddle => '🪏',
      GearType.pfd => '🛟',
      GearType.spraydeck => '👗',
      GearType.throwbag => '🤾',
      GearType.other => '❓',
    };

extension Pretty on DateTime {
  String toStringDate({bool showYear = true}) => "${showYear ? "$year-" : ""}"
      "${month.toString().padLeft(2, '0')}-"
      "${day.toString().padLeft(2, '0')}";
}

extension Human on GearType {
  String toHumanString() => switch (this) {
        GearType.belt => "Pasy transportowe",
        GearType.clothing => "Ubrania",
        GearType.floatbag => "Komory",
        GearType.helmet => "Kaski",
        GearType.kayak => "Kajaki",
        GearType.paddle => "Wiosła",
        GearType.pfd => "Kamizelki",
        GearType.spraydeck => "Fartuchy",
        GearType.throwbag => "Rzutki",
        GearType.other => "Inne",
      };

  String toDisplayString() => gearTypeToEmoji(this) + toHumanString();
}

extension Handy<E> on List<E> {
  List<E> limit(int size) => sublist(0, min(length, size));
}

extension HumanGear on Gear {
  String displayName() => (manufacturer == null && model == null)
      ? friendlyName.toString()
      : '${manufacturer ?? ''} ${model ?? ''}'
          '${friendlyName != null ? ' ($friendlyName)' : ''}';
}
