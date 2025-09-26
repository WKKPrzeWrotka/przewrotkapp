import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kalender/kalender.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

extension Defaults on DateTime {
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

extension Logic on DateTimeRange {
  DateTimeRange withDefaultRentalTimes() => DateTimeRange(
    start: start.withDefaultRentalFromTime(),
    end: end.withDefaultRentalToTime(),
  );

  bool isSameDayRange(DateTimeRange other) =>
      toUtc().start.isSameDay(other.toUtc().start) &&
      toUtc().end.isSameDay(other.toUtc().end);
}

extension Handy<E> on List<E> {
  List<E> limit(int size) => sublist(0, min(length, size));
}

extension HandyGear on Gear {
  Uri? get thumbnailOrFist => thumbnailUrl ?? photoUrls?.firstOrNull;
}

extension SlyUri on Uri {
  String? get blurhash => queryParameters['blurhash'];

  int? get width => int.tryParse(queryParameters['width'] ?? '');

  int? get height => int.tryParse(queryParameters['height'] ?? '');
}

extension HandyRental on Rental {
  List<Gear> get gear => junctions!.map((j) => j.gear!).toList();

  List<GearPair> gearPairs(List<GearPair> allGearSource) => allGearSource
      .where((p) => gear.map((g) => g.id).contains(p.gear.id))
      .toList();
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
