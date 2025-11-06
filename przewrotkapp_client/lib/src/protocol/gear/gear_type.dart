/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum GearType implements _i1.SerializableModel {
  belt,
  clothing,
  floatbag,
  helmet,
  kayak,
  paddle,
  pfd,
  spraydeck,
  throwbag,

  /// Avoid if possible!!
  other;

  static GearType fromJson(String name) {
    switch (name) {
      case 'belt':
        return GearType.belt;
      case 'clothing':
        return GearType.clothing;
      case 'floatbag':
        return GearType.floatbag;
      case 'helmet':
        return GearType.helmet;
      case 'kayak':
        return GearType.kayak;
      case 'paddle':
        return GearType.paddle;
      case 'pfd':
        return GearType.pfd;
      case 'spraydeck':
        return GearType.spraydeck;
      case 'throwbag':
        return GearType.throwbag;
      case 'other':
        return GearType.other;
      default:
        throw ArgumentError('Value "$name" cannot be converted to "GearType"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
