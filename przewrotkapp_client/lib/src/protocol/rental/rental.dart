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
import '../rental/rental_junction.dart' as _i2;

abstract class Rental implements _i1.SerializableModel {
  Rental._({
    this.id,
    required this.created,
    required this.lastModified,
    required this.from,
    required this.to,
    this.junctions,
  });

  factory Rental({
    int? id,
    required DateTime created,
    required DateTime lastModified,
    required DateTime from,
    required DateTime to,
    List<_i2.RentalJunction>? junctions,
  }) = _RentalImpl;

  factory Rental.fromJson(Map<String, dynamic> jsonSerialization) {
    return Rental(
      id: jsonSerialization['id'] as int?,
      created: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['created']),
      lastModified:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastModified']),
      from: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['from']),
      to: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['to']),
      junctions: (jsonSerialization['junctions'] as List?)
          ?.map((e) => _i2.RentalJunction.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime created;

  DateTime lastModified;

  DateTime from;

  DateTime to;

  List<_i2.RentalJunction>? junctions;

  /// Returns a shallow copy of this [Rental]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Rental copyWith({
    int? id,
    DateTime? created,
    DateTime? lastModified,
    DateTime? from,
    DateTime? to,
    List<_i2.RentalJunction>? junctions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'created': created.toJson(),
      'lastModified': lastModified.toJson(),
      'from': from.toJson(),
      'to': to.toJson(),
      if (junctions != null)
        'junctions': junctions?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RentalImpl extends Rental {
  _RentalImpl({
    int? id,
    required DateTime created,
    required DateTime lastModified,
    required DateTime from,
    required DateTime to,
    List<_i2.RentalJunction>? junctions,
  }) : super._(
          id: id,
          created: created,
          lastModified: lastModified,
          from: from,
          to: to,
          junctions: junctions,
        );

  /// Returns a shallow copy of this [Rental]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Rental copyWith({
    Object? id = _Undefined,
    DateTime? created,
    DateTime? lastModified,
    DateTime? from,
    DateTime? to,
    Object? junctions = _Undefined,
  }) {
    return Rental(
      id: id is int? ? id : this.id,
      created: created ?? this.created,
      lastModified: lastModified ?? this.lastModified,
      from: from ?? this.from,
      to: to ?? this.to,
      junctions: junctions is List<_i2.RentalJunction>?
          ? junctions
          : this.junctions?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
