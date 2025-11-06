/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum KayakType implements _i1.SerializableModel {
  creek,
  riverRunner,
  halfSlice,
  fullSlice,
  playboat,
  zwalkowy,
  dwuOsobowy,
  kanadyjka;

  static KayakType fromJson(String name) {
    switch (name) {
      case 'creek':
        return KayakType.creek;
      case 'riverRunner':
        return KayakType.riverRunner;
      case 'halfSlice':
        return KayakType.halfSlice;
      case 'fullSlice':
        return KayakType.fullSlice;
      case 'playboat':
        return KayakType.playboat;
      case 'zwalkowy':
        return KayakType.zwalkowy;
      case 'dwuOsobowy':
        return KayakType.dwuOsobowy;
      case 'kanadyjka':
        return KayakType.kanadyjka;
      default:
        throw ArgumentError('Value "$name" cannot be converted to "KayakType"');
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
