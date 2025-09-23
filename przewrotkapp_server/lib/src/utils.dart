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

Stream<T> watchX<T>(Future<T> Function() getX, Stream updateStream) async* {
  yield await getX();
  await for (final _ in updateStream) {
    yield await getX();
  }
}
