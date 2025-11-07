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

  String humanName({bool plural = true}) => plural
      ? switch (this) {
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
        }
      : switch (this) {
          GearType.belt => "Pas transportowy",
          GearType.clothing => "Ubranie",
          GearType.floatbag => "Komora",
          GearType.helmet => "Kask",
          GearType.kayak => "Kajak",
          GearType.paddle => "Wiosło",
          GearType.pfd => "Kamizelka",
          GearType.spraydeck => "Fartuch",
          GearType.throwbag => "Rzutka",
          GearType.other => "Inne",
        };

  String toDisplayString({bool plural = true}) =>
      emoji + humanName(plural: plural);
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
  List<({String fieldName, String value, String? tip})>
  get extraHumanInfo => switch (this) {
    GearBelt belt => [
      (fieldName: "Długość", value: "${belt.length}m", tip: null),
    ],
    GearClothing clothing => [
      (
        fieldName: "Typ",
        value: clothing.type.humanName,
        tip: switch (clothing.type) {
          ClothingType.jacket => "<TU WYPEŁNIĆ>",
          ClothingType.neopreneFoam => "<TU WYPEŁNIĆ>",
        },
      ),
      if (clothing.typeDescription != null)
        (fieldName: "Opis", value: clothing.typeDescription!, tip: null),
    ],
    GearFloatbag floatbag => [
      if (floatbag.volume != null)
        (
          fieldName: "Objętość",
          value: "${floatbag.volume}L",
          tip: "<TU WYPEŁNIĆ>",
        ),
    ],
    GearHelmet helmet => [
      (
        fieldName: "Rozmiar",
        value: helmet.size.humanName,
        tip: "<TU WYPEŁNIĆ>",
      ),
    ],
    GearKayak kayak => [
      (
        fieldName: "Typ",
        value: kayak.type.humanName,
        tip: switch (kayak.type) {
          KayakType.creek => "<TU WYPEŁNIĆ>",
          KayakType.riverRunner => "<TU WYPEŁNIĆ>",
          KayakType.halfSlice => "<TU WYPEŁNIĆ>",
          KayakType.fullSlice => "<TU WYPEŁNIĆ>",
          KayakType.playboat => "<TU WYPEŁNIĆ>",
          KayakType.zwalkowy => "<TU WYPEŁNIĆ>",
          KayakType.dwuOsobowy => "<TU WYPEŁNIĆ>",
          KayakType.kanadyjka => "<TU WYPEŁNIĆ>",
        },
      ),
      (
        fieldName: "Zakres wagowy",
        value: switch ((kayak.minWeight, kayak.maxWeight)) {
          (int min, int max) => '$min~$max kg',
          (int min, int? _) => 'Od $min kg w góre',
          (int? _, int max) => 'Do $max kg',
          (_, _) => '',
        },
        tip: "<TU WYPEŁNIĆ>",
      ),
    ],
    GearPaddle paddle => [
      (
        fieldName: "Długość",
        value: '${paddle.length.toString().replaceFirst(".0", "")}cm',
        tip: "<TU WYPEŁNIĆ>",
      ),
      (
        fieldName: "Skręt pióra",
        value:
            '${paddle.rotation < 0 ? 'Regulowane do ${-paddle.rotation}' : '${paddle.rotation}'}°',
        tip: "<TU WYPEŁNIĆ>",
      ),
      (fieldName: "Typ", value: paddle.type.humanName, tip: null),
    ],
    GearPfd pfd => [
      (
        fieldName: "Typ",
        value: pfd.type.humanName,
        tip: switch (pfd.type) {
          PfdType.gorska => "<TU WYPEŁNIĆ>",
          PfdType.freestyle => "<TU WYPEŁNIĆ>",
          PfdType.nizinna => "<TU WYPEŁNIĆ>",
        },
      ),
      (fieldName: "Rozmiar", value: pfd.size.humanName, tip: null),
    ],
    GearSpraydeck spraydeck => [
      (
        fieldName: "Rozmiar kokpitu",
        value: spraydeck.deckSize.humanName,
        tip: "<TU WYPEŁNIĆ>",
      ),
      (
        fieldName: "Rozmiar w pasie",
        value: spraydeck.waistSize.humanName,
        tip: "<TU WYPEŁNIĆ>",
      ),
    ],
    GearThrowbag throwbag => [
      (
        fieldName: "Długość",
        value: "${throwbag.length}m",
        tip: "<TU WYPEŁNIĆ>",
      ),
    ],
    _ => [],
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

extension HourCategoryNaming on HourCategory {
  String get humanName => switch (this) {
    HourCategory.rental => "Wypożyczenie",
    HourCategory.helpAtCourse => "Pomoc przy szkoleniówce",
    HourCategory.helpAtPromotion => "Pomoc w promocji klubu",
    HourCategory.helpAtEvent =>"Pomoc przy innych wydarzeniach",
    HourCategory.helpAtGear => "Prace sprzętowe",
    HourCategory.donation => "Dotacja",
    HourCategory.functionary => "Funkcyjne",
    HourCategory.bonus => "Bonus",
    HourCategory.punishment => "Kara",
    HourCategory.other => "Inne",
  };
}
