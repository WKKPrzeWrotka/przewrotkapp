import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'ui/common/utils.dart';

List<GearPair> searchGear(
  List<GearPair> gear, {
  String? text,
  Set<GearType>? types,
}) {
  text = text?.trim().toLowerCase() ?? "";
  types ??= GearType.values.toSet();
  return gear.where((g) {
    final gear = g.gear;
    // Type check
    if (!types!.contains(gear.type)) return false;
    // Search text check
    if (text!.isNotEmpty && !gear.fullName().toLowerCase().contains(text)) {
      return false;
    }
    // Well, you passed
    return true;
  }).toList(growable: false);
}

List<GearPair> sortGear(List<GearPair> gear, Iterable<int> favouritesIds) {
  return gear
    ..sort((a, b) {
      final aFav = favouritesIds.contains(a.gear.id);
      final bFav = favouritesIds.contains(b.gear.id);
      final favCmp = switch ((aFav, bFav)) {
        (true, true) => 0,
        (false, false) => 0,
        (true, false) => -1,
        (false, true) => 1,
      };
      if (favCmp != 0) return favCmp;
      final l = a.gear.clubId.length.compareTo(b.gear.clubId.length);
      return l != 0 ? l : a.gear.clubId.compareTo(b.gear.clubId);
    });
}
