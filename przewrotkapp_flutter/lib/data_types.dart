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
  final DateTime from;
  final DateTime to;
  final List<Rental> rentals;

  const RentalGroup({
    required this.from,
    required this.to,
    required this.rentals,
  });
}
