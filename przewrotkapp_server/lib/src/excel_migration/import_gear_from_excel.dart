// ignore_for_file: avoid_print
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:csv/csv.dart';
import 'package:przewrotkapp_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod_auth_server/module.dart';

const _root = 'lib/src/excel_migration';

Future<void> importKayaksFromExcel({Session? session}) async {
  final kajakiCsv = File('$_root/kajaki.csv');
  final kajakiData = await kajakiCsv.readAsLines().then(
    (lines) => lines.map((line) => line.split(',')).toList(),
  );
  for (final line in kajakiData.sublist(1)) {
    // print(line);
    final gear = Gear(
      clubId: line[0],
      type: GearType.kayak,
      manufacturer: line[1].trim().isEmpty ? null : line[1],
      model: line[2].trim().isEmpty ? null : line[2],
      friendlyName: line[3].trim().isEmpty ? null : line[3],
    );
    final kayak = GearKayak(
      gearId: 0,
      type: KayakType.fromJson(line[4]),
      minWeight: line[5] == "NULL" ? null : int.parse(line[5]),
      maxWeight: line[6] == "NULL" ? null : int.parse(line[6]),
      length: int.parse(line[7]),
    );
    final newGear = await Gear.db.insertRow(session!, gear);
    await GearKayak.db.insertRow(session, kayak.copyWith(gearId: newGear.id));
  }
}

Future<void> importPaddlesFromExcel({Session? session}) async {
  final paddlesCsv = File('$_root/paddles.csv');
  final paddlesData = await paddlesCsv.readAsLines().then(
    (lines) => lines.map((line) => line.split(',')).toList(),
  );
  for (final line in paddlesData.sublist(1)) {
    final gear = Gear(
      clubId: line[0],
      type: GearType.paddle,
      manufacturer: line[1].trim().isEmpty ? null : line[1],
      model: line[2].trim().isEmpty ? null : line[2],
    );
    final paddle = GearPaddle(
      gearId: 0,
      type: PaddleType.fromJson(line[3]),
      length: double.parse(line[4]),
      rotation: int.parse(line[5]),
    );
    final newGear = await Gear.db.insertRow(session!, gear);
    await GearPaddle.db.insertRow(session, paddle.copyWith(gearId: newGear.id));
  }
}

Future<void> importSpraydecksFromExcel({Session? session}) async {
  final spraydecksCsv = File('$_root/spraydecks.csv');
  final spraydecksData = await spraydecksCsv.readAsLines().then(
    (lines) => lines.map((line) => line.split(',')).toList(),
  );
  for (final line in spraydecksData.sublist(1)) {
    final gear = Gear(
      clubId: line[0],
      type: GearType.spraydeck,
      manufacturer: line[1].trim().isEmpty ? null : line[1],
      model: line[2].trim().isEmpty ? null : line[2],
    );
    final spraydeck = GearSpraydeck(
      gearId: 0,
      deckSize: SpraydeckDeckSize.fromJson(line[3]),
      waistSize: GenericGearSize.fromJson(line[4]),
    );
    final newGear = await Gear.db.insertRow(session!, gear);
    await GearSpraydeck.db.insertRow(
      session,
      spraydeck.copyWith(gearId: newGear.id),
    );
  }
}

Future<void> importPfdsFromExcel({Session? session}) async {
  final pfdsCsv = File('$_root/pfds.csv');
  final pfdsData = await pfdsCsv.readAsLines().then(
    (lines) => lines.map((line) => line.split(',')).toList(),
  );
  for (final line in pfdsData.sublist(1)) {
    final gear = Gear(
      clubId: line[0],
      type: GearType.pfd,
      manufacturer: line[1].trim().isEmpty ? null : line[1],
      model: line[2].trim().isEmpty ? null : line[2],
      friendlyName: line[3].trim().isEmpty ? null : line[3],
    );
    final pfd = GearPfd(
      gearId: 0,
      size: GenericGearSize.fromJson(line[4]),
      type: PfdType.fromJson(line[5]),
    );
    final newGear = await Gear.db.insertRow(session!, gear);
    await GearPfd.db.insertRow(session, pfd.copyWith(gearId: newGear.id));
  }
}

Future<void> importHelmetsFromExcel({Session? session}) async {
  final helmetsCsv = File('$_root/helmets.csv');
  final helmetsData = await helmetsCsv.readAsLines().then(
    (lines) => lines.map((line) => line.split(',')).toList(),
  );
  for (final line in helmetsData.sublist(1)) {
    final gear = Gear(
      clubId: line[0],
      type: GearType.helmet,
      manufacturer: line[1].trim().isEmpty ? null : line[1],
      model: line[2].trim().isEmpty ? null : line[2],
    );
    final helmet = GearHelmet(
      gearId: 0,
      size: GenericGearSize.fromJson(line[3]),
    );
    final newGear = await Gear.db.insertRow(session!, gear);
    await GearHelmet.db.insertRow(session, helmet.copyWith(gearId: newGear.id));
  }
}

