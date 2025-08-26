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
import 'greeting.dart' as _i2;
import 'exceptions/kayak_exception.dart' as _i3;
import 'gear/clothing_type.dart' as _i4;
import 'gear/gear.dart' as _i5;
import 'gear/gear_data_belt.dart' as _i6;
import 'gear/gear_data_clothing.dart' as _i7;
import 'gear/gear_data_helmet.dart' as _i8;
import 'gear/gear_data_kayak.dart' as _i9;
import 'gear/gear_data_paddle.dart' as _i10;
import 'gear/gear_data_pfd.dart' as _i11;
import 'gear/gear_data_spraydeck.dart' as _i12;
import 'gear/gear_data_throwbag.dart' as _i13;
import 'gear/generic_gear_size.dart' as _i14;
import 'gear/kayak_type.dart' as _i15;
import 'gear/paddle_type.dart' as _i16;
import 'gear/pfd_type.dart' as _i17;
import 'gear/spraydeck_deck_size.dart' as _i18;
import 'package:przewrotkapp_client/src/protocol/gear/gear.dart' as _i19;
export 'greeting.dart';
export 'exceptions/kayak_exception.dart';
export 'gear/clothing_type.dart';
export 'gear/gear.dart';
export 'gear/gear_data_belt.dart';
export 'gear/gear_data_clothing.dart';
export 'gear/gear_data_helmet.dart';
export 'gear/gear_data_kayak.dart';
export 'gear/gear_data_paddle.dart';
export 'gear/gear_data_pfd.dart';
export 'gear/gear_data_spraydeck.dart';
export 'gear/gear_data_throwbag.dart';
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
    if (t == _i2.Greeting) {
      return _i2.Greeting.fromJson(data) as T;
    }
    if (t == _i3.KayakException) {
      return _i3.KayakException.fromJson(data) as T;
    }
    if (t == _i4.ClothingType) {
      return _i4.ClothingType.fromJson(data) as T;
    }
    if (t == _i5.Gear) {
      return _i5.Gear.fromJson(data) as T;
    }
    if (t == _i6.GearDataBelt) {
      return _i6.GearDataBelt.fromJson(data) as T;
    }
    if (t == _i7.GearDataClothing) {
      return _i7.GearDataClothing.fromJson(data) as T;
    }
    if (t == _i8.GearDataHelmet) {
      return _i8.GearDataHelmet.fromJson(data) as T;
    }
    if (t == _i9.GearDataKayak) {
      return _i9.GearDataKayak.fromJson(data) as T;
    }
    if (t == _i10.GearDataPaddle) {
      return _i10.GearDataPaddle.fromJson(data) as T;
    }
    if (t == _i11.GearDataPfd) {
      return _i11.GearDataPfd.fromJson(data) as T;
    }
    if (t == _i12.GearDataSpraydeck) {
      return _i12.GearDataSpraydeck.fromJson(data) as T;
    }
    if (t == _i13.GearDataThrowbag) {
      return _i13.GearDataThrowbag.fromJson(data) as T;
    }
    if (t == _i14.GenericGearSize) {
      return _i14.GenericGearSize.fromJson(data) as T;
    }
    if (t == _i15.KayakType) {
      return _i15.KayakType.fromJson(data) as T;
    }
    if (t == _i16.PaddleType) {
      return _i16.PaddleType.fromJson(data) as T;
    }
    if (t == _i17.PfdType) {
      return _i17.PfdType.fromJson(data) as T;
    }
    if (t == _i18.SpraydeckDeckSize) {
      return _i18.SpraydeckDeckSize.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.KayakException?>()) {
      return (data != null ? _i3.KayakException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.ClothingType?>()) {
      return (data != null ? _i4.ClothingType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Gear?>()) {
      return (data != null ? _i5.Gear.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.GearDataBelt?>()) {
      return (data != null ? _i6.GearDataBelt.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.GearDataClothing?>()) {
      return (data != null ? _i7.GearDataClothing.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.GearDataHelmet?>()) {
      return (data != null ? _i8.GearDataHelmet.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.GearDataKayak?>()) {
      return (data != null ? _i9.GearDataKayak.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.GearDataPaddle?>()) {
      return (data != null ? _i10.GearDataPaddle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.GearDataPfd?>()) {
      return (data != null ? _i11.GearDataPfd.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.GearDataSpraydeck?>()) {
      return (data != null ? _i12.GearDataSpraydeck.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.GearDataThrowbag?>()) {
      return (data != null ? _i13.GearDataThrowbag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.GenericGearSize?>()) {
      return (data != null ? _i14.GenericGearSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.KayakType?>()) {
      return (data != null ? _i15.KayakType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.PaddleType?>()) {
      return (data != null ? _i16.PaddleType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.PfdType?>()) {
      return (data != null ? _i17.PfdType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.SpraydeckDeckSize?>()) {
      return (data != null ? _i18.SpraydeckDeckSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<Uri>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<Uri>(e)).toList()
          : null) as T;
    }
    if (t == List<_i19.Gear>) {
      return (data as List).map((e) => deserialize<_i19.Gear>(e)).toList() as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Greeting) {
      return 'Greeting';
    }
    if (data is _i3.KayakException) {
      return 'KayakException';
    }
    if (data is _i4.ClothingType) {
      return 'ClothingType';
    }
    if (data is _i5.Gear) {
      return 'Gear';
    }
    if (data is _i6.GearDataBelt) {
      return 'GearDataBelt';
    }
    if (data is _i7.GearDataClothing) {
      return 'GearDataClothing';
    }
    if (data is _i8.GearDataHelmet) {
      return 'GearDataHelmet';
    }
    if (data is _i9.GearDataKayak) {
      return 'GearDataKayak';
    }
    if (data is _i10.GearDataPaddle) {
      return 'GearDataPaddle';
    }
    if (data is _i11.GearDataPfd) {
      return 'GearDataPfd';
    }
    if (data is _i12.GearDataSpraydeck) {
      return 'GearDataSpraydeck';
    }
    if (data is _i13.GearDataThrowbag) {
      return 'GearDataThrowbag';
    }
    if (data is _i14.GenericGearSize) {
      return 'GenericGearSize';
    }
    if (data is _i15.KayakType) {
      return 'KayakType';
    }
    if (data is _i16.PaddleType) {
      return 'PaddleType';
    }
    if (data is _i17.PfdType) {
      return 'PfdType';
    }
    if (data is _i18.SpraydeckDeckSize) {
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
    if (dataClassName == 'Greeting') {
      return deserialize<_i2.Greeting>(data['data']);
    }
    if (dataClassName == 'KayakException') {
      return deserialize<_i3.KayakException>(data['data']);
    }
    if (dataClassName == 'ClothingType') {
      return deserialize<_i4.ClothingType>(data['data']);
    }
    if (dataClassName == 'Gear') {
      return deserialize<_i5.Gear>(data['data']);
    }
    if (dataClassName == 'GearDataBelt') {
      return deserialize<_i6.GearDataBelt>(data['data']);
    }
    if (dataClassName == 'GearDataClothing') {
      return deserialize<_i7.GearDataClothing>(data['data']);
    }
    if (dataClassName == 'GearDataHelmet') {
      return deserialize<_i8.GearDataHelmet>(data['data']);
    }
    if (dataClassName == 'GearDataKayak') {
      return deserialize<_i9.GearDataKayak>(data['data']);
    }
    if (dataClassName == 'GearDataPaddle') {
      return deserialize<_i10.GearDataPaddle>(data['data']);
    }
    if (dataClassName == 'GearDataPfd') {
      return deserialize<_i11.GearDataPfd>(data['data']);
    }
    if (dataClassName == 'GearDataSpraydeck') {
      return deserialize<_i12.GearDataSpraydeck>(data['data']);
    }
    if (dataClassName == 'GearDataThrowbag') {
      return deserialize<_i13.GearDataThrowbag>(data['data']);
    }
    if (dataClassName == 'GenericGearSize') {
      return deserialize<_i14.GenericGearSize>(data['data']);
    }
    if (dataClassName == 'KayakType') {
      return deserialize<_i15.KayakType>(data['data']);
    }
    if (dataClassName == 'PaddleType') {
      return deserialize<_i16.PaddleType>(data['data']);
    }
    if (dataClassName == 'PfdType') {
      return deserialize<_i17.PfdType>(data['data']);
    }
    if (dataClassName == 'SpraydeckDeckSize') {
      return deserialize<_i18.SpraydeckDeckSize>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
