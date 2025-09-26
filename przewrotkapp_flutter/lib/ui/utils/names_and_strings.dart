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

extension ClothingTypeNamesAndStuff on ClothingType {
  String get humanName => switch (this) {
    ClothingType.jacket => 'Kurtka',
    ClothingType.neopreneFoam => 'Pianka',
  };
}

extension KayakTypeNamesAndStuff on KayakType {
  String get humanName => switch (this) {
    KayakType.creek => 'Creek',
    KayakType.riverRunner => 'RiverRunner',
    KayakType.halfSlice => 'Half-slice',
    KayakType.fullSlice => 'Full-slice',
    KayakType.playboat => 'Playboat',
    KayakType.zwalkowy => 'Zwałkowy',
    KayakType.dwuOsobowy => 'Dwuosobowy',
    KayakType.kanadyjka => 'Kanadyjka',
  };
}

extension PaddleTypeNamesAndStuff on PaddleType {
  String get humanName => switch (this) {
    PaddleType.gorskie => 'Górskie',
    PaddleType.nizinne => 'Nizinne',
    PaddleType.zwalkowe => 'Zwałkowe',
    PaddleType.pagaj => 'Pagaj',
  };
}

extension PfdTypeNamesAndStuff on PfdType {
  String get humanName => switch (this) {
    PfdType.gorska => 'Górska',
    PfdType.freestyle => 'Freestyle',
    PfdType.nizinna => 'Nizinna',
  };
}

extension GenericGearSizeNamesAndStuff on GenericGearSize {
  String get humanName =>
      name.replaceAll('kids', 'Dziecięce ').replaceAll('Or', '/').toUpperCase();
}

extension SpraydeckDeckSizeNamesAndStuff on SpraydeckDeckSize {
  String get humanName => switch (this) {
    SpraydeckDeckSize.huge => 'Huge deck',
    SpraydeckDeckSize.big => 'Big deck',
    SpraydeckDeckSize.small => 'Small deck',
  };
}

extension GearExtraHumanInfo on GearExtra {
  String? get extraHumanInfo => switch (this) {
    GearBelt belt => "${belt.length}m",
    GearClothing clothing =>
      "${clothing.type.humanName}${clothing.typeDescription != null ? ", ${clothing.typeDescription}" : ""}",
    GearFloatbag floatbag =>
      floatbag.volume != null ? "${floatbag.volume}L" : null,
    GearHelmet helmet => helmet.size.humanName,
    GearKayak kayak =>
      '${kayak.type.humanName}${switch ((kayak.minWeight, kayak.maxWeight)) {
        (int min, int max) => ', $min~$max kg',
        (int min, int? _) => ', Od $min kg w góre',
        (int? _, int max) => ', Do $max kg',
        (_, _) => '',
      }}',
    GearPaddle paddle =>
      '${paddle.length.toString().replaceFirst(".0", "")}cm, ${paddle.rotation < 0 ? 'regulowane do ${-paddle.rotation}' : '${paddle.rotation}'}°, ${paddle.type.humanName}',
    GearPfd pfd => "${pfd.type.humanName}, ${pfd.size.humanName}",
    GearSpraydeck spraydeck =>
      "${spraydeck.deckSize.humanName}, pas ${spraydeck.waistSize.humanName}",
    GearThrowbag throwbag => "${throwbag.length}m",
    _ => null,
  };
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
