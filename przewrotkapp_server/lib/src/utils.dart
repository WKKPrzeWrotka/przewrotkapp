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
