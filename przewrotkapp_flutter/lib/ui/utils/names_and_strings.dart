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
          ClothingType.jacket =>
            """Kurtki kajakowe są dość luźne, tak by można było założyć pod nie dodatkowe warstwy, nie krępując tym samym ruchów. 

Przykładowe orientacyjne rozmiary kurtek oraz odpowiadający im wzrost i waga:
• S - <165cm, <60kg
• M - 165-175cm, 60-75kg
• L - 175-180cm, 75-90kg
• XL - >180cm, >90kg

Pamiętaj jednak, że każda firma ma inną rozmiarówkę, dlatego najlepiej przymierzyć kurtkę przed wypożyczeniem.""",
          ClothingType.neopreneFoam =>
            """Pianka neoprenowa jest ciasna, dopasowana i wchodzi pod kurtkę. Zazwyczaj krępuje ruchy podczas pływania, ale można się do tego przyzwyczaić.

Poniżej są przykładowe orientacyjne rozmiary pianek oraz odpowiadający im wzrost i waga:
• S - <165cm, <60kg
• M - 165-175cm, 60-75kg
• L - 175-180cm, 75-90kg
• XL - >180cm, >90kg

Pamiętaj jednak, że każda firma ma inną rozmiarówkę, dlatego najlepiej przymierzyć odzież przed wypożyczeniem.""",
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
          tip: """Komory występują zazwyczaj w rozmiarach - 10 lub 20L:
• 20L wsadza się na tył kajaka (zazwyczaj dwie, jeśli przez środek przebiega przegroda)
• 10L wsadza się na przód kajaka, jeśli za podnóżkiem jest miejsce

Zazwyczaj więc na spływ bierze się dwie duże komory""",
        ),
    ],
    GearHelmet helmet => [
      (
        fieldName: "Rozmiar",
        value: helmet.size.humanName,
        tip: """Orientacyjne obwody głowy dla rozmiarów:
• S/M - 53-56cm
• M/L - 56-59cm
• L/XL - 59-61cm

Każda firma ma nieco inną rozmiarówkę, a dodatkowo w kaskach klubowych pływało wiele różnych kajakarzy, dlatego ich rozmiary mogą się różnić od standardowych. Najlepiej więc przymierzyć przed wypożyczeniem :)""",
      ),
    ],
    GearKayak kayak => [
      (
        fieldName: "Typ",
        value: kayak.type.humanName,
        tip: switch (kayak.type) {
          KayakType.creek =>
            "Kajak górski przystosowany do pływania trudnych rzek.\n\nJest zarówno dość krótki, jak i szeroki. Ma dużą wyporność, która pozwala na szybkie wynurzenie i łatwe utrzymywanie się na powierzchni. Duża zwrotność pomaga w manewrowaniu między kamieniami. Jest zbudowany z grubszego plastiku, co zapewnia bezpieczeństwo w trudnym terenie.",
          KayakType.riverRunner =>
            "Uniwersalny kajak górski, przystosowany do szybkiego pokonywania rzek o różnym stopniu trudności.\n\nŁączy cechy Creeka i Playboata - pozwala zarówno na bezpieczne spływy rzekami górskimi, jak i zabawę na falkach. Większa długość wpływa na rozwijanie prędkości i utrzymanie kierunku na rzece. Wymaga większych umiejętności na trudniejszych rzekach.",
          KayakType.halfSlice =>
            "Główną cechą, od której pochodzi nazwa, jest rozłożenie objętości - przód jest wyporny, co pomaga stabilnie przebijać się przez fale i odwoje, a rufa jest ścięta i ma małą objętość, co umożliwia wykonywanie trików freeslyle’owych.\n\nIdealny do nauki na łatwiejszych rzekach czy torach.",
          KayakType.fullSlice =>
            "Zaprojektowany głównie z myślą o freestyle’u.\n\nMała wyporność zarówno na dziobie, jak i rufie, krótki, zwrotny. Nie jest przystosowany do pływania trudnych rzek, ale idealny do nauki na rzekach łatwych.\n\nNie wybacza błędów, każdy zły przechył prowadzi do wywrotki, umożliwia częste ćwiczenie rolki :)",
          KayakType.playboat =>
            "Kajak pół-freestyle'owy służący do wykonywania trików na rzece, a niekoniecznie przemieszczania się z punktu A do B.\n\nJego budowa pozwala na łatwe zatapianie końców kajaka, zwrotność, obroty, skoki, surfowanie itp.\n\nĆwiczenie trików we freestyle'ówce na basenie czy torze rozwija jednak umiejętności, które potem można wykorzystać, pływając górską rzekę w innym kajaku.",
          KayakType.zwalkowy =>
            "Kajak przeznaczony do spływów nizinnych z dużą ilością przeszkód (drzewa, gałęzie).\n\nMa wytrzymały kadłub i dobrą stabilność, ale nie nadaje się na spływy górskie.",
          KayakType.dwuOsobowy =>
            "Łódka przeznaczona do pływania w dwie osoby, zazwyczaj w celach turystycznych, rekreacyjnych.",
          KayakType.kanadyjka =>
            "Jest to rodzaj rekreacyjnej otwartej łodzi wiosłowej o dużej stabilności i ładowności.\n\nPływa się w niej zazwyczaj w pozycji klęczącej lub siedzącej na ławeczce. Do napędzania kanu używa się wiosła z jednym piórem zwanego pagajem.",
        },
      ),
      if (kayak.minWeight != null || kayak.maxWeight != null)
        (
          fieldName: "Zakres wagowy",
          value: switch ((kayak.minWeight, kayak.maxWeight)) {
            (int min, int max) => '$min~$max kg',
            (int min, int? _) => 'Od $min kg w góre',
            (int? _, int max) => 'Do $max kg',
            (_, _) => '-nieznany-',
          },
          tip:
              "Warto stosować się do zakresu wagowego kajaka - ma to wpływ na bezpieczeństwo, zanurzenie łódki, jej wyporność i stabilność.\n\nPrzekroczenie wagi prowadzi do utraty stabilności kajaka i zwiększa ryzyko wywrotki.\n\nWybór zbyt dużego kajaka natomiast utrudnia naukę i oswajanie się z wywrotkami na łatwiejszych rzekach ze względu na wybaczanie błędów, a na trudniejszych utrudnia panowanie nad łódką.",
        ),
      (fieldName: "Długość", value: "${kayak.length}cm", tip: null),
    ],
    GearPaddle paddle => [
      (
        fieldName: "Długość",
        value: '${paddle.length.toString().replaceFirst(".0", "")}cm',
        tip:
            "Odpowiednia długość wiosła odpowiada wysokości kajakarza z ręką wyciągniętą do góry.\n\nIm dłuższe wiosło, tym trudniejsze może być wiosłowanie i rolka, jednak dla wysokich osób lub szerokiego kajaka jest ono wskazane. Używając krótszego można wiosłować bardziej agresywnie pionowo.",
      ),
      (
        fieldName: "Skręt pióra",
        value:
            '${paddle.rotation < 0 ? 'Regulowane do ${-paddle.rotation}' : '${paddle.rotation}'}°',
        tip:
            "Rotacja pióra zapewnia komfort i efektywność podczas wiosłowania.\n\nWiosła skrętne wymagają lekkiej rotacji nadgarstka, co zazwyczaj skutkuje łatwiejszemu wiosłowaniu, jednak każdy ma inne preferencje, dlatego warto wypróbować różne opcje.\n\nW kajakarstwie górskim najczęściej spotykane są kąty w okolicach 30 stopni.",
      ),
      (fieldName: "Typ", value: paddle.type.humanName, tip: null),
    ],
    GearPfd pfd => [
      (
        fieldName: "Typ",
        value: pfd.type.humanName,
        tip: switch (pfd.type) {
          PfdType.gorska =>
            "Kamizelka asekuracyjna zaprojektowana na rzeki górskie.\n\nMa dużą wyporność pozwalającą na utrzymanie kajakarza na powierzchni rwącej wody.\n\nNiektóre mają wbudowany pas przystosowany do wpięcia tzw. krowiego ogona, który umożliwia podpięcie się do rzutki podczas akcji ratunkowej, ale i szybkie jej wypięcie. Ma wbudowane liczne kieszenie i uchwyty.\n\nPomimo rozbudowanej konstrukcji pozwala na dużą swobodę ruchów podczas pływania.",
          PfdType.freestyle =>
            "Jest przystosowana do wykonywania trików na rzece.\n\nJej najważniejszą cechą jest zachowanie jak największej swobody ruchów. Jest lekka, ma mniejszą wyporność i jest dobrze dopasowana.\n\nMoże nie nadawać się na trudne górskie rzeki.",
          PfdType.nizinna =>
            "Kamizelka asekuracyjna do rekreacyjnego pływania rzek nizinnych.\n\nMa podstawową wyporność, niewystarczającą do pływania rzek górskich. Jest lżejsza i mniej rozbudowana niż kamizelka górska.",
        },
      ),
      (fieldName: "Rozmiar", value: pfd.size.humanName, tip: null),
    ],
    GearSpraydeck spraydeck => [
      (
        fieldName: "Rozmiar kokpitu",
        value: spraydeck.deckSize.humanName,
        tip:
            "Rozmiar pokładu fartucha (części, którą rozciąga się nad otworem kokpitu i jest mocowana do rantu) musi być dopasowany do rozmiaru kokpitu kajaka, aby samoczynnie nie spadł podczas płynięcia, ale jednocześnie był łatwo zrywalny przy kabinie.\n\nNajlepiej sprawdzić to na żywo.",
      ),
      (
        fieldName: "Rozmiar w pasie",
        value: spraydeck.waistSize.humanName,
        tip:
            """Pas fartucha powinien dość ciasno przylegać do ciała. Przykładowe zakresy obwodu w pasie:

• S - 65-75cm
• M - 75-85cm
• L - 85-95cm
• XL - 95 - 105cm

Jednak pas jest rozciągliwy, a rozmiary różnią się w zależności od marki, dlatego warto przymierzyć fartuch przed wypożyczeniem.""",
      ),
    ],
    GearThrowbag throwbag => [
      (
        fieldName: "Długość",
        value: "${throwbag.length}m",
        tip:
            "Długość rzutki, jaką wybierzemy na pływanko, zależy głównie od szerokości rzeki. Dłuższe rzutki są trudniejsze do celowania i klarowania.\n\nRzutka o długości 18m jest zazwyczaj odpowiednia.",
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
    HourCategory.helpAtEvent => "Pomoc przy innych wydarzeniach",
    HourCategory.helpAtGear => "Prace sprzętowe",
    HourCategory.donation => "Dotacja",
    HourCategory.functionary => "Funkcyjne",
    HourCategory.bonus => "Bonus",
    HourCategory.punishment => "Kara",
    HourCategory.other => "Inne",
  };
}
