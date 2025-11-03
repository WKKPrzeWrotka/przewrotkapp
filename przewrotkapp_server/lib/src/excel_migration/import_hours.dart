import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:csv/csv.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

import '../generated/hour.dart';
import '../generated/hour_category.dart';

const _root = 'lib/src/excel_migration';

Future<void> importHoursFromExcel(Session session) async {
  final godzinkiCsv = File('$_root/godzinki.csv');

  final godzinkiData = CsvToListConverter()
      .convert(
        (await godzinkiCsv.readAsLines()).join("\n"),
        shouldParseNumbers: false,
        convertEmptyTo: '',
        eol: '\n',
      )
      .map((e) => e.cast<String>())
      .toList();
  await session.db.transaction((t) async {
    for (final line in godzinkiData.sublist(2)) {
      final user = await UserInfo.db.findFirstRow(
        session,
        where: (u) => u.email.equals(line[3]),
        transaction: t,
      );
      final godzinka = Hour(
        userId: user!.id!,
        amount: int.parse(line[4]),
        description: line[5].trim(),
        category: HourCategory.fromJson(line[6]),
        date: DateTime.parse(line[7]).copyWith(hour: 12),
        approved: true
      );
      await Hour.db.insertRow(session, godzinka, transaction: t);
    }
  });
}
