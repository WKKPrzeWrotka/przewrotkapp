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
import 'exceptions/przexception.dart' as _i2;
import 'gear/clothing_type.dart' as _i3;
import 'gear/comment.dart' as _i4;
import 'gear/comment_type.dart' as _i5;
import 'gear/gear_belt.dart' as _i6;
import 'gear/gear_clothing.dart' as _i7;
import 'gear/gear_floatbag.dart' as _i8;
import 'gear/gear_helmet.dart' as _i9;
import 'gear/gear_kayak.dart' as _i10;
import 'gear/gear_paddle.dart' as _i11;
import 'gear/gear_pfd.dart' as _i12;
import 'gear/gear_spraydeck.dart' as _i13;
import 'gear/gear_throwbag.dart' as _i14;
import 'gear/gear.dart' as _i15;
import 'gear/gear_extra.dart' as _i16;
import 'gear/gear_pair.dart' as _i17;
import 'gear/gear_type.dart' as _i18;
import 'gear/generic_gear_size.dart' as _i19;
import 'gear/kayak_type.dart' as _i20;
import 'gear/paddle_type.dart' as _i21;
import 'gear/pfd_type.dart' as _i22;
import 'gear/spraydeck_deck_size.dart' as _i23;
import 'hour.dart' as _i24;
import 'hour_category.dart' as _i25;
import 'rental/rental.dart' as _i26;
import 'rental/rental_junction.dart' as _i27;
import 'user/favourites.dart' as _i28;
import 'user/prze_user.dart' as _i29;
import 'package:przewrotkapp_client/src/protocol/gear/comment.dart' as _i30;
import 'package:przewrotkapp_client/src/protocol/gear/gear.dart' as _i31;
import 'package:przewrotkapp_client/src/protocol/gear/gear_belt.dart' as _i32;
import 'package:przewrotkapp_client/src/protocol/gear/gear_clothing.dart'
    as _i33;
import 'package:przewrotkapp_client/src/protocol/gear/gear_floatbag.dart'
    as _i34;
import 'package:przewrotkapp_client/src/protocol/gear/gear_helmet.dart' as _i35;
import 'package:przewrotkapp_client/src/protocol/gear/gear_kayak.dart' as _i36;
import 'package:przewrotkapp_client/src/protocol/gear/gear_paddle.dart' as _i37;
import 'package:przewrotkapp_client/src/protocol/gear/gear_pfd.dart' as _i38;
import 'package:przewrotkapp_client/src/protocol/gear/gear_spraydeck.dart'
    as _i39;
import 'package:przewrotkapp_client/src/protocol/gear/gear_throwbag.dart'
    as _i40;
