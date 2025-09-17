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
import 'gear/gear_belt.dart' as _i4;
import 'gear/gear_clothing.dart' as _i5;
import 'gear/gear_floatbag.dart' as _i6;
import 'gear/gear_helmet.dart' as _i7;
import 'gear/gear_kayak.dart' as _i8;
import 'gear/gear_paddle.dart' as _i9;
import 'gear/gear_pfd.dart' as _i10;
import 'gear/gear_spraydeck.dart' as _i11;
import 'gear/gear_throwbag.dart' as _i12;
import 'gear/gear.dart' as _i13;
import 'gear/gear_extra.dart' as _i14;
import 'gear/gear_pair.dart' as _i15;
import 'gear/gear_type.dart' as _i16;
import 'gear/generic_gear_size.dart' as _i17;
import 'gear/kayak_type.dart' as _i18;
import 'gear/paddle_type.dart' as _i19;
import 'gear/pfd_type.dart' as _i20;
import 'gear/spraydeck_deck_size.dart' as _i21;
import 'rental/rental.dart' as _i22;
import 'rental/rental_junction.dart' as _i23;
import 'user/extra_user_info.dart' as _i24;
import 'user/favourites.dart' as _i25;
import 'package:przewrotkapp_client/src/protocol/gear/gear.dart' as _i26;
import 'package:przewrotkapp_client/src/protocol/gear/gear_belt.dart' as _i27;
import 'package:przewrotkapp_client/src/protocol/gear/gear_clothing.dart'
    as _i28;
import 'package:przewrotkapp_client/src/protocol/gear/gear_floatbag.dart'
    as _i29;
import 'package:przewrotkapp_client/src/protocol/gear/gear_helmet.dart' as _i30;
import 'package:przewrotkapp_client/src/protocol/gear/gear_kayak.dart' as _i31;
import 'package:przewrotkapp_client/src/protocol/gear/gear_paddle.dart' as _i32;
import 'package:przewrotkapp_client/src/protocol/gear/gear_pfd.dart' as _i33;
import 'package:przewrotkapp_client/src/protocol/gear/gear_spraydeck.dart'
    as _i34;
import 'package:przewrotkapp_client/src/protocol/gear/gear_throwbag.dart'
    as _i35;
