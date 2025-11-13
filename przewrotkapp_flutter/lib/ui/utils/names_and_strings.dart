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

// TODO: Format them a bit to make more readable
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
            """Kurtki kajakowe są dość luźne, tak by można było założyć pod nie dodatkowe warstwy, nie krępując tym samym ruchów. Poniżej podane są przykładowe orientacyjne rozmiary kurtek oraz odpowiadający im wzrost i waga:
- S - <165cm, <60kg;
- M - 165-175cm, 60-75kg;
- L - 175-180cm, 75-90kg;
- XL - >180cm, >90kg.
Pamiętaj jednak, że każda firma ma inną rozmiarówkę, dlatego najlepiej przymierzyć kurtkę przed wypożyczeniem.""",
          ClothingType.neopreneFoam =>
            """Pianka neoprenowa jest ciasna, dopasowana i wchodzi pod kurtkę. Zazwyczaj krępuje ruchy podczas pływania, ale można się do tego przyzwyczaić. Poniżej podane są przykładowe orientacyjne rozmiary pianek oraz odpowiadający im wzrost i waga:
- S - <165cm, <60kg;
- M - 165-175cm, 60-75kg;
- L - 175-180cm, 75-90kg;
- XL - >180cm, >90kg.
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
          tip:
              "Komory występują zazwyczaj w dwóch rozmiarach 10L i 20L. Komorę o pojemności 20L wsadza się na tył kajaka (dwie, jeśli przez środek przebiega przegroda). Komory o pojemności 10L wsadza się na przód kajaka - po jednej na każdą stronę przegrody. Używane są w kajakach z miejscem na dziobie za podnóżkiem. W przypadku kajaków bez podnóżka lub z niewielką przestrzenią na dziobie użycie tych komór nie jest konieczne.",
        ),
    ],
    GearHelmet helmet => [
      (
        fieldName: "Rozmiar",
        value: helmet.size.humanName,
        tip: """
