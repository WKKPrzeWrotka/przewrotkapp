import 'dart:io';

import 'package:przewrotkapp_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

Future<void> importKayaksFromExcel({Session? session}) async {
  const _root = 'lib/src/excel_migration';
  final kajakiCsv = File('$_root/kajaki.csv');
  final kajakiData = await kajakiCsv
      .readAsLines()
      .then((lines) => lines.map((line) => line.split(',')).toList());
  for (final line in kajakiData.sublist(1)) {
    // print(line);
    final gear = Gear(
        clubId: line[0],
        manufacturer: line[1].trim().isEmpty ? null : line[1],
        model: line[2].trim().isEmpty ? null : line[2],
        friendlyName: line[3].trim().isEmpty ? null : line[3]);
    final kayak = GearKayak(
      gearId: 0,
      type: KayakType.fromJson(line[4]),
      minWeight: line[5] == "NULL" ? null : int.parse(line[5]),
      maxWeight: line[6] == "NULL" ? null : int.parse(line[6]),
      length: int.parse(line[7]),
    );
    final newGear = await Gear.db.insertRow(session!, gear);
    final newKayak = await GearKayak.db.insertRow(session, kayak.copyWith(gearId: newGear.id));
  }
}

void main() {
  importKayaksFromExcel();
}
