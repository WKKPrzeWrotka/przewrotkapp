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

enum GenericGearSize implements _i1.SerializableModel {
  kidsXs,
  kidsS,
  kidsM,
  kidsL,
  kidsXl,
  xxs,
  xxsOrXs,
  xs,
  xsOrS,
  s,
  sOrM,
  m,
  mOrL,
  l,
  lOrXl,
  xl,
  xlOrXxl,
  xxl;

  static GenericGearSize fromJson(String name) {
    switch (name) {
      case 'kidsXs':
        return GenericGearSize.kidsXs;
      case 'kidsS':
        return GenericGearSize.kidsS;
      case 'kidsM':
        return GenericGearSize.kidsM;
      case 'kidsL':
        return GenericGearSize.kidsL;
      case 'kidsXl':
        return GenericGearSize.kidsXl;
      case 'xxs':
        return GenericGearSize.xxs;
      case 'xxsOrXs':
        return GenericGearSize.xxsOrXs;
      case 'xs':
        return GenericGearSize.xs;
      case 'xsOrS':
        return GenericGearSize.xsOrS;
      case 's':
        return GenericGearSize.s;
      case 'sOrM':
        return GenericGearSize.sOrM;
      case 'm':
        return GenericGearSize.m;
      case 'mOrL':
        return GenericGearSize.mOrL;
      case 'l':
        return GenericGearSize.l;
      case 'lOrXl':
        return GenericGearSize.lOrXl;
      case 'xl':
        return GenericGearSize.xl;
      case 'xlOrXxl':
        return GenericGearSize.xlOrXxl;
      case 'xxl':
        return GenericGearSize.xxl;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "GenericGearSize"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
