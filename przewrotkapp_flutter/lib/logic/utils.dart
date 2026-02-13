import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kalender/kalender.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

extension DateTimeRentalDefaults on DateTime {
  DateTime withDefaultRentalFromTime() => copyWith(
    hour: 4,
    minute: 0,
    second: 0,
    millisecond: 0,
    microsecond: 0,
    isUtc: true,
  );

  DateTime withDefaultRentalToTime() => copyWith(
    hour: 21,
    minute: 0,
    second: 0,
    millisecond: 0,
    microsecond: 0,
    isUtc: true,
  );
}

extension DateTimeRangeRentalLogic on DateTimeRange {
  DateTimeRange withDefaultRentalTimes() => DateTimeRange(
    start: start.withDefaultRentalFromTime(),
    end: end.withDefaultRentalToTime(),
  );

  bool isSameDayRange(DateTimeRange other) =>
      toUtc().start.isSameDay(other.toUtc().start) &&
      toUtc().end.isSameDay(other.toUtc().end);
}

extension DateTimeRangeParsing on DateTimeRange {
  static final dateFormat = DateFormat("y-MM-dd");
  static const dateSeparator = "~";

  String dateRangeString() =>
      '${dateFormat.format(start)}'
      '$dateSeparator'
      '${dateFormat.format(end)}';

  static DateTimeRange parseDateRangeString(String string) {
    final list = string
        .split(dateSeparator)
        .map((e) => dateFormat.parse(e, true))
        .toList();
    return DateTimeRange(
      start: list[0].withDefaultRentalFromTime(),
      end: list[1].withDefaultRentalToTime(),
    );
  }
}

extension StreamGodDamnit<T> on ValueListenable<T> {
  Stream<T> toStream() {
    late final StreamController<T> controller;

    void listener() {
      controller.add(value);
    }

    controller = StreamController<T>(
      onListen: () => addListener(listener),
      onPause: () => removeListener(listener),
      onResume: () => addListener(listener),
      onCancel: () {
        removeListener(listener);
        controller.close();
      },
    );
    return controller.stream;
  }
}

extension RentalHandy on Rental {
  List<Gear> get gear => junctions!.map((j) => j.gear!).toList();

  List<GearPair> gearPairs(List<GearPair> allGearSource) => allGearSource
      .where((p) => gear.map((g) => g.id).contains(p.gear.id))
      .toList();
}

extension HourHandy on Hour {
  static Hour empty(int userId) => Hour(
    userId: userId,
    amount: 0,
    description: '',
    category: HourCategory.helpAtGear,
    date: DateTime.now().copyWith(hour: 12),
  );
}

extension CommentHandy on Comment {
  static Comment empty(int byId) => Comment(
    byId: byId,
    dateCreated: DateTime.now(),
    type: CommentType.warning,
    text: "",
  );
}
