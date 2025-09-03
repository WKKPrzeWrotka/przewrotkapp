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
import 'exceptions/kayak_exception.dart' as _i2;
import 'gear/clothing_type.dart' as _i3;
import 'gear/gear.dart' as _i4;
import 'gear/gear_belt.dart' as _i5;
import 'gear/gear_clothing.dart' as _i6;
import 'gear/gear_floatbag.dart' as _i7;
import 'gear/gear_helmet.dart' as _i8;
import 'gear/gear_kayak.dart' as _i9;
import 'gear/gear_paddle.dart' as _i10;
import 'gear/gear_pfd.dart' as _i11;
import 'gear/gear_spraydeck.dart' as _i12;
import 'gear/gear_throwbag.dart' as _i13;
import 'gear/gear_type.dart' as _i14;
import 'gear/generic_gear_size.dart' as _i15;
import 'gear/kayak_type.dart' as _i16;
import 'gear/paddle_type.dart' as _i17;
import 'gear/pfd_type.dart' as _i18;
import 'gear/spraydeck_deck_size.dart' as _i19;
import 'package:przewrotkapp_client/src/protocol/gear/gear_belt.dart' as _i20;
import 'package:przewrotkapp_client/src/protocol/gear/gear_clothing.dart'
    as _i21;
import 'package:przewrotkapp_client/src/protocol/gear/gear_floatbag.dart'
    as _i22;
import 'package:przewrotkapp_client/src/protocol/gear/gear_helmet.dart' as _i23;
import 'package:przewrotkapp_client/src/protocol/gear/gear_kayak.dart' as _i24;
import 'package:przewrotkapp_client/src/protocol/gear/gear_paddle.dart' as _i25;
import 'package:przewrotkapp_client/src/protocol/gear/gear_pfd.dart' as _i26;
import 'package:przewrotkapp_client/src/protocol/gear/gear_spraydeck.dart'
    as _i27;
import 'package:przewrotkapp_client/src/protocol/gear/gear_throwbag.dart'
    as _i28;