import 'package:przewrotkapp_client/src/protocol/hour.dart' as _i41;
import 'package:przewrotkapp_client/src/protocol/rental/rental.dart' as _i42;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i43;
export 'exceptions/przexception.dart';
export 'gear/clothing_type.dart';
export 'gear/comment.dart';
export 'gear/comment_type.dart';
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
export 'hour.dart';
export 'hour_category.dart';
export 'rental/rental.dart';
export 'rental/rental_junction.dart';
export 'user/favourites.dart';
export 'user/prze_user.dart';
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
    if (t == _i2.PrzException) {
      return _i2.PrzException.fromJson(data) as T;
    }
    if (t == _i3.ClothingType) {
      return _i3.ClothingType.fromJson(data) as T;
    }
    if (t == _i4.Comment) {
      return _i4.Comment.fromJson(data) as T;
    }
    if (t == _i5.CommentType) {
      return _i5.CommentType.fromJson(data) as T;
    }
    if (t == _i6.GearBelt) {
      return _i6.GearBelt.fromJson(data) as T;
    }
    if (t == _i7.GearClothing) {
      return _i7.GearClothing.fromJson(data) as T;
    }
    if (t == _i8.GearFloatbag) {
      return _i8.GearFloatbag.fromJson(data) as T;
    }
    if (t == _i9.GearHelmet) {
      return _i9.GearHelmet.fromJson(data) as T;
    }
    if (t == _i10.GearKayak) {
      return _i10.GearKayak.fromJson(data) as T;
    }
    if (t == _i11.GearPaddle) {
      return _i11.GearPaddle.fromJson(data) as T;
    }
    if (t == _i12.GearPfd) {
      return _i12.GearPfd.fromJson(data) as T;
    }
    if (t == _i13.GearSpraydeck) {
      return _i13.GearSpraydeck.fromJson(data) as T;
    }
    if (t == _i14.GearThrowbag) {
      return _i14.GearThrowbag.fromJson(data) as T;
    }
    if (t == _i15.Gear) {
      return _i15.Gear.fromJson(data) as T;
    }
    if (t == _i16.GearExtra) {
      return _i16.GearExtra.fromJson(data) as T;
    }
    if (t == _i17.GearPair) {
      return _i17.GearPair.fromJson(data) as T;
    }
    if (t == _i18.GearType) {
      return _i18.GearType.fromJson(data) as T;
    }
    if (t == _i19.GenericGearSize) {
      return _i19.GenericGearSize.fromJson(data) as T;
    }
    if (t == _i20.KayakType) {
      return _i20.KayakType.fromJson(data) as T;
    }
    if (t == _i21.PaddleType) {
      return _i21.PaddleType.fromJson(data) as T;
    }
    if (t == _i22.PfdType) {
      return _i22.PfdType.fromJson(data) as T;
    }
    if (t == _i23.SpraydeckDeckSize) {
      return _i23.SpraydeckDeckSize.fromJson(data) as T;
    }
    if (t == _i24.Hour) {
      return _i24.Hour.fromJson(data) as T;
    }
    if (t == _i25.HourCategory) {
      return _i25.HourCategory.fromJson(data) as T;
    }
    if (t == _i26.Rental) {
      return _i26.Rental.fromJson(data) as T;
    }
    if (t == _i27.RentalJunction) {
      return _i27.RentalJunction.fromJson(data) as T;
    }
    if (t == _i28.FavouritesJunction) {
      return _i28.FavouritesJunction.fromJson(data) as T;
    }
    if (t == _i29.PrzeUser) {
      return _i29.PrzeUser.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.PrzException?>()) {
      return (data != null ? _i2.PrzException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.ClothingType?>()) {
      return (data != null ? _i3.ClothingType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Comment?>()) {
      return (data != null ? _i4.Comment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.CommentType?>()) {
      return (data != null ? _i5.CommentType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.GearBelt?>()) {
      return (data != null ? _i6.GearBelt.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.GearClothing?>()) {
      return (data != null ? _i7.GearClothing.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.GearFloatbag?>()) {
      return (data != null ? _i8.GearFloatbag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.GearHelmet?>()) {
      return (data != null ? _i9.GearHelmet.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.GearKayak?>()) {
      return (data != null ? _i10.GearKayak.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.GearPaddle?>()) {
      return (data != null ? _i11.GearPaddle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.GearPfd?>()) {
      return (data != null ? _i12.GearPfd.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.GearSpraydeck?>()) {
      return (data != null ? _i13.GearSpraydeck.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.GearThrowbag?>()) {
      return (data != null ? _i14.GearThrowbag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Gear?>()) {
      return (data != null ? _i15.Gear.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.GearExtra?>()) {
      return (data != null ? _i16.GearExtra.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.GearPair?>()) {
      return (data != null ? _i17.GearPair.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.GearType?>()) {
      return (data != null ? _i18.GearType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.GenericGearSize?>()) {
      return (data != null ? _i19.GenericGearSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.KayakType?>()) {
      return (data != null ? _i20.KayakType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.PaddleType?>()) {
      return (data != null ? _i21.PaddleType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.PfdType?>()) {
      return (data != null ? _i22.PfdType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.SpraydeckDeckSize?>()) {
      return (data != null ? _i23.SpraydeckDeckSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.Hour?>()) {
      return (data != null ? _i24.Hour.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.HourCategory?>()) {
      return (data != null ? _i25.HourCategory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.Rental?>()) {
      return (data != null ? _i26.Rental.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.RentalJunction?>()) {
      return (data != null ? _i27.RentalJunction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.FavouritesJunction?>()) {
      return (data != null ? _i28.FavouritesJunction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i29.PrzeUser?>()) {
      return (data != null ? _i29.PrzeUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<Uri>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<Uri>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i27.RentalJunction>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i27.RentalJunction>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i28.FavouritesJunction>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i28.FavouritesJunction>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i4.Comment>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i4.Comment>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i27.RentalJunction>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i27.RentalJunction>(e))
              .toList()
          : null) as T;
    }
    if (t == Map<String, Uri>) {
      return (data as Map).map(
          (k, v) => MapEntry(deserialize<String>(k), deserialize<Uri>(v))) as T;
    }
    if (t == List<_i30.Comment>) {
      return (data as List).map((e) => deserialize<_i30.Comment>(e)).toList()
          as T;
    }
    if (t == List<({DateTime from, String name, DateTime to})>) {
      return (data as List)
          .map((e) =>
              deserialize<({DateTime from, String name, DateTime to})>(e))
          .toList() as T;
    }
    if (t == _i1.getType<({DateTime from, String name, DateTime to})>()) {
      return (
        from: deserialize<DateTime>(((data as Map)['n'] as Map)['from']),
        name: deserialize<String>(data['n']['name']),
        to: deserialize<DateTime>(data['n']['to']),
      ) as T;
    }
    if (t == _i1.getType<({DateTime from, String name, DateTime to})>()) {
      return (
        from: deserialize<DateTime>(((data as Map)['n'] as Map)['from']),
        name: deserialize<String>(data['n']['name']),
        to: deserialize<DateTime>(data['n']['to']),
      ) as T;
    }
    if (t == List<(_i31.Gear, _i32.GearBelt)>) {
      return (data as List)
          .map((e) => deserialize<(_i31.Gear, _i32.GearBelt)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i32.GearBelt)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i32.GearBelt>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i32.GearBelt)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i32.GearBelt>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i31.Gear, _i33.GearClothing)>) {
      return (data as List)
          .map((e) => deserialize<(_i31.Gear, _i33.GearClothing)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i33.GearClothing)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i33.GearClothing>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i33.GearClothing)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i33.GearClothing>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i31.Gear, _i34.GearFloatbag)>) {
      return (data as List)
          .map((e) => deserialize<(_i31.Gear, _i34.GearFloatbag)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i34.GearFloatbag)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i34.GearFloatbag>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i34.GearFloatbag)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i34.GearFloatbag>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i31.Gear, _i35.GearHelmet)>) {
      return (data as List)
          .map((e) => deserialize<(_i31.Gear, _i35.GearHelmet)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i35.GearHelmet)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i35.GearHelmet>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i35.GearHelmet)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i35.GearHelmet>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i31.Gear, _i36.GearKayak)>) {
      return (data as List)
          .map((e) => deserialize<(_i31.Gear, _i36.GearKayak)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i36.GearKayak)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i36.GearKayak>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i36.GearKayak)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i36.GearKayak>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i31.Gear, _i37.GearPaddle)>) {
      return (data as List)
          .map((e) => deserialize<(_i31.Gear, _i37.GearPaddle)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i37.GearPaddle)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i37.GearPaddle>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i37.GearPaddle)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i37.GearPaddle>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i31.Gear, _i38.GearPfd)>) {
      return (data as List)
          .map((e) => deserialize<(_i31.Gear, _i38.GearPfd)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i38.GearPfd)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i38.GearPfd>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i38.GearPfd)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i38.GearPfd>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i31.Gear, _i39.GearSpraydeck)>) {
      return (data as List)
          .map((e) => deserialize<(_i31.Gear, _i39.GearSpraydeck)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i39.GearSpraydeck)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i39.GearSpraydeck>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i39.GearSpraydeck)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i39.GearSpraydeck>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i31.Gear, _i40.GearThrowbag)>) {
      return (data as List)
          .map((e) => deserialize<(_i31.Gear, _i40.GearThrowbag)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i40.GearThrowbag)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i40.GearThrowbag>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i40.GearThrowbag)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i40.GearThrowbag>(data['p'][1]),
      ) as T;
    }
    if (t == List<_i41.Hour>) {
      return (data as List).map((e) => deserialize<_i41.Hour>(e)).toList() as T;
    }
    if (t == List<_i42.Rental>) {
      return (data as List).map((e) => deserialize<_i42.Rental>(e)).toList()
          as T;
    }
    if (t == List<_i31.Gear>) {
      return (data as List).map((e) => deserialize<_i31.Gear>(e)).toList() as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i32.GearBelt)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i32.GearBelt>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i33.GearClothing)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i33.GearClothing>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i34.GearFloatbag)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i34.GearFloatbag>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i35.GearHelmet)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i35.GearHelmet>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i36.GearKayak)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i36.GearKayak>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i37.GearPaddle)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i37.GearPaddle>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i38.GearPfd)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i38.GearPfd>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i39.GearSpraydeck)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i39.GearSpraydeck>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i31.Gear, _i40.GearThrowbag)>()) {
      return (
        deserialize<_i31.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i40.GearThrowbag>(data['p'][1]),
      ) as T;
    }
    try {
      return _i43.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.PrzException) {
      return 'PrzException';
    }
    if (data is _i3.ClothingType) {
      return 'ClothingType';
    }
    if (data is _i4.Comment) {
      return 'Comment';
    }
    if (data is _i5.CommentType) {
      return 'CommentType';
    }
    if (data is _i6.GearBelt) {
      return 'GearBelt';
    }
    if (data is _i7.GearClothing) {
      return 'GearClothing';
    }
    if (data is _i8.GearFloatbag) {
      return 'GearFloatbag';
    }
    if (data is _i9.GearHelmet) {
      return 'GearHelmet';
    }
    if (data is _i10.GearKayak) {
      return 'GearKayak';
    }
    if (data is _i11.GearPaddle) {
      return 'GearPaddle';
    }
    if (data is _i12.GearPfd) {
      return 'GearPfd';
    }
    if (data is _i13.GearSpraydeck) {
      return 'GearSpraydeck';
    }
    if (data is _i14.GearThrowbag) {
      return 'GearThrowbag';
    }
    if (data is _i15.Gear) {
      return 'Gear';
    }
    if (data is _i16.GearExtra) {
      return 'GearExtra';
    }
    if (data is _i17.GearPair) {
      return 'GearPair';
    }
    if (data is _i18.GearType) {
      return 'GearType';
    }
    if (data is _i19.GenericGearSize) {
      return 'GenericGearSize';
    }
    if (data is _i20.KayakType) {
      return 'KayakType';
    }
    if (data is _i21.PaddleType) {
      return 'PaddleType';
    }
    if (data is _i22.PfdType) {
      return 'PfdType';
    }
    if (data is _i23.SpraydeckDeckSize) {
      return 'SpraydeckDeckSize';
    }
    if (data is _i24.Hour) {
      return 'Hour';
    }
    if (data is _i25.HourCategory) {
      return 'HourCategory';
    }
    if (data is _i26.Rental) {
      return 'Rental';
    }
    if (data is _i27.RentalJunction) {
      return 'RentalJunction';
    }
    if (data is _i28.FavouritesJunction) {
      return 'FavouritesJunction';
    }
    if (data is _i29.PrzeUser) {
      return 'PrzeUser';
    }
    className = _i43.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is List<_i30.Comment>) {
      return 'List<Comment>';
    }
    if (data is List<(_i31.Gear, _i32.GearBelt)>) {
      return 'List<(Gear,GearBelt)>';
    }
    if (data is List<(_i31.Gear, _i33.GearClothing)>) {
      return 'List<(Gear,GearClothing)>';
    }
    if (data is List<(_i31.Gear, _i34.GearFloatbag)>) {
      return 'List<(Gear,GearFloatbag)>';
    }
    if (data is List<(_i31.Gear, _i35.GearHelmet)>) {
      return 'List<(Gear,GearHelmet)>';
    }
    if (data is List<(_i31.Gear, _i36.GearKayak)>) {
      return 'List<(Gear,GearKayak)>';
    }
    if (data is List<(_i31.Gear, _i37.GearPaddle)>) {
      return 'List<(Gear,GearPaddle)>';
    }
    if (data is List<(_i31.Gear, _i38.GearPfd)>) {
      return 'List<(Gear,GearPfd)>';
    }
    if (data is List<(_i31.Gear, _i39.GearSpraydeck)>) {
      return 'List<(Gear,GearSpraydeck)>';
    }
    if (data is List<(_i31.Gear, _i40.GearThrowbag)>) {
      return 'List<(Gear,GearThrowbag)>';
    }
    if (data is List<_i41.Hour>) {
      return 'List<Hour>';
    }
    if (data is List<_i42.Rental>) {
      return 'List<Rental>';
    }
    if (data is List<int>) {
      return 'List<int>';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'PrzException') {
      return deserialize<_i2.PrzException>(data['data']);
    }
    if (dataClassName == 'ClothingType') {
      return deserialize<_i3.ClothingType>(data['data']);
    }
    if (dataClassName == 'Comment') {
      return deserialize<_i4.Comment>(data['data']);
    }
    if (dataClassName == 'CommentType') {
      return deserialize<_i5.CommentType>(data['data']);
    }
    if (dataClassName == 'GearBelt') {
      return deserialize<_i6.GearBelt>(data['data']);
    }
    if (dataClassName == 'GearClothing') {
      return deserialize<_i7.GearClothing>(data['data']);
    }
    if (dataClassName == 'GearFloatbag') {
      return deserialize<_i8.GearFloatbag>(data['data']);
    }
    if (dataClassName == 'GearHelmet') {
      return deserialize<_i9.GearHelmet>(data['data']);
    }
    if (dataClassName == 'GearKayak') {
      return deserialize<_i10.GearKayak>(data['data']);
    }
    if (dataClassName == 'GearPaddle') {
      return deserialize<_i11.GearPaddle>(data['data']);
    }
    if (dataClassName == 'GearPfd') {
      return deserialize<_i12.GearPfd>(data['data']);
    }
    if (dataClassName == 'GearSpraydeck') {
      return deserialize<_i13.GearSpraydeck>(data['data']);
    }
    if (dataClassName == 'GearThrowbag') {
      return deserialize<_i14.GearThrowbag>(data['data']);
    }
    if (dataClassName == 'Gear') {
      return deserialize<_i15.Gear>(data['data']);
    }
    if (dataClassName == 'GearExtra') {
      return deserialize<_i16.GearExtra>(data['data']);
    }
    if (dataClassName == 'GearPair') {
      return deserialize<_i17.GearPair>(data['data']);
    }
    if (dataClassName == 'GearType') {
      return deserialize<_i18.GearType>(data['data']);
    }
    if (dataClassName == 'GenericGearSize') {
      return deserialize<_i19.GenericGearSize>(data['data']);
    }
    if (dataClassName == 'KayakType') {
      return deserialize<_i20.KayakType>(data['data']);
    }
    if (dataClassName == 'PaddleType') {
      return deserialize<_i21.PaddleType>(data['data']);
    }
    if (dataClassName == 'PfdType') {
      return deserialize<_i22.PfdType>(data['data']);
    }
    if (dataClassName == 'SpraydeckDeckSize') {
      return deserialize<_i23.SpraydeckDeckSize>(data['data']);
    }
    if (dataClassName == 'Hour') {
      return deserialize<_i24.Hour>(data['data']);
    }
    if (dataClassName == 'HourCategory') {
      return deserialize<_i25.HourCategory>(data['data']);
    }
    if (dataClassName == 'Rental') {
      return deserialize<_i26.Rental>(data['data']);
    }
    if (dataClassName == 'RentalJunction') {
      return deserialize<_i27.RentalJunction>(data['data']);
    }
    if (dataClassName == 'FavouritesJunction') {
      return deserialize<_i28.FavouritesJunction>(data['data']);
    }
    if (dataClassName == 'PrzeUser') {
      return deserialize<_i29.PrzeUser>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i43.Protocol().deserializeByClassName(data);
    }
    if (dataClassName == 'List<Comment>') {
      return deserialize<List<_i30.Comment>>(data['data']);
    }
    if (dataClassName == 'List<(Gear,GearBelt)>') {
      return deserialize<List<(_i31.Gear, _i32.GearBelt)>>(data['data']);
    }
    if (dataClassName == 'List<(Gear,GearClothing)>') {
      return deserialize<List<(_i31.Gear, _i33.GearClothing)>>(data['data']);
    }
    if (dataClassName == 'List<(Gear,GearFloatbag)>') {
      return deserialize<List<(_i31.Gear, _i34.GearFloatbag)>>(data['data']);
    }
    if (dataClassName == 'List<(Gear,GearHelmet)>') {
      return deserialize<List<(_i31.Gear, _i35.GearHelmet)>>(data['data']);
    }
    if (dataClassName == 'List<(Gear,GearKayak)>') {
      return deserialize<List<(_i31.Gear, _i36.GearKayak)>>(data['data']);
    }
    if (dataClassName == 'List<(Gear,GearPaddle)>') {
      return deserialize<List<(_i31.Gear, _i37.GearPaddle)>>(data['data']);
    }
    if (dataClassName == 'List<(Gear,GearPfd)>') {
      return deserialize<List<(_i31.Gear, _i38.GearPfd)>>(data['data']);
    }
    if (dataClassName == 'List<(Gear,GearSpraydeck)>') {
      return deserialize<List<(_i31.Gear, _i39.GearSpraydeck)>>(data['data']);
    }
    if (dataClassName == 'List<(Gear,GearThrowbag)>') {
      return deserialize<List<(_i31.Gear, _i40.GearThrowbag)>>(data['data']);
    }
    if (dataClassName == 'List<Hour>') {
      return deserialize<List<_i41.Hour>>(data['data']);
    }
    if (dataClassName == 'List<Rental>') {
      return deserialize<List<_i42.Rental>>(data['data']);
    }
    if (dataClassName == 'List<int>') {
      return deserialize<List<int>>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  /// Wraps serialized data with its class name so that it can be deserialized
  /// with [deserializeByClassName].
  ///
  /// Records and containers containing records will be return in their JSON representation in the returned map.
  @override
  Map<String, dynamic> wrapWithClassName(Object? data) {
    /// In case the value (to be streamed) contains a record, we need to map it before it reaches the underlying JSON encode
    if (data is Iterable || data is Map) {
      return {
        'className': getClassNameForObject(data)!,
        'data': mapRecordContainingContainerToJson(data!),
      };
    } else if (data is Record) {
      return {
        'className': getClassNameForObject(data)!,
        'data': mapRecordToJson(data),
      };
    }

    return super.wrapWithClassName(data);
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
  if (record is ({DateTime from, String name, DateTime to})) {
    return {
      "n": {
        "from": record.from,
        "name": record.name,
        "to": record.to,
      },
    };
  }
  if (record is (_i31.Gear, _i32.GearBelt)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i31.Gear, _i33.GearClothing)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i31.Gear, _i34.GearFloatbag)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i31.Gear, _i35.GearHelmet)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i31.Gear, _i36.GearKayak)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i31.Gear, _i37.GearPaddle)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i31.Gear, _i38.GearPfd)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i31.Gear, _i39.GearSpraydeck)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i31.Gear, _i40.GearThrowbag)) {
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
