import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kalender/kalender.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

String gearTypeToEmoji(GearType type) => switch (type) {
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

extension Pretty on DateTime {
  String toStringDate({bool showYear = true}) => "${showYear ? "$year-" : ""}"
      "${month.toString().padLeft(2, '0')}-"
      "${day.toString().padLeft(2, '0')}";
}

extension Defaults on DateTime {
  DateTime withDefaultRentalFromTime() => toUtc()
      .copyWith(hour: 4, minute: 0, second: 0, millisecond: 0, microsecond: 0);

  DateTime withDefaultRentalToTime() => toUtc()
      .copyWith(hour: 21, minute: 0, second: 0, millisecond: 0, microsecond: 0);
}

extension Logic on DateTimeRange {
  bool isSameDayRange(DateTimeRange other) =>
      toUtc().start.isSameDay(other.toUtc().start) &&
      toUtc().end.isSameDay(other.toUtc().end);
}

extension Human on GearType {
  String toHumanString() => switch (this) {
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
      };

  String toDisplayString() => gearTypeToEmoji(this) + toHumanString();
}

extension Handy<E> on List<E> {
  List<E> limit(int size) => sublist(0, min(length, size));
}

extension HumanGear on Gear {
  String displayName() => (manufacturer == null && model == null)
      ? friendlyName.toString()
      : '${manufacturer ?? ''} ${model ?? ''}'
          '${friendlyName != null ? ' ($friendlyName)' : ''}';

  String fullName() => [
        (clubId.toLowerCase()),
        if (manufacturer != null) manufacturer,
        if (model != null) model,
        if (friendlyName != null) friendlyName,
      ].join(" ");
}

extension HandyRental on Rental {
  List<Gear> get gear => junctions!.map((j) => j.gear!).toList();

  List<GearPair> gearPairs(List<GearPair> allGearSource) => allGearSource
      .where((p) => gear.map((g) => g.id).contains(p.gear.id))
      .toList();
}

extension EasyUser on ExtraUserInfo {
  // TODO: Maybe turn this into some cache way up in di.dart ?
  List<GearPair>? favourites(List<GearPair>? sourceAllGear) => sourceAllGear
      ?.where((g) => favouritesIds()?.contains(g.gear.id) ?? false)
      .toList();

  Iterable<int>? favouritesIds() => favouritesJunctions?.map((e) => e.gearId);
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
