import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

extension GearTypeNamesAndStuff on GearType {
  String get emoji => switch (this) {
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

  String get humanName => switch (this) {
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

  String toDisplayString() => emoji + humanName;
}

extension UserInfoNaming on UserInfo {
  String get name =>
      userName ?? fullName?.split(' ').firstOrNull ?? '-nieznany-';
}

extension DateTimePretty on DateTime {
  String toStringDate({bool showYear = true}) =>
      "${showYear ? "$year-" : ""}"
      "${month.toString().padLeft(2, '0')}-"
      "${day.toString().padLeft(2, '0')}";
}

extension GearHuman on Gear {
  String get displayName => (manufacturer == null && model == null)
      ? (friendlyName ?? clubId)
      : '${manufacturer ?? ''} ${model ?? ''}'
            '${friendlyName != null ? ' ($friendlyName)' : ''}';

  String get fullName => [
    (clubId.toLowerCase()),
    if (manufacturer != null) manufacturer,
    if (model != null) model,
    if (friendlyName != null) friendlyName,
  ].join(" ");
}
