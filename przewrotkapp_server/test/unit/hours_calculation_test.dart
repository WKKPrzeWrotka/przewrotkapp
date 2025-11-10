import 'dart:math';

import 'package:przewrotkapp_client/hours_calculations.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_client/scopes.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  // Those, being functions, prevents grouping them as same in Sets
  final random = Random();
  kayak() => GearPair(
    gear: Gear(clubId: random.nextDouble().toString(), type: GearType.kayak),
    gearExtra: GearKayak(gearId: 0, type: KayakType.creek, length: 0),
  );
  dwuosobowy() => GearPair(
    gear: Gear(clubId: random.nextDouble().toString(), type: GearType.kayak),
    gearExtra: GearKayak(gearId: 0, type: KayakType.dwuOsobowy, length: 0),
  );
  kanadyjka() => GearPair(
    gear: Gear(clubId: random.nextDouble().toString(), type: GearType.kayak),
    gearExtra: GearKayak(gearId: 0, type: KayakType.kanadyjka, length: 0),
  );
  others() => {
    for (final type
        in (GearType.values.toList()..remove(GearType.kayak)) +
            [GearType.floatbag])
      GearPair(
        gear: Gear(clubId: random.nextDouble().toString(), type: type),
        gearExtra: GearExtra(),
      ),
  };
  standardSet() => {kayak(), ...others()};

  group("Hours calculation tests", () {
    test("1 kayak-others", () => expect(hoursForGear(standardSet(), 1, {}), 2));
    test(
      "1 kayak-others for 10 days",
      () => expect(hoursForGear(standardSet(), 10, {}), 20),
    );
    test(
      "1 kayak + 3 others, for 4 days",
      () => expect(
        hoursForGear({kayak(), ...others(), ...others(), ...others()}, 4, {}),
        16,
      ),
    );
    test(
      "3 others, for 4 days",
      () => expect(
        hoursForGear({...others(), ...others(), ...others()}, 4, {}),
        12,
      ),
    );
    test("1 kanadyjka", () => expect(hoursForGear({kanadyjka()}, 1, {}), 4));
    test("1 dwuosobowy", () => expect(hoursForGear({dwuosobowy()}, 1, {}), 4));
    test(
      "1 kanadyjka + 2 others",
      () => expect(
        hoursForGear({kanadyjka(), ...others(), ...others()}, 1, {}),
        4,
      ),
    );
    test(
      "1 dwuosobowy + 2 others",
      () => expect(
        hoursForGear({dwuosobowy(), ...others(), ...others()}, 1, {}),
        4,
      ),
    );
    test(
      "1 kanadyjka + 3 others",
      () => expect(
        hoursForGear(
          {kanadyjka(), ...others(), ...others(), ...others()},
          1,
          {},
        ),
        5,
      ),
    );
    test(
      "1 kanadyjka + 4 others",
      () => expect(
        hoursForGear(
          {kanadyjka(), ...others(), ...others(), ...others(), ...others()},
          1,
          {},
        ),
        6,
      ),
    );
    test(
      "1 others + 1 paddle",
      () => expect(
        hoursForGear(
          {
            ...others(),
            GearPair(
              gear: Gear(clubId: 'dup-12', type: GearType.paddle),
              gearExtra: GearPaddle(
                gearId: 0,
                type: PaddleType.zwalkowe,
                length: 0,
                rotation: 0,
              ),
            ),
          },
          1,
          {},
        ),
        2,
      ),
    );
    test(
      "1 kayak-others by Zarzad",
      () => expect(hoursForGear(standardSet(), 1, {PrzeScope.zarzad}), 0),
    );
    test(
      "1 others by Zarzad",
      () => expect(hoursForGear(others(), 1, {PrzeScope.zarzad}), 0),
    );
    test("1 kayak-others + 1 others by Zarzad", () {
      expect(
        hoursForGear({...standardSet(), ...others()}, 1, {PrzeScope.zarzad}),
        1,
      );
    });
    test(
      "2 kayak-others by Zarzad",
      () => expect(
        hoursForGear(
          {...standardSet(), ...standardSet()},
          1,
          {PrzeScope.zarzad},
        ),
        2,
      ),
    );
    test(
      "1 kanadyjka by Zarzad",
      () => expect(hoursForGear({kanadyjka()}, 1, {PrzeScope.zarzad}), 0),
    );
    test(
      "1 kanadyjka + 2 others by Zarzad",
      () => expect(
        hoursForGear(
          {kanadyjka(), ...others(), ...others()},
          1,
          {PrzeScope.zarzad},
        ),
        0,
      ),
    );
    test(
      "1 kanadyjka + 3 others by Zarzad",
      () => expect(
        hoursForGear(
          {kanadyjka(), ...others(), ...others(), ...others()},
          1,
          {PrzeScope.zarzad},
        ),
        1,
      ),
    );
    test(
      "1 kanadyjka + 1 kayak + 2 others by Zarzad",
      () => expect(
        hoursForGear(
          {kanadyjka(), kayak(), ...others(), ...others()},
          1,
          {PrzeScope.zarzad},
        ),
        2,
      ),
    );
    test(
      "1 kanadyjka + 1 kayak + 3 others by Zarzad",
      () => expect(
        hoursForGear(
          {kanadyjka(), kayak(), ...others(), ...others(), ...others()},
          1,
          {PrzeScope.zarzad},
        ),
        2,
      ),
    );
    test(
      "1 kanadyjka + 1 kayak + 4 others by Zarzad",
      () => expect(
        hoursForGear(
          {
            kanadyjka(),
            kayak(),
            ...others(),
            ...others(),
            ...others(),
            ...others(),
          },
          1,
          {PrzeScope.zarzad},
        ),
        3,
      ),
    );
    test(
      "2 kanadyjkas Zarzad",
      () => expect(
        hoursForGear({kanadyjka(), kanadyjka()}, 1, {PrzeScope.zarzad}),
        4,
      ),
    );
    test(
      "2 kanadyjkas + 4 others Zarzad",
      () => expect(
        hoursForGear(
          {
            kanadyjka(),
            kanadyjka(),
            ...others(),
            ...others(),
            ...others(),
            ...others(),
          },
          1,
          {PrzeScope.zarzad},
        ),
        4,
      ),
    );
    test(
      "2 kanadyjkas + 6 others Zarzad",
      () => expect(
        hoursForGear(
          {
            kanadyjka(),
            kanadyjka(),
            ...others(),
            ...others(),
            ...others(),
            ...others(),
            ...others(),
            ...others(),
          },
          1,
          {PrzeScope.zarzad},
        ),
        6,
      ),
    );
    test(
      "1 kanadyjka, 1 dwuosobowy, 1 kayak, 6 others by Zarzad",
      () => expect(
        hoursForGear(
          {
            kanadyjka(),
            dwuosobowy(),
            kayak(),
            ...others(),
            ...others(),
            ...others(),
            ...others(),
            ...others(),
            ...others(),
          },
          1,
          {PrzeScope.zarzad},
        ),
        7,
      ),
    );
  });
}
