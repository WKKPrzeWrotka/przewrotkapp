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
import 'package:przewrotkapp_client/src/protocol/gear/comment.dart' as _i3;
import 'dart:typed_data' as _i4;
import 'package:przewrotkapp_client/src/protocol/gear/gear.dart' as _i5;
import 'package:przewrotkapp_client/src/protocol/gear/gear_belt.dart' as _i6;
import 'package:przewrotkapp_client/src/protocol/gear/gear_clothing.dart'
    as _i7;
import 'package:przewrotkapp_client/src/protocol/gear/gear_floatbag.dart'
    as _i8;
import 'package:przewrotkapp_client/src/protocol/gear/gear_helmet.dart' as _i9;
import 'package:przewrotkapp_client/src/protocol/gear/gear_kayak.dart' as _i10;
import 'package:przewrotkapp_client/src/protocol/gear/gear_paddle.dart' as _i11;
import 'package:przewrotkapp_client/src/protocol/gear/gear_pfd.dart' as _i12;
import 'package:przewrotkapp_client/src/protocol/gear/gear_spraydeck.dart'
    as _i13;
import 'package:przewrotkapp_client/src/protocol/gear/gear_throwbag.dart'
    as _i14;
import 'package:przewrotkapp_client/src/protocol/hour.dart' as _i15;
import 'package:przewrotkapp_client/src/protocol/rental/rental.dart' as _i16;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i17;
import 'package:przewrotkapp_client/src/protocol/user/prze_user.dart' as _i18;
import 'protocol.dart' as _i19;

