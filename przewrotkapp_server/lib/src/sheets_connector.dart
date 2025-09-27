// ignore_for_file: avoid_print
import 'package:gsheets/gsheets.dart';
import 'package:serverpod/serverpod.dart';

Future<List<String>> getSkladkaEmails(String googleToken,
    {Session? session}) async {
  const skladkiId = '1tQufWO5b12n0grBEqDw6E1HHgsrlH9Rrajy5d74fBRw';
  const sheetId = 590740679;
  final gs = GSheets(googleToken);
  final sheet = await gs.spreadsheet(skladkiId);
  final rows =
      await sheet.sheets.firstWhere((s) => s.id == sheetId).values.allRows();
  final nonEmptyRows = rows.where((r) => r[0].isNotEmpty || r[1].isNotEmpty);
  final emails = nonEmptyRows.where((r) {
    if (r.elementAtOrNull(3)?.trim().isEmpty ?? true) {
      session?.log('${r[0]} ${r[1]} doenst have email!', level: LogLevel.info);
      return false;
    }
    return true;
  }).map((r) => r[3].trim());
  if (emails.length < 10) {
    throw "List is under 10 - something is very wrong, "
        "either with the code, or the club";
    // elo pomelo
  }
  return emails.toList();
}
