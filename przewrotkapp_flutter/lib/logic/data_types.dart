import 'package:flutter/material.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

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
typedef DiscordEvent = ({String name, DateTime from, DateTime to});

typedef FutureDiscordEvents = List<DiscordEvent>;

typedef UnresolvedComments = List<Comment>;

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
  final DateTimeRange range;
  final List<Rental> rentals;

  const RentalGroup({this.name, required this.range, required this.rentals});
}
