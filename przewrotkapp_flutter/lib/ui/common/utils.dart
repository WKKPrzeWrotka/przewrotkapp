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