Future<void> importThrowbagsFromExcel({Session? session}) async {
  final throwbagsCsv = File('$_root/throwbags.csv');
  final throwbagsData = await throwbagsCsv.readAsLines().then(
    (lines) => lines.map((line) => line.split(',')).toList(),
  );
  for (final line in throwbagsData.sublist(1)) {
    final gear = Gear(
      clubId: line[0],
      type: GearType.throwbag,
      manufacturer: line[1].trim().isEmpty ? null : line[1],
      model: line[2].trim().isEmpty ? null : line[2],
      friendlyName: line[3].trim().isEmpty ? null : line[3],
    );
    final throwbag = GearThrowbag(gearId: 0, length: int.parse(line[4]));
    final newGear = await Gear.db.insertRow(session!, gear);
    await GearThrowbag.db.insertRow(
      session,
      throwbag.copyWith(gearId: newGear.id),
    );
  }
}

Future<void> importClothesFromExcel({Session? session}) async {
  final clothesCsv = File('$_root/clothes.csv');
  final clothesData = await clothesCsv.readAsLines().then(
    (lines) => lines.map((line) => line.split(',')).toList(),
  );
  for (final line in clothesData.sublist(1)) {
    final gear = Gear(
      clubId: line[0].trim(),
      type: GearType.clothing,
      manufacturer: line[1].trim().isEmpty ? null : line[1].trim(),
      model: line[2].trim().isEmpty ? null : line[2].trim(),
    );
    final clothing = GearClothing(
      gearId: 0,
      size: GenericGearSize.fromJson(line[3]),
      type: ClothingType.fromJson(line[4]),
      typeDescription: line[5].trim(),
    );
    final newGear = await Gear.db.insertRow(session!, gear);
    await GearClothing.db.insertRow(
      session,
      clothing.copyWith(gearId: newGear.id),
    );
  }
}

Future<void> importBeltsFromExcel({Session? session}) async {
  final clothesCsv = File('$_root/belts.csv');
  // this one uses lib because it has a lot of "strings"
  final beltsData = CsvToListConverter()
      .convert(
        (await clothesCsv.readAsLines()).join("\n"),
        shouldParseNumbers: false,
        convertEmptyTo: '',
        eol: '\n',
      )
      .map((e) => e.cast<String>())
      .toList();
  for (final line in beltsData.sublist(1).cast<List<String>>()) {
    final gear = Gear(
      clubId: line[0].trim(),
      type: GearType.belt,
      friendlyName: line[1].trim().isEmpty ? null : line[1].trim(),
    );
    final belt = GearBelt(gearId: 0, length: double.parse(line[2]));
    final newGear = await Gear.db.insertRow(session!, gear);
    await GearBelt.db.insertRow(session, belt.copyWith(gearId: newGear.id));
  }
}

Future<void> importFloatbagsFromExcel({Session? session}) async {
  final floatbagsCsv = File('$_root/floatbags.csv');
  final floatbagsData = await floatbagsCsv.readAsLines().then(
    (lines) => lines.map((line) => line.split(',')).toList(),
  );
  for (final line in floatbagsData.sublist(1)) {
    final gear = Gear(
      clubId: line[0].trim(),
      type: GearType.floatbag,
      manufacturer: line[1].trim().isEmpty ? null : line[1].trim(),
      model: line[2].trim().isEmpty ? null : line[2].trim(),
      friendlyName: line[3].trim().isEmpty ? null : line[3].trim(),
    );
    final floatbag = GearFloatbag(gearId: 0, volume: null);
    final newGear = await Gear.db.insertRow(session!, gear);
    await GearFloatbag.db.insertRow(
      session,
      floatbag.copyWith(gearId: newGear.id),
    );
  }
}

Future<void> importComments({
  Session? session,
  required int authorUserId,
}) async {
  final commentsCsv = File("$_root/komentarze-zuza.csv");
  // this one uses lib because it has a lot of "strings"
  final commentsData = CsvToListConverter()
      .convert(
        (await commentsCsv.readAsLines()).join("\n"),
        shouldParseNumbers: false,
        convertEmptyTo: '',
        eol: '\n',
      )
      .map((e) => e.cast<String>())
      .toList();
  final user = await UserInfo.db.findById(session!, authorUserId);
  user!;
  await session.db.transaction((t) async {
    for (final line in commentsData.sublist(1).cast<List<String>>()) {
      print(line);
      final gear = await Gear.db.findFirstRow(
        session,
        where: (g) => g.clubId.equals(line[0]),
        transaction: t,
      );
      await Comment.db.insertRow(
        session,
        Comment(
          byId: user.id!,
          gearId: gear!.id,
          type: CommentType.fromJson(line[2]),
          text: line[1],
        ),
        transaction: t,
      );
    }
  });
}
