import 'package:przewrotkapp_client/przewrotkapp_client.dart';

// WARNING: Different typedefs are recognized as equal if their actual types
// are equal!! That means, if you will make a provider here for
// typedef AllGear = List<Gear>
// and another for
// typedef OtherGear = List<Gear>
// they will fight each other!!!

typedef AllGearCache = List<GearPair>;

typedef FutureRentals = List<Rental>;

typedef SelfExtraUserInfo = ExtraUserInfo;

typedef UserFavourites = ({List<GearPair> gearPairs, List<int> gearIds});