/// {@category Endpoint}
class EndpointComments extends _i1.EndpointRef {
  EndpointComments(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'comments';

  _i2.Future<List<_i3.Comment>> getComments({required bool resolved}) =>
      caller.callServerEndpoint<List<_i3.Comment>>(
        'comments',
        'getComments',
        {'resolved': resolved},
      );

  _i2.Stream<List<_i3.Comment>> watchComments({required bool resolved}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<List<_i3.Comment>>,
          List<_i3.Comment>>(
        'comments',
        'watchComments',
        {'resolved': resolved},
        {},
      );

  _i2.Future<void> createOrUpdateComment(_i3.Comment comment) =>
      caller.callServerEndpoint<void>(
        'comments',
        'createOrUpdateComment',
        {'comment': comment},
      );

  _i2.Future<void> deleteComment(_i3.Comment comment) =>
      caller.callServerEndpoint<void>(
        'comments',
        'deleteComment',
        {'comment': comment},
      );
}

/// {@category Endpoint}
class EndpointEvents extends _i1.EndpointRef {
  EndpointEvents(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'events';

  _i2.Future<List<({DateTime end, String name, DateTime start})>>
      getDiscordEvents({required bool past}) => caller.callServerEndpoint<
              List<({DateTime end, String name, DateTime start})>>(
            'events',
            'getDiscordEvents',
            {'past': past},
          );
}

/// {@category Endpoint}
class EndpointGearManage extends _i1.EndpointRef {
  EndpointGearManage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'gearManage';

  _i2.Future<Uri> uploadGearImage(
    _i4.ByteData imageBytes,
    String clubId,
  ) =>
      caller.callServerEndpoint<Uri>(
        'gearManage',
        'uploadGearImage',
        {
          'imageBytes': imageBytes,
          'clubId': clubId,
        },
      );

  _i2.Future<void> createOrUpdateBelt(
    _i5.Gear gear,
    _i6.GearBelt belt,
  ) =>
      caller.callServerEndpoint<void>(
        'gearManage',
        'createOrUpdateBelt',
        {
          'gear': gear,
          'belt': belt,
        },
      );

  _i2.Future<void> createOrUpdateClothing(
    _i5.Gear gear,
    _i7.GearClothing clothing,
  ) =>
      caller.callServerEndpoint<void>(
        'gearManage',
        'createOrUpdateClothing',
        {
          'gear': gear,
          'clothing': clothing,
        },
      );

  _i2.Future<void> createOrUpdateFloatbag(
    _i5.Gear gear,
    _i8.GearFloatbag floatbag,
  ) =>
      caller.callServerEndpoint<void>(
        'gearManage',
        'createOrUpdateFloatbag',
        {
          'gear': gear,
          'floatbag': floatbag,
        },
      );

  _i2.Future<void> createOrUpdateHelmet(
    _i5.Gear gear,
    _i9.GearHelmet helmet,
  ) =>
      caller.callServerEndpoint<void>(
        'gearManage',
        'createOrUpdateHelmet',
        {
          'gear': gear,
          'helmet': helmet,
        },
      );

  _i2.Future<void> createOrUpdateKayak(
    _i5.Gear gear,
    _i10.GearKayak kayak,
  ) =>
      caller.callServerEndpoint<void>(
        'gearManage',
        'createOrUpdateKayak',
        {
          'gear': gear,
          'kayak': kayak,
        },
      );

  _i2.Future<void> createOrUpdatePaddle(
    _i5.Gear gear,
    _i11.GearPaddle paddle,
  ) =>
      caller.callServerEndpoint<void>(
        'gearManage',
        'createOrUpdatePaddle',
        {
          'gear': gear,
          'paddle': paddle,
        },
      );

  _i2.Future<void> createOrUpdatePfd(
    _i5.Gear gear,
    _i12.GearPfd pfd,
  ) =>
      caller.callServerEndpoint<void>(
        'gearManage',
        'createOrUpdatePfd',
        {
          'gear': gear,
          'pfd': pfd,
        },
      );

  _i2.Future<void> createOrUpdateSpraydeck(
    _i5.Gear gear,
    _i13.GearSpraydeck spraydeck,
  ) =>
      caller.callServerEndpoint<void>(
        'gearManage',
        'createOrUpdateSpraydeck',
        {
          'gear': gear,
          'spraydeck': spraydeck,
        },
      );

  _i2.Future<void> createOrUpdateThrowbag(
    _i5.Gear gear,
    _i14.GearThrowbag throwbag,
  ) =>
      caller.callServerEndpoint<void>(
        'gearManage',
        'createOrUpdateThrowbag',
        {
          'gear': gear,
          'throwbag': throwbag,
        },
      );
}

/// {@category Endpoint}
class EndpointGearRead extends _i1.EndpointRef {
  EndpointGearRead(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'gearRead';

  _i2.Future<List<(_i5.Gear, _i6.GearBelt)>> getAllBelts() =>
      caller.callServerEndpoint<List<(_i5.Gear, _i6.GearBelt)>>(
        'gearRead',
        'getAllBelts',
        {},
      );

  _i2.Stream<List<(_i5.Gear, _i6.GearBelt)>> watchAllBelts() =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<List<(_i5.Gear, _i6.GearBelt)>>,
          List<(_i5.Gear, _i6.GearBelt)>>(
        'gearRead',
        'watchAllBelts',
        {},
        {},
      );

  _i2.Future<List<(_i5.Gear, _i7.GearClothing)>> getAllClothes() =>
      caller.callServerEndpoint<List<(_i5.Gear, _i7.GearClothing)>>(
        'gearRead',
        'getAllClothes',
        {},
      );

  _i2.Stream<List<(_i5.Gear, _i7.GearClothing)>> watchAllClothes() =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<List<(_i5.Gear, _i7.GearClothing)>>,
          List<(_i5.Gear, _i7.GearClothing)>>(
        'gearRead',
        'watchAllClothes',
        {},
        {},
      );

  _i2.Future<List<(_i5.Gear, _i8.GearFloatbag)>> getAllFloatbags() =>
      caller.callServerEndpoint<List<(_i5.Gear, _i8.GearFloatbag)>>(
        'gearRead',
        'getAllFloatbags',
        {},
      );

  _i2.Stream<List<(_i5.Gear, _i8.GearFloatbag)>> watchAllFloatbags() =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<List<(_i5.Gear, _i8.GearFloatbag)>>,
          List<(_i5.Gear, _i8.GearFloatbag)>>(
        'gearRead',
        'watchAllFloatbags',
        {},
        {},
      );

  _i2.Future<List<(_i5.Gear, _i9.GearHelmet)>> getAllHelmets() =>
      caller.callServerEndpoint<List<(_i5.Gear, _i9.GearHelmet)>>(
        'gearRead',
        'getAllHelmets',
        {},
      );

  _i2.Stream<List<(_i5.Gear, _i9.GearHelmet)>> watchAllHelmets() =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<List<(_i5.Gear, _i9.GearHelmet)>>,
          List<(_i5.Gear, _i9.GearHelmet)>>(
        'gearRead',
        'watchAllHelmets',
        {},
        {},
      );

  _i2.Future<List<(_i5.Gear, _i10.GearKayak)>> getAllKayaks() =>
      caller.callServerEndpoint<List<(_i5.Gear, _i10.GearKayak)>>(
        'gearRead',
        'getAllKayaks',
        {},
      );

  _i2.Stream<List<(_i5.Gear, _i10.GearKayak)>> watchAllKayaks() =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<List<(_i5.Gear, _i10.GearKayak)>>,
          List<(_i5.Gear, _i10.GearKayak)>>(
        'gearRead',
        'watchAllKayaks',
        {},
        {},
      );

  _i2.Future<List<(_i5.Gear, _i11.GearPaddle)>> getAllPaddles() =>
      caller.callServerEndpoint<List<(_i5.Gear, _i11.GearPaddle)>>(
        'gearRead',
        'getAllPaddles',
        {},
      );

  _i2.Stream<List<(_i5.Gear, _i11.GearPaddle)>> watchAllPaddles() =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<List<(_i5.Gear, _i11.GearPaddle)>>,
          List<(_i5.Gear, _i11.GearPaddle)>>(
        'gearRead',
        'watchAllPaddles',
        {},
        {},
      );

  _i2.Future<List<(_i5.Gear, _i12.GearPfd)>> getAllPfds() =>
      caller.callServerEndpoint<List<(_i5.Gear, _i12.GearPfd)>>(
        'gearRead',
        'getAllPfds',
        {},
      );

  _i2.Stream<List<(_i5.Gear, _i12.GearPfd)>> watchAllPfds() =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<List<(_i5.Gear, _i12.GearPfd)>>,
          List<(_i5.Gear, _i12.GearPfd)>>(
        'gearRead',
        'watchAllPfds',
        {},
        {},
      );

  _i2.Future<List<(_i5.Gear, _i13.GearSpraydeck)>> getAllSpraydecks() =>
      caller.callServerEndpoint<List<(_i5.Gear, _i13.GearSpraydeck)>>(
        'gearRead',
        'getAllSpraydecks',
        {},
      );

  _i2.Stream<List<(_i5.Gear, _i13.GearSpraydeck)>> watchAllSpraydecks() =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<List<(_i5.Gear, _i13.GearSpraydeck)>>,
          List<(_i5.Gear, _i13.GearSpraydeck)>>(
        'gearRead',
        'watchAllSpraydecks',
        {},
        {},
      );

  _i2.Future<List<(_i5.Gear, _i14.GearThrowbag)>> getAllThrowbags() =>
      caller.callServerEndpoint<List<(_i5.Gear, _i14.GearThrowbag)>>(
        'gearRead',
        'getAllThrowbags',
        {},
      );

  _i2.Stream<List<(_i5.Gear, _i14.GearThrowbag)>> watchAllThrowbags() =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<List<(_i5.Gear, _i14.GearThrowbag)>>,
          List<(_i5.Gear, _i14.GearThrowbag)>>(
        'gearRead',
        'watchAllThrowbags',
        {},
        {},
      );
}

/// {@category Endpoint}
class EndpointHours extends _i1.EndpointRef {
  EndpointHours(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'hours';

  _i2.Future<List<_i15.Hour>> getHours({int? userId}) =>
      caller.callServerEndpoint<List<_i15.Hour>>(
        'hours',
        'getHours',
        {'userId': userId},
      );

  _i2.Stream<List<_i15.Hour>> watchHours({int? userId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<List<_i15.Hour>>,
          List<_i15.Hour>>(
        'hours',
        'watchHours',
        {'userId': userId},
        {},
      );

  _i2.Future<List<_i15.Hour>> getAwaitingHours() =>
      caller.callServerEndpoint<List<_i15.Hour>>(
        'hours',
        'getAwaitingHours',
        {},
      );

  _i2.Stream<List<_i15.Hour>> watchAwaitingHours() =>
      caller.callStreamingServerEndpoint<_i2.Stream<List<_i15.Hour>>,
          List<_i15.Hour>>(
        'hours',
        'watchAwaitingHours',
        {},
        {},
      );

  _i2.Future<int> getHoursSum(int userId) => caller.callServerEndpoint<int>(
        'hours',
        'getHoursSum',
        {'userId': userId},
      );

  _i2.Stream<int> watchHoursSum(int userId) =>
      caller.callStreamingServerEndpoint<_i2.Stream<int>, int>(
        'hours',
        'watchHoursSum',
        {'userId': userId},
        {},
      );

  _i2.Future<void> createOrUpdateHour(_i15.Hour hour) =>
      caller.callServerEndpoint<void>(
        'hours',
        'createOrUpdateHour',
        {'hour': hour},
      );

  _i2.Future<void> deleteHour(_i15.Hour hour) =>
      caller.callServerEndpoint<void>(
        'hours',
        'deleteHour',
        {'hour': hour},
      );
}

/// {@category Endpoint}
class EndpointRental extends _i1.EndpointRef {
  EndpointRental(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'rental';

  _i2.Future<List<_i16.Rental>> getRentals({required bool past}) =>
      caller.callServerEndpoint<List<_i16.Rental>>(
        'rental',
        'getRentals',
        {'past': past},
      );

  _i2.Stream<List<_i16.Rental>> watchRentals({required bool past}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<List<_i16.Rental>>,
          List<_i16.Rental>>(
        'rental',
        'watchRentals',
        {'past': past},
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

  _i2.Future<_i17.UserInfoPublic> getUserInfo(int userId) =>
      caller.callServerEndpoint<_i17.UserInfoPublic>(
        'user',
        'getUserInfo',
        {'userId': userId},
      );

  _i2.Future<_i18.PrzeUser> getPrzeUser([int? userId]) =>
      caller.callServerEndpoint<_i18.PrzeUser>(
        'user',
        'getPrzeUser',
        {'userId': userId},
      );

  _i2.Stream<_i18.PrzeUser> watchPrzeUser([int? userId]) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i18.PrzeUser>,
          _i18.PrzeUser>(
        'user',
        'watchPrzeUser',
        {'userId': userId},
        {},
      );

  _i2.Future<List<_i18.PrzeUser>> getAllPrzeUsers() =>
      caller.callServerEndpoint<List<_i18.PrzeUser>>(
        'user',
        'getAllPrzeUsers',
        {},
      );

  _i2.Stream<List<_i18.PrzeUser>> watchAllPrzeUsers() =>
      caller.callStreamingServerEndpoint<_i2.Stream<List<_i18.PrzeUser>>,
          List<_i18.PrzeUser>>(
        'user',
        'watchAllPrzeUsers',
        {},
        {},
      );

  _i2.Future<void> updateGearFavourite(
    _i5.Gear gear,
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

  _i2.Future<void> updateUser(_i18.PrzeUser extraUser) =>
      caller.callServerEndpoint<void>(
        'user',
        'updateUser',
        {'extraUser': extraUser},
      );

  _i2.Future<List<int>> getFavourites() => caller.callServerEndpoint<List<int>>(
        'user',
        'getFavourites',
        {},
      );

  _i2.Stream<List<int>> watchFavourites() =>
      caller.callStreamingServerEndpoint<_i2.Stream<List<int>>, List<int>>(
        'user',
        'watchFavourites',
        {},
        {},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i17.Caller(client);
  }

  late final _i17.Caller auth;
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
          _i19.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    comments = EndpointComments(this);
    events = EndpointEvents(this);
    gearManage = EndpointGearManage(this);
    gearRead = EndpointGearRead(this);
    hours = EndpointHours(this);
    rental = EndpointRental(this);
    user = EndpointUser(this);
    modules = Modules(this);
  }

  late final EndpointComments comments;

  late final EndpointEvents events;

  late final EndpointGearManage gearManage;

  late final EndpointGearRead gearRead;

  late final EndpointHours hours;

  late final EndpointRental rental;

  late final EndpointUser user;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'comments': comments,
        'events': events,
        'gearManage': gearManage,
        'gearRead': gearRead,
        'hours': hours,
        'rental': rental,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
