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

enum CommentType implements _i1.SerializableModel {
  /// Nothing huge, still swim-able
  neutral,

  /// User should watch out and think again if they want to take it
  warning,

  /// Makes gear non-usable or unsafe
  broken;

  static CommentType fromJson(String name) {
    switch (name) {
      case 'neutral':
        return CommentType.neutral;
      case 'warning':
        return CommentType.warning;
      case 'broken':
        return CommentType.broken;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "CommentType"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