- S/M - kask pasujący osobom o obwodzie głowy 53-56cm
- M/L - 56-59cm
- L/XL - 59-61cm
Jeżeli Twój obwód głowy jest na granicy dwóch rozmiarów, lepiej wziąć większy - wtedy pod kask wejdzie też czepek neoprenowy. Każda firma ma nieco inną rozmiarówkę, a dodatkowo w kaskach klubowych pływało wiele różnych kajakarzy, dlatego ich rozmiary mogą się różnić od standardowych. Najlepiej więc przymierzyć przed wypożyczeniem :)""",
      ),
    ],
    GearKayak kayak => [
      (
        fieldName: "Typ",
        value: kayak.type.humanName,
        tip: switch (kayak.type) {
          KayakType.creek =>
            "Jest to rodzaj kajaka górskiego przystosowanego do pływania trudnych rzek. Jest zarówno dość krótki, jak i szeroki. Ma dużą wyporność, która pozwala na szybkie wynurzenie i łatwe utrzymywanie się na powierzchni. Duża zwrotność pomaga w manewrowaniu między kamieniami. Jest zbudowany z wytrzymałych materiałów, co zapewnia bezpieczeństwo w trudnym terenie.",
          KayakType.riverRunner =>
            "Jest to uniwersalny kajak górski przystosowany do dynamicznego pokonywania rzek o różnym stopniu trudności. Łączy cechy creeka i playboata - pozwala zarówno na bezpieczne spływy rzekami górskimi, jak i zabawę na falkach. Płaski spód ułatwia surfowania na falach i zapewnia stabilność. Większa długość wpływa na rozwijanie prędkości i utrzymanie kierunku na rzece. Wymaga większych umiejętności na trudniejszych rzekach.",
          KayakType.halfSlice =>
            "Główną cechą, od której pochodzi nazwa, jest rozłożenie objętości. Przód kajaka jest wyporny, co pomaga stabilnie przebijać się przez fale i odwoje, natomiast rufa jest ścięta i ma małą objętość, co umożliwia wykonywanie trików freeslyle’owych. Idealny do nauki na łatwiejszych rzekach czy torach.",
          KayakType.fullSlice =>
            "Jest on zaprojektowany głównie z myślą o freestyle’u. Mała wyporność zarówno na dziobie, jak i rufie, krótki, zwrotny. Nie jest przystosowany do pływania trudnych rzek, jednak idealny do nauki na rzekach łatwych. Nie wybacza błędów, każdy zły przechył prowadzi do wywrotki, umożliwia częste ćwiczenie rolki :)",
          KayakType.playboat =>
            "Jest to typowy kajak freestyle’owy służący do wykonywania trików na rzece, a nie do przemieszczania się z punktu A do punktu B. Jego budowa pozwala na łatwe zatapianie końców kajaka, zwrotność, obroty, skoki, surfowanie itp. Ćwiczenie trików we freestyle’ówce na basenie czy torze rozwija jednak umiejętności, które potem można wykorzystać, pływając górską rzekę w innym kajaku.",
          KayakType.zwalkowy =>
            "Kajak przeznaczony do spływów nizinnych z dużą ilością przeszkód (drzewa, gałęzie). Ma wytrzymały kadłub i dużą zwrotność ułatwiającą manewrowania.",
          KayakType.dwuOsobowy =>
            "Łódka przeznaczona do pływania w dwie osoby, zazwyczaj w celach turystycznych, rekreacyjnych.",
          KayakType.kanadyjka =>
            "Jest to rodzaj rekreacyjnej otwartej łodzi wiosłowej o dużej stabilności i ładowności. Pływa się w niej zazwyczaj w pozycji klęczącej lub siedzącej na ławeczce. Do napędzania kanu używa się wiosła z jednym piórem zwanego pagajem.",
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
        tip:
            "Warto stosować się do zakresu wagowego kajaka, bo  ma to wpływ na bezpieczeństwo, zanurzenie łódki, jej wyporność i stabilność. Przekroczenie wagi prowadzi do utraty stabilności kajaka i zwiększa ryzyko wywrotki. Wybór zbyt dużego kajaka natomiast utrudnia naukę i oswajanie się z wywrotkami na łatwiejszych rzekach ze względu na wybaczanie błędów, a na trudniejszych utrudnia panowanie nad łódką.",
      ),
    ],
    GearPaddle paddle => [
      (
        fieldName: "Długość",
        value: '${paddle.length.toString().replaceFirst(".0", "")}cm',
        tip:
            "Odpowiednia długość wiosła odpowiada wysokości kajakarza z ręką wyciągniętą do góry. Im dłuższe wiosło, tym trudniejsze może być wiosłowanie i rolka, jednak dla wysokich osób lub szerokiego kajaka jest ono wskazane. Używając krótszego można wiosłować bardziej agresywnie pionowo.",
      ),
      (
        fieldName: "Skręt pióra",
        value:
            '${paddle.rotation < 0 ? 'Regulowane do ${-paddle.rotation}' : '${paddle.rotation}'}°',
        tip:
            "Rotacja pióra zapewnia komfort i efektywność podczas wiosłowania. Wiosła skrętne wymagają lekkiej rotacji nadgarstka, co zazwyczaj skutkuje łatwiejszemu wiosłowaniu, jednak każdy ma inne preferencje, dlatego warto wypróbować różne opcje. W kajakarstwie górskim najczęściej spotykane są kąty w okolicach 30 stopni. Wiosła proste nie wymagają skrętu nadgarstka podczas wiosłowania.",
      ),
      (fieldName: "Typ", value: paddle.type.humanName, tip: null),
    ],
    GearPfd pfd => [
      (
        fieldName: "Typ",
        value: pfd.type.humanName,
        tip: switch (pfd.type) {
          PfdType.gorska =>
            "Jest to kamizelka asekuracyjna zaprojektowana z myślą o rzekach górskich. Ma dużą wyporność pozwalającą na utrzymanie kajakarza na powierzchni rwącej wody. Ma wbudowany pas przystosowany do wpięcia tzw. krowiego ogona, który umożliwia podpięcie się do rzutki podczas akcji ratunkowej, ale i szybkie jej wypięcie. Ma wbudowane liczne kieszenie i uchwyty. Pomimo rozbudowanej konstrukcji pozwala na dużą swobodę ruchów podczas pływania.",
          PfdType.freestyle =>
            "Jest przystosowana do wykonywania trików na rzece. Jej najważniejszą cechą jest zachowanie jak największej swobody ruchów. Jest lekka, ma mniejszą wyporność i jest dobrze dopasowana.",
          PfdType.nizinna =>
            "Jest to rodzaj kamizelki asekuracyjnej do rekreacyjnego pływania rzek nizinnych. Ma podstawową wyporność, niewystarczającą do pływania rzek górskich. Jest lżejsza i mniej rozbudowana niż kamizelka górska.",
        },
      ),
      (fieldName: "Rozmiar", value: pfd.size.humanName, tip: null),
    ],
    GearSpraydeck spraydeck => [
      (
        fieldName: "Rozmiar kokpitu",
        value: spraydeck.deckSize.humanName,
        tip:
            "Rozmiar pokładu fartucha (części, którą rozciąga się nad otworem kokpitu i jest mocowana do jego rantu) musi być dopasowany do rozmiaru kokpitu kajaka, aby samoczynnie nie spadł podczas płynięcia, ale jednocześnie był łatwo zrywalny przy kabinie. Najlepiej sprawdzić to na żywo.",
      ),
      (
        fieldName: "Rozmiar w pasie",
        value: spraydeck.waistSize.humanName,
        tip:
            """Pas fartucha powinien dość ciasno przylegać do ciała. Przykładowe zakresy:
- S - obwód w pasie 65-75cm,
- M - 75-85cm,
- L - 85-95cm,
- XL - 95 - 105cm.
Jednak pas jest rozciągliwy, a rozmiary różnią się w zależności od marki, dlatego warto przymierzyć fartuch przed wypożyczeniem.""",
      ),
    ],
    GearThrowbag throwbag => [
      (
        fieldName: "Długość",
        value: "${throwbag.length}m",
        tip:
            "Długość rzutki, jaką wybierzemy na pływanko, zależy głównie od szerokości rzeki. Dłuższe rzutki są trudniejsze do celowania i klarowania. Rzutka o długości 18m jest zazwyczaj odpowiednia.",
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