export 'exceptions/kayak_exception.dart';
export 'gear/clothing_type.dart';
export 'gear/gear.dart';
export 'gear/gear_belt.dart';
export 'gear/gear_clothing.dart';
export 'gear/gear_floatbag.dart';
export 'gear/gear_helmet.dart';
export 'gear/gear_kayak.dart';
export 'gear/gear_paddle.dart';
export 'gear/gear_pfd.dart';
export 'gear/gear_spraydeck.dart';
export 'gear/gear_throwbag.dart';
export 'gear/gear_type.dart';
export 'gear/generic_gear_size.dart';
export 'gear/kayak_type.dart';
export 'gear/paddle_type.dart';
export 'gear/pfd_type.dart';
export 'gear/spraydeck_deck_size.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.KayakException) {
      return _i2.KayakException.fromJson(data) as T;
    }
    if (t == _i3.ClothingType) {
      return _i3.ClothingType.fromJson(data) as T;
    }
    if (t == _i4.Gear) {
      return _i4.Gear.fromJson(data) as T;
    }
    if (t == _i5.GearBelt) {
      return _i5.GearBelt.fromJson(data) as T;
    }
    if (t == _i6.GearClothing) {
      return _i6.GearClothing.fromJson(data) as T;
    }
    if (t == _i7.GearFloatbag) {
      return _i7.GearFloatbag.fromJson(data) as T;
    }
    if (t == _i8.GearHelmet) {
      return _i8.GearHelmet.fromJson(data) as T;
    }
    if (t == _i9.GearKayak) {
      return _i9.GearKayak.fromJson(data) as T;
    }
    if (t == _i10.GearPaddle) {
      return _i10.GearPaddle.fromJson(data) as T;
    }
    if (t == _i11.GearPfd) {
      return _i11.GearPfd.fromJson(data) as T;
    }
    if (t == _i12.GearSpraydeck) {
      return _i12.GearSpraydeck.fromJson(data) as T;
    }
    if (t == _i13.GearThrowbag) {
      return _i13.GearThrowbag.fromJson(data) as T;
    }
    if (t == _i14.GearType) {
      return _i14.GearType.fromJson(data) as T;
    }
    if (t == _i15.GenericGearSize) {
      return _i15.GenericGearSize.fromJson(data) as T;
    }
    if (t == _i16.KayakType) {
      return _i16.KayakType.fromJson(data) as T;
    }
    if (t == _i17.PaddleType) {
      return _i17.PaddleType.fromJson(data) as T;
    }
    if (t == _i18.PfdType) {
      return _i18.PfdType.fromJson(data) as T;
    }
    if (t == _i19.SpraydeckDeckSize) {
      return _i19.SpraydeckDeckSize.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.KayakException?>()) {
      return (data != null ? _i2.KayakException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.ClothingType?>()) {
      return (data != null ? _i3.ClothingType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Gear?>()) {
      return (data != null ? _i4.Gear.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.GearBelt?>()) {
      return (data != null ? _i5.GearBelt.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.GearClothing?>()) {
      return (data != null ? _i6.GearClothing.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.GearFloatbag?>()) {
      return (data != null ? _i7.GearFloatbag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.GearHelmet?>()) {
      return (data != null ? _i8.GearHelmet.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.GearKayak?>()) {
      return (data != null ? _i9.GearKayak.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.GearPaddle?>()) {
      return (data != null ? _i10.GearPaddle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.GearPfd?>()) {
      return (data != null ? _i11.GearPfd.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.GearSpraydeck?>()) {
      return (data != null ? _i12.GearSpraydeck.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.GearThrowbag?>()) {
      return (data != null ? _i13.GearThrowbag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.GearType?>()) {
      return (data != null ? _i14.GearType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.GenericGearSize?>()) {
      return (data != null ? _i15.GenericGearSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.KayakType?>()) {
      return (data != null ? _i16.KayakType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.PaddleType?>()) {
      return (data != null ? _i17.PaddleType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.PfdType?>()) {
      return (data != null ? _i18.PfdType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.SpraydeckDeckSize?>()) {
      return (data != null ? _i19.SpraydeckDeckSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<Uri>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<Uri>(e)).toList()
          : null) as T;
    }
    if (t == List<_i20.GearBelt>) {
      return (data as List).map((e) => deserialize<_i20.GearBelt>(e)).toList()
          as T;
    }
    if (t == List<_i21.GearClothing>) {
      return (data as List)
          .map((e) => deserialize<_i21.GearClothing>(e))
          .toList() as T;
    }
    if (t == List<_i22.GearFloatbag>) {
      return (data as List)
          .map((e) => deserialize<_i22.GearFloatbag>(e))
          .toList() as T;
    }
    if (t == List<_i23.GearHelmet>) {
      return (data as List).map((e) => deserialize<_i23.GearHelmet>(e)).toList()
          as T;
    }
    if (t == List<_i24.GearKayak>) {
      return (data as List).map((e) => deserialize<_i24.GearKayak>(e)).toList()
          as T;
    }
    if (t == List<_i25.GearPaddle>) {
      return (data as List).map((e) => deserialize<_i25.GearPaddle>(e)).toList()
          as T;
    }
    if (t == List<_i26.GearPfd>) {
      return (data as List).map((e) => deserialize<_i26.GearPfd>(e)).toList()
          as T;
    }
    if (t == List<_i27.GearSpraydeck>) {
      return (data as List)
          .map((e) => deserialize<_i27.GearSpraydeck>(e))
          .toList() as T;
    }
    if (t == List<_i28.GearThrowbag>) {
      return (data as List)
          .map((e) => deserialize<_i28.GearThrowbag>(e))
          .toList() as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.KayakException) {
      return 'KayakException';
    }
    if (data is _i3.ClothingType) {
      return 'ClothingType';
    }
    if (data is _i4.Gear) {
      return 'Gear';
    }
    if (data is _i5.GearBelt) {
      return 'GearBelt';
    }
    if (data is _i6.GearClothing) {
      return 'GearClothing';
    }
    if (data is _i7.GearFloatbag) {
      return 'GearFloatbag';
    }
    if (data is _i8.GearHelmet) {
      return 'GearHelmet';
    }
    if (data is _i9.GearKayak) {
      return 'GearKayak';
    }
    if (data is _i10.GearPaddle) {
      return 'GearPaddle';
    }
    if (data is _i11.GearPfd) {
      return 'GearPfd';
    }
    if (data is _i12.GearSpraydeck) {
      return 'GearSpraydeck';
    }
    if (data is _i13.GearThrowbag) {
      return 'GearThrowbag';
    }
    if (data is _i14.GearType) {
      return 'GearType';
    }
    if (data is _i15.GenericGearSize) {
      return 'GenericGearSize';
    }
    if (data is _i16.KayakType) {
      return 'KayakType';
    }
    if (data is _i17.PaddleType) {
      return 'PaddleType';
    }
    if (data is _i18.PfdType) {
      return 'PfdType';
    }
    if (data is _i19.SpraydeckDeckSize) {
      return 'SpraydeckDeckSize';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'KayakException') {
      return deserialize<_i2.KayakException>(data['data']);
    }
    if (dataClassName == 'ClothingType') {
      return deserialize<_i3.ClothingType>(data['data']);
    }
    if (dataClassName == 'Gear') {
      return deserialize<_i4.Gear>(data['data']);
    }
    if (dataClassName == 'GearBelt') {
      return deserialize<_i5.GearBelt>(data['data']);
    }
    if (dataClassName == 'GearClothing') {
      return deserialize<_i6.GearClothing>(data['data']);
    }
    if (dataClassName == 'GearFloatbag') {
      return deserialize<_i7.GearFloatbag>(data['data']);
    }
    if (dataClassName == 'GearHelmet') {
      return deserialize<_i8.GearHelmet>(data['data']);
    }
    if (dataClassName == 'GearKayak') {
      return deserialize<_i9.GearKayak>(data['data']);
    }
    if (dataClassName == 'GearPaddle') {
      return deserialize<_i10.GearPaddle>(data['data']);
    }
    if (dataClassName == 'GearPfd') {
      return deserialize<_i11.GearPfd>(data['data']);
    }
    if (dataClassName == 'GearSpraydeck') {
      return deserialize<_i12.GearSpraydeck>(data['data']);
    }
    if (dataClassName == 'GearThrowbag') {
      return deserialize<_i13.GearThrowbag>(data['data']);
    }
    if (dataClassName == 'GearType') {
      return deserialize<_i14.GearType>(data['data']);
    }
    if (dataClassName == 'GenericGearSize') {
      return deserialize<_i15.GenericGearSize>(data['data']);
    }
    if (dataClassName == 'KayakType') {
      return deserialize<_i16.KayakType>(data['data']);
    }
    if (dataClassName == 'PaddleType') {
      return deserialize<_i17.PaddleType>(data['data']);
    }
    if (dataClassName == 'PfdType') {
      return deserialize<_i18.PfdType>(data['data']);
    }
    if (dataClassName == 'SpraydeckDeckSize') {
      return deserialize<_i19.SpraydeckDeckSize>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
