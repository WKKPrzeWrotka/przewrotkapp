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

abstract class KayakException
    implements _i1.SerializableException, _i1.SerializableModel {
  KayakException._({
    required this.kayakId,
    this.message,
  });

  factory KayakException({
    required String kayakId,
    String? message,
  }) = _KayakExceptionImpl;

  factory KayakException.fromJson(Map<String, dynamic> jsonSerialization) {
    return KayakException(
      kayakId: jsonSerialization['kayakId'] as String,
      message: jsonSerialization['message'] as String?,
    );
  }

  String kayakId;

  String? message;

  /// Returns a shallow copy of this [KayakException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  KayakException copyWith({
    String? kayakId,
    String? message,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'kayakId': kayakId,
      if (message != null) 'message': message,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _KayakExceptionImpl extends KayakException {
  _KayakExceptionImpl({
    required String kayakId,
    String? message,
  }) : super._(
          kayakId: kayakId,
          message: message,
        );

  /// Returns a shallow copy of this [KayakException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  KayakException copyWith({
    String? kayakId,
    Object? message = _Undefined,
  }) {
    return KayakException(
      kayakId: kayakId ?? this.kayakId,
      message: message is String? ? message : this.message,
    );
  }
}
