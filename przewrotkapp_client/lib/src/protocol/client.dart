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
import 'package:przewrotkapp_client/src/protocol/gear/gear_belt.dart' as _i3;
import 'package:przewrotkapp_client/src/protocol/gear/gear_clothing.dart'
    as _i4;
import 'package:przewrotkapp_client/src/protocol/gear/gear_floatbag.dart'
    as _i5;
import 'package:przewrotkapp_client/src/protocol/gear/gear_helmet.dart' as _i6;
import 'package:przewrotkapp_client/src/protocol/gear/gear_kayak.dart' as _i7;
import 'package:przewrotkapp_client/src/protocol/gear/gear_paddle.dart' as _i8;
import 'package:przewrotkapp_client/src/protocol/gear/gear_pfd.dart' as _i9;
import 'package:przewrotkapp_client/src/protocol/gear/gear_spraydeck.dart'
    as _i10;
import 'package:przewrotkapp_client/src/protocol/gear/gear_throwbag.dart'
    as _i11;
import 'protocol.dart' as _i12;

/// {@category Endpoint}
class EndpointGearRead extends _i1.EndpointRef {
  EndpointGearRead(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'gearRead';

  _i2.Future<List<_i3.GearBelt>> getAllBelts() =>
      caller.callServerEndpoint<List<_i3.GearBelt>>(
        'gearRead',
        'getAllBelts',
        {},
      );

  _i2.Future<List<_i4.GearClothing>> getAllClothes() =>
      caller.callServerEndpoint<List<_i4.GearClothing>>(
        'gearRead',
        'getAllClothes',
        {},
      );

  _i2.Future<List<_i5.GearFloatbag>> getAllFloatbags() =>
      caller.callServerEndpoint<List<_i5.GearFloatbag>>(
        'gearRead',
        'getAllFloatbags',
        {},
      );

  _i2.Future<List<_i6.GearHelmet>> getAllHelmets() =>
      caller.callServerEndpoint<List<_i6.GearHelmet>>(
        'gearRead',
        'getAllHelmets',
        {},
      );

  _i2.Future<List<_i7.GearKayak>> getAllKayaks() =>
      caller.callServerEndpoint<List<_i7.GearKayak>>(
        'gearRead',
        'getAllKayaks',
        {},
      );

  _i2.Future<List<_i8.GearPaddle>> getAllPaddles() =>
      caller.callServerEndpoint<List<_i8.GearPaddle>>(
        'gearRead',
        'getAllPaddles',
        {},
      );

  _i2.Future<List<_i9.GearPfd>> getAllPfds() =>
      caller.callServerEndpoint<List<_i9.GearPfd>>(
        'gearRead',
        'getAllPfds',
        {},
      );

  _i2.Future<List<_i10.GearSpraydeck>> getAllSpraydecks() =>
      caller.callServerEndpoint<List<_i10.GearSpraydeck>>(
        'gearRead',
        'getAllSpraydecks',
        {},
      );

  _i2.Future<List<_i11.GearThrowbag>> getAllThrowbags() =>
      caller.callServerEndpoint<List<_i11.GearThrowbag>>(
        'gearRead',
        'getAllThrowbags',
        {},
      );
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
          _i12.Protocol(),
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
  }

  late final EndpointGearRead gearRead;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'gearRead': gearRead};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
