import 'dart:math';

import 'package:przewrotkapp_client/hours_calculations.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_client/scopes.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  // Those, being functions, prevents grouping them as same in Sets
  final random = Random();
  kayak() => {
    GearPair(
      gear: Gear(clubId: random.nextDouble().toString(), type: GearType.kayak),
      gearExtra: GearExtra(),
    ),
  };
  others() => {
    for (final type
        in (GearType.values.toList()..remove(GearType.kayak)) +
            [GearType.floatbag])
      GearPair(
        gear: Gear(clubId: random.nextDouble().toString(), type: type),
        gearExtra: GearExtra(),
      ),
  };
  standardSet() => {...kayak(), ...others()};

  group("Hours calculation tests", () {
    test("1 kayak-others", () => expect(hoursForGear(standardSet(), 1, {}), 2));
    test(
      "1 kayak-others for 10 days",
      () => expect(hoursForGear(standardSet(), 10, {}), 20),
    );
    test(
      "1 kayak + 3 others, for 4 days",
      () => expect(
        hoursForGear(
          {...kayak(), ...others(), ...others(), ...others()},
          4,
          {},
        ),
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
  });
}