import 'package:przewrotkapp_client/src/protocol/rental/rental.dart' as _i36;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i37;
export 'exceptions/kayak_exception.dart';
export 'gear/clothing_type.dart';
export 'gear/gear.dart';
export 'gear/gear_belt.dart';
export 'gear/gear_clothing.dart';
export 'gear/gear_extra.dart';
export 'gear/gear_floatbag.dart';
export 'gear/gear_helmet.dart';
export 'gear/gear_kayak.dart';
export 'gear/gear_paddle.dart';
export 'gear/gear_pair.dart';
export 'gear/gear_pfd.dart';
export 'gear/gear_spraydeck.dart';
export 'gear/gear_throwbag.dart';
export 'gear/gear_type.dart';
export 'gear/generic_gear_size.dart';
export 'gear/kayak_type.dart';
export 'gear/paddle_type.dart';
export 'gear/pfd_type.dart';
export 'gear/spraydeck_deck_size.dart';
export 'rental/rental.dart';
export 'rental/rental_junction.dart';
export 'user/extra_user_info.dart';
export 'user/favourites.dart';
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
    if (t == _i4.GearBelt) {
      return _i4.GearBelt.fromJson(data) as T;
    }
    if (t == _i5.GearClothing) {
      return _i5.GearClothing.fromJson(data) as T;
    }
    if (t == _i6.GearFloatbag) {
      return _i6.GearFloatbag.fromJson(data) as T;
    }
    if (t == _i7.GearHelmet) {
      return _i7.GearHelmet.fromJson(data) as T;
    }
    if (t == _i8.GearKayak) {
      return _i8.GearKayak.fromJson(data) as T;
    }
    if (t == _i9.GearPaddle) {
      return _i9.GearPaddle.fromJson(data) as T;
    }
    if (t == _i10.GearPfd) {
      return _i10.GearPfd.fromJson(data) as T;
    }
    if (t == _i11.GearSpraydeck) {
      return _i11.GearSpraydeck.fromJson(data) as T;
    }
    if (t == _i12.GearThrowbag) {
      return _i12.GearThrowbag.fromJson(data) as T;
    }
    if (t == _i13.Gear) {
      return _i13.Gear.fromJson(data) as T;
    }
    if (t == _i14.GearExtra) {
      return _i14.GearExtra.fromJson(data) as T;
    }
    if (t == _i15.GearPair) {
      return _i15.GearPair.fromJson(data) as T;
    }
    if (t == _i16.GearType) {
      return _i16.GearType.fromJson(data) as T;
    }
    if (t == _i17.GenericGearSize) {
      return _i17.GenericGearSize.fromJson(data) as T;
    }
    if (t == _i18.KayakType) {
      return _i18.KayakType.fromJson(data) as T;
    }
    if (t == _i19.PaddleType) {
      return _i19.PaddleType.fromJson(data) as T;
    }
    if (t == _i20.PfdType) {
      return _i20.PfdType.fromJson(data) as T;
    }
    if (t == _i21.SpraydeckDeckSize) {
      return _i21.SpraydeckDeckSize.fromJson(data) as T;
    }
    if (t == _i22.Rental) {
      return _i22.Rental.fromJson(data) as T;
    }
    if (t == _i23.RentalJunction) {
      return _i23.RentalJunction.fromJson(data) as T;
    }
    if (t == _i24.ExtraUserInfo) {
      return _i24.ExtraUserInfo.fromJson(data) as T;
    }
    if (t == _i25.FavouritesJunction) {
      return _i25.FavouritesJunction.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.KayakException?>()) {
      return (data != null ? _i2.KayakException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.ClothingType?>()) {
      return (data != null ? _i3.ClothingType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.GearBelt?>()) {
      return (data != null ? _i4.GearBelt.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.GearClothing?>()) {
      return (data != null ? _i5.GearClothing.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.GearFloatbag?>()) {
      return (data != null ? _i6.GearFloatbag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.GearHelmet?>()) {
      return (data != null ? _i7.GearHelmet.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.GearKayak?>()) {
      return (data != null ? _i8.GearKayak.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.GearPaddle?>()) {
      return (data != null ? _i9.GearPaddle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.GearPfd?>()) {
      return (data != null ? _i10.GearPfd.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.GearSpraydeck?>()) {
      return (data != null ? _i11.GearSpraydeck.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.GearThrowbag?>()) {
      return (data != null ? _i12.GearThrowbag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Gear?>()) {
      return (data != null ? _i13.Gear.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.GearExtra?>()) {
      return (data != null ? _i14.GearExtra.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.GearPair?>()) {
      return (data != null ? _i15.GearPair.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.GearType?>()) {
      return (data != null ? _i16.GearType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.GenericGearSize?>()) {
      return (data != null ? _i17.GenericGearSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.KayakType?>()) {
      return (data != null ? _i18.KayakType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.PaddleType?>()) {
      return (data != null ? _i19.PaddleType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.PfdType?>()) {
      return (data != null ? _i20.PfdType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.SpraydeckDeckSize?>()) {
      return (data != null ? _i21.SpraydeckDeckSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.Rental?>()) {
      return (data != null ? _i22.Rental.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.RentalJunction?>()) {
      return (data != null ? _i23.RentalJunction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.ExtraUserInfo?>()) {
      return (data != null ? _i24.ExtraUserInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.FavouritesJunction?>()) {
      return (data != null ? _i25.FavouritesJunction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<List<Uri>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<Uri>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i23.RentalJunction>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i23.RentalJunction>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i25.FavouritesJunction>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i25.FavouritesJunction>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i23.RentalJunction>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i23.RentalJunction>(e))
              .toList()
          : null) as T;
    }
    if (t == Map<String, Uri>) {
      return (data as Map).map(
          (k, v) => MapEntry(deserialize<String>(k), deserialize<Uri>(v))) as T;
    }
    if (t == _i1.getType<List<_i25.FavouritesJunction>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i25.FavouritesJunction>(e))
              .toList()
          : null) as T;
    }
    if (t == List<(_i26.Gear, _i27.GearBelt)>) {
      return (data as List)
          .map((e) => deserialize<(_i26.Gear, _i27.GearBelt)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i27.GearBelt)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i27.GearBelt>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i27.GearBelt)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i27.GearBelt>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i26.Gear, _i28.GearClothing)>) {
      return (data as List)
          .map((e) => deserialize<(_i26.Gear, _i28.GearClothing)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i28.GearClothing)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i28.GearClothing>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i28.GearClothing)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i28.GearClothing>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i26.Gear, _i29.GearFloatbag)>) {
      return (data as List)
          .map((e) => deserialize<(_i26.Gear, _i29.GearFloatbag)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i29.GearFloatbag)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i29.GearFloatbag>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i29.GearFloatbag)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i29.GearFloatbag>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i26.Gear, _i30.GearHelmet)>) {
      return (data as List)
          .map((e) => deserialize<(_i26.Gear, _i30.GearHelmet)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i30.GearHelmet)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i30.GearHelmet>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i30.GearHelmet)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i30.GearHelmet>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i26.Gear, _i31.GearKayak)>) {
      return (data as List)
          .map((e) => deserialize<(_i26.Gear, _i31.GearKayak)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i31.GearKayak)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i31.GearKayak>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i31.GearKayak)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i31.GearKayak>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i26.Gear, _i32.GearPaddle)>) {
      return (data as List)
          .map((e) => deserialize<(_i26.Gear, _i32.GearPaddle)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i32.GearPaddle)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i32.GearPaddle>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i32.GearPaddle)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i32.GearPaddle>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i26.Gear, _i33.GearPfd)>) {
      return (data as List)
          .map((e) => deserialize<(_i26.Gear, _i33.GearPfd)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i33.GearPfd)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i33.GearPfd>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i33.GearPfd)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i33.GearPfd>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i26.Gear, _i34.GearSpraydeck)>) {
      return (data as List)
          .map((e) => deserialize<(_i26.Gear, _i34.GearSpraydeck)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i34.GearSpraydeck)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i34.GearSpraydeck>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i34.GearSpraydeck)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i34.GearSpraydeck>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i26.Gear, _i35.GearThrowbag)>) {
      return (data as List)
          .map((e) => deserialize<(_i26.Gear, _i35.GearThrowbag)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i35.GearThrowbag)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i35.GearThrowbag>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i26.Gear, _i35.GearThrowbag)>()) {
      return (
        deserialize<_i26.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i35.GearThrowbag>(data['p'][1]),
      ) as T;
    }
    if (t == List<_i36.Rental>) {
      return (data as List).map((e) => deserialize<_i36.Rental>(e)).toList()
          as T;
    }
    if (t == List<_i26.Gear>) {
      return (data as List).map((e) => deserialize<_i26.Gear>(e)).toList() as T;
    }
    try {
      return _i37.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
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
    if (data is _i4.GearBelt) {
      return 'GearBelt';
    }
    if (data is _i5.GearClothing) {
      return 'GearClothing';
    }
    if (data is _i6.GearFloatbag) {
      return 'GearFloatbag';
    }
    if (data is _i7.GearHelmet) {
      return 'GearHelmet';
    }
    if (data is _i8.GearKayak) {
      return 'GearKayak';
    }
    if (data is _i9.GearPaddle) {
      return 'GearPaddle';
    }
    if (data is _i10.GearPfd) {
      return 'GearPfd';
    }
    if (data is _i11.GearSpraydeck) {
      return 'GearSpraydeck';
    }
    if (data is _i12.GearThrowbag) {
      return 'GearThrowbag';
    }
    if (data is _i13.Gear) {
      return 'Gear';
    }
    if (data is _i14.GearExtra) {
      return 'GearExtra';
    }
    if (data is _i15.GearPair) {
      return 'GearPair';
    }
    if (data is _i16.GearType) {
      return 'GearType';
    }
    if (data is _i17.GenericGearSize) {
      return 'GenericGearSize';
    }
    if (data is _i18.KayakType) {
      return 'KayakType';
    }
    if (data is _i19.PaddleType) {
      return 'PaddleType';
    }
    if (data is _i20.PfdType) {
      return 'PfdType';
    }
    if (data is _i21.SpraydeckDeckSize) {
      return 'SpraydeckDeckSize';
    }
    if (data is _i22.Rental) {
      return 'Rental';
    }
    if (data is _i23.RentalJunction) {
      return 'RentalJunction';
    }
    if (data is _i24.ExtraUserInfo) {
      return 'ExtraUserInfo';
    }
    if (data is _i25.FavouritesJunction) {
      return 'FavouritesJunction';
    }
    className = _i37.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is List<_i36.Rental>) {
      return 'List<Rental>';
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
    if (dataClassName == 'GearBelt') {
      return deserialize<_i4.GearBelt>(data['data']);
    }
    if (dataClassName == 'GearClothing') {
      return deserialize<_i5.GearClothing>(data['data']);
    }
    if (dataClassName == 'GearFloatbag') {
      return deserialize<_i6.GearFloatbag>(data['data']);
    }
    if (dataClassName == 'GearHelmet') {
      return deserialize<_i7.GearHelmet>(data['data']);
    }
    if (dataClassName == 'GearKayak') {
      return deserialize<_i8.GearKayak>(data['data']);
    }
    if (dataClassName == 'GearPaddle') {
      return deserialize<_i9.GearPaddle>(data['data']);
    }
    if (dataClassName == 'GearPfd') {
      return deserialize<_i10.GearPfd>(data['data']);
    }
    if (dataClassName == 'GearSpraydeck') {
      return deserialize<_i11.GearSpraydeck>(data['data']);
    }
    if (dataClassName == 'GearThrowbag') {
      return deserialize<_i12.GearThrowbag>(data['data']);
    }
    if (dataClassName == 'Gear') {
      return deserialize<_i13.Gear>(data['data']);
    }
    if (dataClassName == 'GearExtra') {
      return deserialize<_i14.GearExtra>(data['data']);
    }
    if (dataClassName == 'GearPair') {
      return deserialize<_i15.GearPair>(data['data']);
    }
    if (dataClassName == 'GearType') {
      return deserialize<_i16.GearType>(data['data']);
    }
    if (dataClassName == 'GenericGearSize') {
      return deserialize<_i17.GenericGearSize>(data['data']);
    }
    if (dataClassName == 'KayakType') {
      return deserialize<_i18.KayakType>(data['data']);
    }
    if (dataClassName == 'PaddleType') {
      return deserialize<_i19.PaddleType>(data['data']);
    }
    if (dataClassName == 'PfdType') {
      return deserialize<_i20.PfdType>(data['data']);
    }
    if (dataClassName == 'SpraydeckDeckSize') {
      return deserialize<_i21.SpraydeckDeckSize>(data['data']);
    }
    if (dataClassName == 'Rental') {
      return deserialize<_i22.Rental>(data['data']);
    }
    if (dataClassName == 'RentalJunction') {
      return deserialize<_i23.RentalJunction>(data['data']);
    }
    if (dataClassName == 'ExtraUserInfo') {
      return deserialize<_i24.ExtraUserInfo>(data['data']);
    }
    if (dataClassName == 'FavouritesJunction') {
      return deserialize<_i25.FavouritesJunction>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i37.Protocol().deserializeByClassName(data);
    }
    if (dataClassName == 'List<Rental>') {
      return deserialize<List<_i36.Rental>>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}

/// Maps any `Record`s known to this [Protocol] to their JSON representation
///
/// Throws in case the record type is not known.
///
/// This method will return `null` (only) for `null` inputs.
Map<String, dynamic>? mapRecordToJson(Record? record) {
  if (record == null) {
    return null;
  }
  if (record is (_i26.Gear, _i27.GearBelt)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i26.Gear, _i28.GearClothing)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i26.Gear, _i29.GearFloatbag)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i26.Gear, _i30.GearHelmet)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i26.Gear, _i31.GearKayak)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i26.Gear, _i32.GearPaddle)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i26.Gear, _i33.GearPfd)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i26.Gear, _i34.GearSpraydeck)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i26.Gear, _i35.GearThrowbag)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  throw Exception('Unsupported record type ${record.runtimeType}');
}

