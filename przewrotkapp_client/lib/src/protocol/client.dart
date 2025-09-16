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
import 'package:przewrotkapp_client/src/protocol/gear/gear_pair.dart' as _i3;
import 'package:przewrotkapp_client/src/protocol/rental/rental.dart' as _i4;
import 'package:przewrotkapp_client/src/protocol/gear/gear.dart' as _i5;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i6;
import 'package:przewrotkapp_client/src/protocol/user/extra_user_info.dart'
    as _i7;
import 'protocol.dart' as _i8;

/// {@category Endpoint}
class EndpointGearRead extends _i1.EndpointRef {
  EndpointGearRead(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'gearRead';

  _i2.Future<List<_i3.GearPair>> getAllGear() =>
      caller.callServerEndpoint<List<_i3.GearPair>>(
        'gearRead',
        'getAllGear',
        {},
      );
}

/// {@category Endpoint}
class EndpointRental extends _i1.EndpointRef {
  EndpointRental(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'rental';

  _i2.Future<List<_i4.Rental>> getAllRentals() =>
      caller.callServerEndpoint<List<_i4.Rental>>(
        'rental',
        'getAllRentals',
        {},
      );

  _i2.Future<void> rentGear(
    List<_i5.Gear> gear,
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

  _i2.Future<_i6.UserInfoPublic> getUserInfo(int userId) =>
      caller.callServerEndpoint<_i6.UserInfoPublic>(
        'user',
        'getUserInfo',
        {'userId': userId},
      );

  _i2.Future<_i7.ExtraUserInfo> getExtraUserInfo([int? userId]) =>
      caller.callServerEndpoint<_i7.ExtraUserInfo>(
        'user',
        'getExtraUserInfo',
        {'userId': userId},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i6.Caller(client);
  }

  late final _i6.Caller auth;
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
          _i8.Protocol(),
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
