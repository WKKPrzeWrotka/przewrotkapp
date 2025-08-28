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
import 'package:przewrotkapp_client/src/protocol/gear/gear_kayak.dart' as _i3;
import 'package:przewrotkapp_client/src/protocol/gear/gear.dart' as _i4;
import 'package:przewrotkapp_client/src/protocol/greeting.dart' as _i5;
import 'protocol.dart' as _i6;

/// {@category Endpoint}
class EndpointAllKayaks extends _i1.EndpointRef {
  EndpointAllKayaks(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'allKayaks';

  _i2.Future<List<_i3.GearKayak>> getAllKayaks() =>
      caller.callServerEndpoint<List<_i3.GearKayak>>(
        'allKayaks',
        'getAllKayaks',
        {},
      );

  _i2.Future<void> addNewKayak(
    _i4.Gear gear,
    _i3.GearKayak kayak,
  ) =>
      caller.callServerEndpoint<void>(
        'allKayaks',
        'addNewKayak',
        {
          'gear': gear,
          'kayak': kayak,
        },
      );

  _i2.Future<String?> addKayakPhoto(String clubId) =>
      caller.callServerEndpoint<String?>(
        'allKayaks',
        'addKayakPhoto',
        {'clubId': clubId},
      );

  _i2.Future<Uri?> getKayakPhoto(String clubId) =>
      caller.callServerEndpoint<Uri?>(
        'allKayaks',
        'getKayakPhoto',
        {'clubId': clubId},
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i5.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i5.Greeting>(
        'greeting',
        'hello',
        {'name': name},
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
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    allKayaks = EndpointAllKayaks(this);
    greeting = EndpointGreeting(this);
  }

  late final EndpointAllKayaks allKayaks;

  late final EndpointGreeting greeting;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'allKayaks': allKayaks,
        'greeting': greeting,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