/// Maps container types (like [List], [Map], [Set]) containing [Record]s to their JSON representation.
///
/// It should not be called for [SerializableModel] types. These handle the "[Record] in container" mapping internally already.
///
/// It is only supposed to be called from generated protocol code.
///
/// Returns either a `List<dynamic>` (for List, Sets, and Maps with non-String keys) or a `Map<String, dynamic>` in case the input was a `Map<String, …>`.
Object? mapRecordContainingContainerToJson(Object obj) {
  if (obj is! Iterable && obj is! Map) {
    throw ArgumentError.value(
      obj,
      'obj',
      'The object to serialize should be of type List, Map, or Set',
    );
  }

  dynamic mapIfNeeded(Object? obj) {
    return switch (obj) {
      Record record => mapRecordToJson(record),
      Iterable iterable => mapRecordContainingContainerToJson(iterable),
      Map map => mapRecordContainingContainerToJson(map),
      Object? value => value,
    };
  }

  switch (obj) {
    case Map<String, dynamic>():
      return {
        for (var entry in obj.entries) entry.key: mapIfNeeded(entry.value),
      };
    case Map():
      return [
        for (var entry in obj.entries)
          {
            'k': mapIfNeeded(entry.key),
            'v': mapIfNeeded(entry.value),
          }
      ];

    case Iterable():
      return [
        for (var e in obj) mapIfNeeded(e),
      ];
  }

  return obj;
}
