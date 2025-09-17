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
import 'dart:async' as _i2;
import 'package:przewrotkapp_client/src/protocol/gear/gear.dart' as _i3;
import 'package:przewrotkapp_client/src/protocol/gear/gear_belt.dart' as _i4;
import 'package:przewrotkapp_client/src/protocol/gear/gear_clothing.dart'
    as _i5;
import 'package:przewrotkapp_client/src/protocol/gear/gear_floatbag.dart'
    as _i6;
import 'package:przewrotkapp_client/src/protocol/gear/gear_helmet.dart' as _i7;
import 'package:przewrotkapp_client/src/protocol/gear/gear_kayak.dart' as _i8;
import 'package:przewrotkapp_client/src/protocol/gear/gear_paddle.dart' as _i9;
import 'package:przewrotkapp_client/src/protocol/gear/gear_pfd.dart' as _i10;
import 'package:przewrotkapp_client/src/protocol/gear/gear_spraydeck.dart'
    as _i11;
import 'package:przewrotkapp_client/src/protocol/gear/gear_throwbag.dart'
    as _i12;
import 'package:przewrotkapp_client/src/protocol/rental/rental.dart' as _i13;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i14;
import 'package:przewrotkapp_client/src/protocol/user/extra_user_info.dart'
    as _i15;
import 'protocol.dart' as _i16;

/// {@category Endpoint}
class EndpointGearRead extends _i1.EndpointRef {
  EndpointGearRead(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'gearRead';

  _i2.Future<List<(_i3.Gear, _i4.GearBelt)>> getAllBelts() =>
      caller.callServerEndpoint<List<(_i3.Gear, _i4.GearBelt)>>(
        'gearRead',
        'getAllBelts',
        {},
      );

  _i2.Future<List<(_i3.Gear, _i5.GearClothing)>> getAllClothes() =>
      caller.callServerEndpoint<List<(_i3.Gear, _i5.GearClothing)>>(
        'gearRead',
        'getAllClothes',
        {},
      );

  _i2.Future<List<(_i3.Gear, _i6.GearFloatbag)>> getAllFloatbags() =>
      caller.callServerEndpoint<List<(_i3.Gear, _i6.GearFloatbag)>>(
        'gearRead',
        'getAllFloatbags',
        {},
      );

  _i2.Future<List<(_i3.Gear, _i7.GearHelmet)>> getAllHelmets() =>
      caller.callServerEndpoint<List<(_i3.Gear, _i7.GearHelmet)>>(
        'gearRead',
        'getAllHelmets',
        {},
      );

  _i2.Future<List<(_i3.Gear, _i8.GearKayak)>> getAllKayaks() =>
      caller.callServerEndpoint<List<(_i3.Gear, _i8.GearKayak)>>(
        'gearRead',
        'getAllKayaks',
        {},
      );

  _i2.Future<List<(_i3.Gear, _i9.GearPaddle)>> getAllPaddles() =>
      caller.callServerEndpoint<List<(_i3.Gear, _i9.GearPaddle)>>(
        'gearRead',
        'getAllPaddles',
        {},
      );

  _i2.Future<List<(_i3.Gear, _i10.GearPfd)>> getAllPfds() =>
      caller.callServerEndpoint<List<(_i3.Gear, _i10.GearPfd)>>(
        'gearRead',
        'getAllPfds',
        {},
      );

  _i2.Future<List<(_i3.Gear, _i11.GearSpraydeck)>> getAllSpraydecks() =>
      caller.callServerEndpoint<List<(_i3.Gear, _i11.GearSpraydeck)>>(
        'gearRead',
        'getAllSpraydecks',
        {},
      );

  _i2.Future<List<(_i3.Gear, _i12.GearThrowbag)>> getAllThrowbags() =>
      caller.callServerEndpoint<List<(_i3.Gear, _i12.GearThrowbag)>>(
        'gearRead',
        'getAllThrowbags',
        {},
      );
}

/// {@category Endpoint}
class EndpointRental extends _i1.EndpointRef {
  EndpointRental(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'rental';

  _i2.Future<List<_i13.Rental>> getRentals({required bool past}) =>
      caller.callServerEndpoint<List<_i13.Rental>>(
        'rental',
        'getRentals',
        {'past': past},
      );

  _i2.Stream<List<_i13.Rental>> watchRentals({required bool past}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<List<_i13.Rental>>,
          List<_i13.Rental>>(
        'rental',
        'watchRentals',
        {'past': past},
        {},
      );

  _i2.Future<void> rentGear(
    List<_i3.Gear> gear,
    DateTime from,
    DateTime to,
  ) =>
      caller.callServerEndpoint<void>(
        'rental',
        'rentGear',
        {
          'gear': gear,
          'from': from,
          'to': to,
        },
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<_i14.UserInfoPublic> getUserInfo(int userId) =>
      caller.callServerEndpoint<_i14.UserInfoPublic>(
        'user',
        'getUserInfo',
        {'userId': userId},
      );

  _i2.Future<_i15.ExtraUserInfo> getExtraUserInfo([int? userId]) =>
      caller.callServerEndpoint<_i15.ExtraUserInfo>(
        'user',
        'getExtraUserInfo',
        {'userId': userId},
      );

  _i2.Stream<_i15.ExtraUserInfo> watchExtraUserInfo([int? userId]) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i15.ExtraUserInfo>,
          _i15.ExtraUserInfo>(
        'user',
        'watchExtraUserInfo',
        {'userId': userId},
        {},
      );

  _i2.Future<void> updateGearFavourite(
    _i3.Gear gear,
    bool isFavourite,
  ) =>
      caller.callServerEndpoint<void>(
        'user',
        'updateGearFavourite',
        {
          'gear': gear,
          'isFavourite': isFavourite,
        },
      );
}

class Modules {
  Modules(Client client) {
    auth = _i14.Caller(client);
  }

  late final _i14.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i16.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    gearRead = EndpointGearRead(this);
    rental = EndpointRental(this);
    user = EndpointUser(this);
    modules = Modules(this);
  }

  late final EndpointGearRead gearRead;

  late final EndpointRental rental;

  late final EndpointUser user;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'gearRead': gearRead,
        'rental': rental,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
