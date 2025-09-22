import 'package:intl/intl.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import 'ui/common/utils.dart';

// WARNING: Different typedefs are recognized as equal if their actual types
// are equal!! That means, if you will make a provider here for
// typedef AllGear = List<Gear>
// and another for
// typedef OtherGear = List<Gear>
// they will fight each other!!!

typedef AllGearCache = List<GearPair>;

typedef FutureRentals = List<Rental>;

typedef FutureRentalGroups = List<RentalGroup>;

typedef SelfExtraUserInfo = ExtraUserInfo;

typedef UserFavourites = ({List<GearPair> gearPairs, List<int> gearIds});

// maybe separate class some day, but now it's enough
typedef DiscordEvent = ({
  String name,
  DateTime from,
  DateTime to,
});

typedef FutureDiscordEvents = List<DiscordEvent>;

class GearSearchParams {
  final String? text;
  final Set<GearType>? types;

  const GearSearchParams({this.text, this.types});

  static const GearSearchParams mainDefault = GearSearchParams(
    text: null,
    types: {GearType.kayak},
  );
}

class RentalGroup {
  final String? name;
  final DateTime from;
  final DateTime to;
  final List<Rental> rentals;

  const RentalGroup({
    this.name,
    required this.from,
    required this.to,
    required this.rentals,
  });

  // TODO-maybe: change this all to DateTimeRange extension?
  static final dateFormat = DateFormat("y-MM-dd");
  static const dateSeparator = "~";

  static String dateRangeString(DateTime from, DateTime to) =>
      '${dateFormat.format(from)}'
      '$dateSeparator'
      '${dateFormat.format(to)}';

  static (DateTime from, DateTime to) parseDateRangeString(String string) {
    final list = string
        .split(RentalGroup.dateSeparator)
        .map((e) => RentalGroup.dateFormat.parse(e))
        .toList();
    return (
      list[0].withDefaultRentalFromTime(),
      list[1].withDefaultRentalToTime()
    );
  }
}
