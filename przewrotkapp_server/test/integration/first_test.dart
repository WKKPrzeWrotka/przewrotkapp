import 'package:przewrotkapp_server/src/generated/gear/gear.dart';
import 'package:przewrotkapp_server/src/generated/gear/gear_kayak.dart';
import 'package:przewrotkapp_server/src/generated/gear/gear_type.dart';
import 'package:przewrotkapp_server/src/generated/gear/kayak_type.dart';
import 'package:przewrotkapp_server/src/generated/user/favourites.dart';
import 'package:serverpod/database.dart';
import 'package:serverpod_auth_server/module.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('First group', (sb, endpoints) {
    setUp(() async {
      final session = sb.build();
      final newUser = await Users.createUser(
        session,
        UserInfo(
          userIdentifier: 'dupa@12.pl',
          created: DateTime.now(),
          scopeNames: [],
          blocked: false,
        ),
      );
      sb = sb.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          newUser!.id!,
          newUser.scopes,
        ),
      );
      final newGear = await Gear.db.insertRow(
        session,
        Gear(clubId: 'KK-1', type: GearType.kayak),
      );
      await GearKayak.db.insertRow(
        session,
        GearKayak(gearId: newGear.id!, type: KayakType.zwalkowy, length: 200),
      );

      await FavouritesJunction.db.insertRow(
        session,
        FavouritesJunction(userId: newUser!.id!, gearId: newGear.id!),
      );
    });
    tearDown(() async {
      final t = Constant.bool(true);
      final session = sb.build();
      await Gear.db.deleteWhere(session, where: (_) => t);
      await UserInfo.db.deleteWhere(session, where: (_) => t);
    });

    test('very important test wow', () async {
      // FUN FACT - serverpod tests don't work for now 🎉
      final allKayaks = await endpoints.gearRead.getAllKayaks(sb);
      print(allKayaks);
    });
  }, rollbackDatabase: RollbackDatabase.disabled);
}
