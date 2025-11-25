/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../comments_endpoint.dart' as _i2;
import '../events_endpoint.dart' as _i3;
import '../gear_manage_endpoint.dart' as _i4;
import '../gear_read_endpoint.dart' as _i5;
import '../hours_endpoint.dart' as _i6;
import '../rental_endpoint.dart' as _i7;
import '../user_endpoint.dart' as _i8;
import 'package:przewrotkapp_server/src/generated/protocol.dart' as _i9;
import 'dart:typed_data' as _i10;
import 'package:przewrotkapp_server/src/generated/gear/gear.dart' as _i11;
import 'package:przewrotkapp_server/src/generated/gear/gear_belt.dart' as _i12;
import 'package:przewrotkapp_server/src/generated/gear/gear_clothing.dart'
    as _i13;
import 'package:przewrotkapp_server/src/generated/gear/gear_floatbag.dart'
    as _i14;
import 'package:przewrotkapp_server/src/generated/gear/gear_helmet.dart'
    as _i15;
import 'package:przewrotkapp_server/src/generated/gear/gear_kayak.dart' as _i16;
import 'package:przewrotkapp_server/src/generated/gear/gear_paddle.dart'
    as _i17;
import 'package:przewrotkapp_server/src/generated/gear/gear_pfd.dart' as _i18;
import 'package:przewrotkapp_server/src/generated/gear/gear_spraydeck.dart'
    as _i19;
import 'package:przewrotkapp_server/src/generated/gear/gear_throwbag.dart'
    as _i20;
import 'package:przewrotkapp_server/src/generated/hour.dart' as _i21;
import 'package:przewrotkapp_server/src/generated/user/prze_user.dart' as _i22;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i23;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'comments': _i2.CommentsEndpoint()
        ..initialize(
          server,
          'comments',
          null,
        ),
      'events': _i3.Events()
        ..initialize(
          server,
          'events',
          null,
        ),
      'gearManage': _i4.GearManageEndpoint()
        ..initialize(
          server,
          'gearManage',
          null,
        ),
      'gearRead': _i5.GearReadEndpoint()
        ..initialize(
          server,
          'gearRead',
          null,
        ),
      'hours': _i6.HoursEndpoint()
        ..initialize(
          server,
          'hours',
          null,
        ),
      'rental': _i7.RentalEndpoint()
        ..initialize(
          server,
          'rental',
          null,
        ),
      'user': _i8.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
    };
    connectors['comments'] = _i1.EndpointConnector(
      name: 'comments',
      endpoint: endpoints['comments']!,
      methodConnectors: {
        'getComments': _i1.MethodConnector(
          name: 'getComments',
          params: {
            'resolved': _i1.ParameterDescription(
              name: 'resolved',
              type: _i1.getType<bool>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['comments'] as _i2.CommentsEndpoint).getComments(
            session,
            resolved: params['resolved'],
          ),
        ),
        'watchComments': _i1.MethodStreamConnector(
          name: 'watchComments',
          params: {
            'resolved': _i1.ParameterDescription(
              name: 'resolved',
              type: _i1.getType<bool>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['comments'] as _i2.CommentsEndpoint).watchComments(
            session,
            resolved: params['resolved'],
          ),
        ),
      },
    );
    connectors['events'] = _i1.EndpointConnector(
      name: 'events',
      endpoint: endpoints['events']!,
      methodConnectors: {
        'getDiscordEvents': _i1.MethodConnector(
          name: 'getDiscordEvents',
          params: {
            'past': _i1.ParameterDescription(
              name: 'past',
              type: _i1.getType<bool>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['events'] as _i3.Events)
                  .getDiscordEvents(
                    session,
                    past: params['past'],
                  )
                  .then((container) =>
                      _i9.mapRecordContainingContainerToJson(container)),
        )
      },
    );
    connectors['gearManage'] = _i1.EndpointConnector(
      name: 'gearManage',
      endpoint: endpoints['gearManage']!,
      methodConnectors: {
        'uploadGearImage': _i1.MethodConnector(
          name: 'uploadGearImage',
          params: {
            'imageBytes': _i1.ParameterDescription(
              name: 'imageBytes',
              type: _i1.getType<_i10.ByteData>(),
              nullable: false,
            ),
            'clubId': _i1.ParameterDescription(
              name: 'clubId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearManage'] as _i4.GearManageEndpoint)
                  .uploadGearImage(
            session,
            params['imageBytes'],
            params['clubId'],
          ),
        ),
        'createOrUpdateBelt': _i1.MethodConnector(
          name: 'createOrUpdateBelt',
          params: {
            'gear': _i1.ParameterDescription(
              name: 'gear',
              type: _i1.getType<_i11.Gear>(),
              nullable: false,
            ),
            'belt': _i1.ParameterDescription(
              name: 'belt',
              type: _i1.getType<_i12.GearBelt>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearManage'] as _i4.GearManageEndpoint)
                  .createOrUpdateBelt(
            session,
            params['gear'],
            params['belt'],
          ),
        ),
        'createOrUpdateClothing': _i1.MethodConnector(
          name: 'createOrUpdateClothing',
          params: {
            'gear': _i1.ParameterDescription(
              name: 'gear',
              type: _i1.getType<_i11.Gear>(),
              nullable: false,
            ),
            'clothing': _i1.ParameterDescription(
              name: 'clothing',
              type: _i1.getType<_i13.GearClothing>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearManage'] as _i4.GearManageEndpoint)
                  .createOrUpdateClothing(
            session,
            params['gear'],
            params['clothing'],
          ),
        ),
        'createOrUpdateFloatbag': _i1.MethodConnector(
          name: 'createOrUpdateFloatbag',
          params: {
            'gear': _i1.ParameterDescription(
              name: 'gear',
              type: _i1.getType<_i11.Gear>(),
              nullable: false,
            ),
            'floatbag': _i1.ParameterDescription(
              name: 'floatbag',
              type: _i1.getType<_i14.GearFloatbag>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearManage'] as _i4.GearManageEndpoint)
                  .createOrUpdateFloatbag(
            session,
            params['gear'],
            params['floatbag'],
          ),
        ),
        'createOrUpdateHelmet': _i1.MethodConnector(
          name: 'createOrUpdateHelmet',
          params: {
            'gear': _i1.ParameterDescription(
              name: 'gear',
              type: _i1.getType<_i11.Gear>(),
              nullable: false,
            ),
            'helmet': _i1.ParameterDescription(
              name: 'helmet',
              type: _i1.getType<_i15.GearHelmet>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearManage'] as _i4.GearManageEndpoint)
                  .createOrUpdateHelmet(
            session,
            params['gear'],
            params['helmet'],
          ),
        ),
        'createOrUpdateKayak': _i1.MethodConnector(
          name: 'createOrUpdateKayak',
          params: {
            'gear': _i1.ParameterDescription(
              name: 'gear',
              type: _i1.getType<_i11.Gear>(),
              nullable: false,
            ),
            'kayak': _i1.ParameterDescription(
              name: 'kayak',
              type: _i1.getType<_i16.GearKayak>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearManage'] as _i4.GearManageEndpoint)
                  .createOrUpdateKayak(
            session,
            params['gear'],
            params['kayak'],
          ),
        ),
        'createOrUpdatePaddle': _i1.MethodConnector(
          name: 'createOrUpdatePaddle',
          params: {
            'gear': _i1.ParameterDescription(
              name: 'gear',
              type: _i1.getType<_i11.Gear>(),
              nullable: false,
            ),
            'paddle': _i1.ParameterDescription(
              name: 'paddle',
              type: _i1.getType<_i17.GearPaddle>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearManage'] as _i4.GearManageEndpoint)
                  .createOrUpdatePaddle(
            session,
            params['gear'],
            params['paddle'],
          ),
        ),
        'createOrUpdatePfd': _i1.MethodConnector(
          name: 'createOrUpdatePfd',
          params: {
            'gear': _i1.ParameterDescription(
              name: 'gear',
              type: _i1.getType<_i11.Gear>(),
              nullable: false,
            ),
            'pfd': _i1.ParameterDescription(
              name: 'pfd',
              type: _i1.getType<_i18.GearPfd>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearManage'] as _i4.GearManageEndpoint)
                  .createOrUpdatePfd(
            session,
            params['gear'],
            params['pfd'],
          ),
        ),
        'createOrUpdateSpraydeck': _i1.MethodConnector(
          name: 'createOrUpdateSpraydeck',
          params: {
            'gear': _i1.ParameterDescription(
              name: 'gear',
              type: _i1.getType<_i11.Gear>(),
              nullable: false,
            ),
            'spraydeck': _i1.ParameterDescription(
              name: 'spraydeck',
              type: _i1.getType<_i19.GearSpraydeck>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearManage'] as _i4.GearManageEndpoint)
                  .createOrUpdateSpraydeck(
            session,
            params['gear'],
            params['spraydeck'],
          ),
        ),
        'createOrUpdateThrowbag': _i1.MethodConnector(
          name: 'createOrUpdateThrowbag',
          params: {
            'gear': _i1.ParameterDescription(
              name: 'gear',
              type: _i1.getType<_i11.Gear>(),
              nullable: false,
            ),
            'throwbag': _i1.ParameterDescription(
              name: 'throwbag',
              type: _i1.getType<_i20.GearThrowbag>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearManage'] as _i4.GearManageEndpoint)
                  .createOrUpdateThrowbag(
            session,
            params['gear'],
            params['throwbag'],
          ),
        ),
      },
    );
    connectors['gearRead'] = _i1.EndpointConnector(
      name: 'gearRead',
      endpoint: endpoints['gearRead']!,
      methodConnectors: {
        'getAllBelts': _i1.MethodConnector(
          name: 'getAllBelts',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .getAllBelts(session)
                  .then((container) =>
                      _i9.mapRecordContainingContainerToJson(container)),
        ),
        'getAllClothes': _i1.MethodConnector(
          name: 'getAllClothes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .getAllClothes(session)
                  .then((container) =>
                      _i9.mapRecordContainingContainerToJson(container)),
        ),
        'getAllFloatbags': _i1.MethodConnector(
          name: 'getAllFloatbags',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .getAllFloatbags(session)
                  .then((container) =>
                      _i9.mapRecordContainingContainerToJson(container)),
        ),
        'getAllHelmets': _i1.MethodConnector(
          name: 'getAllHelmets',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .getAllHelmets(session)
                  .then((container) =>
                      _i9.mapRecordContainingContainerToJson(container)),
        ),
        'getAllKayaks': _i1.MethodConnector(
          name: 'getAllKayaks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .getAllKayaks(session)
                  .then((container) =>
                      _i9.mapRecordContainingContainerToJson(container)),
        ),
        'getAllPaddles': _i1.MethodConnector(
          name: 'getAllPaddles',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .getAllPaddles(session)
                  .then((container) =>
                      _i9.mapRecordContainingContainerToJson(container)),
        ),
        'getAllPfds': _i1.MethodConnector(
          name: 'getAllPfds',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .getAllPfds(session)
                  .then((container) =>
                      _i9.mapRecordContainingContainerToJson(container)),
        ),
        'getAllSpraydecks': _i1.MethodConnector(
          name: 'getAllSpraydecks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .getAllSpraydecks(session)
                  .then((container) =>
                      _i9.mapRecordContainingContainerToJson(container)),
        ),
        'getAllThrowbags': _i1.MethodConnector(
          name: 'getAllThrowbags',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .getAllThrowbags(session)
                  .then((container) =>
                      _i9.mapRecordContainingContainerToJson(container)),
        ),
        'watchAllBelts': _i1.MethodStreamConnector(
          name: 'watchAllBelts',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .watchAllBelts(session),
        ),
        'watchAllClothes': _i1.MethodStreamConnector(
          name: 'watchAllClothes',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .watchAllClothes(session),
        ),
        'watchAllFloatbags': _i1.MethodStreamConnector(
          name: 'watchAllFloatbags',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .watchAllFloatbags(session),
        ),
        'watchAllHelmets': _i1.MethodStreamConnector(
          name: 'watchAllHelmets',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .watchAllHelmets(session),
        ),
        'watchAllKayaks': _i1.MethodStreamConnector(
          name: 'watchAllKayaks',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .watchAllKayaks(session),
        ),
        'watchAllPaddles': _i1.MethodStreamConnector(
          name: 'watchAllPaddles',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .watchAllPaddles(session),
        ),
        'watchAllPfds': _i1.MethodStreamConnector(
          name: 'watchAllPfds',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .watchAllPfds(session),
        ),
        'watchAllSpraydecks': _i1.MethodStreamConnector(
          name: 'watchAllSpraydecks',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .watchAllSpraydecks(session),
        ),
        'watchAllThrowbags': _i1.MethodStreamConnector(
          name: 'watchAllThrowbags',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['gearRead'] as _i5.GearReadEndpoint)
                  .watchAllThrowbags(session),
        ),
      },
    );
    connectors['hours'] = _i1.EndpointConnector(
      name: 'hours',
      endpoint: endpoints['hours']!,
      methodConnectors: {
        'getHours': _i1.MethodConnector(
          name: 'getHours',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['hours'] as _i6.HoursEndpoint).getHours(
            session,
            userId: params['userId'],
          ),
        ),
        'getHoursSum': _i1.MethodConnector(
          name: 'getHoursSum',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['hours'] as _i6.HoursEndpoint).getHoursSum(
            session,
            params['userId'],
          ),
        ),
        'createOrUpdateHour': _i1.MethodConnector(
          name: 'createOrUpdateHour',
          params: {
            'hour': _i1.ParameterDescription(
              name: 'hour',
              type: _i1.getType<_i21.Hour>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['hours'] as _i6.HoursEndpoint).createOrUpdateHour(
            session,
            params['hour'],
          ),
        ),
        'deleteHour': _i1.MethodConnector(
          name: 'deleteHour',
          params: {
            'hour': _i1.ParameterDescription(
              name: 'hour',
              type: _i1.getType<_i21.Hour>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['hours'] as _i6.HoursEndpoint).deleteHour(
            session,
            params['hour'],
          ),
        ),
        'watchHours': _i1.MethodStreamConnector(
          name: 'watchHours',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['hours'] as _i6.HoursEndpoint).watchHours(
            session,
            userId: params['userId'],
          ),
        ),
        'watchHoursSum': _i1.MethodStreamConnector(
          name: 'watchHoursSum',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['hours'] as _i6.HoursEndpoint).watchHoursSum(
            session,
            params['userId'],
          ),
        ),
      },
    );
    connectors['rental'] = _i1.EndpointConnector(
      name: 'rental',
      endpoint: endpoints['rental']!,
      methodConnectors: {
        'getRentals': _i1.MethodConnector(
          name: 'getRentals',
          params: {
            'past': _i1.ParameterDescription(
              name: 'past',
              type: _i1.getType<bool>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['rental'] as _i7.RentalEndpoint).getRentals(
            session,
            past: params['past'],
          ),
        ),
        'rentGear': _i1.MethodConnector(
          name: 'rentGear',
          params: {
            'gear': _i1.ParameterDescription(
              name: 'gear',
              type: _i1.getType<List<_i11.Gear>>(),
              nullable: false,
            ),
            'from': _i1.ParameterDescription(
              name: 'from',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'to': _i1.ParameterDescription(
              name: 'to',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['rental'] as _i7.RentalEndpoint).rentGear(
            session,
            params['gear'],
            params['from'],
            params['to'],
          ),
        ),
        'watchRentals': _i1.MethodStreamConnector(
          name: 'watchRentals',
          params: {
            'past': _i1.ParameterDescription(
              name: 'past',
              type: _i1.getType<bool>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['rental'] as _i7.RentalEndpoint).watchRentals(
            session,
            past: params['past'],
          ),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'getUserInfo': _i1.MethodConnector(
          name: 'getUserInfo',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i8.UserEndpoint).getUserInfo(
            session,
            params['userId'],
          ),
        ),
        'getPrzeUser': _i1.MethodConnector(
          name: 'getPrzeUser',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i8.UserEndpoint).getPrzeUser(
            session,
            params['userId'],
          ),
        ),
        'updateGearFavourite': _i1.MethodConnector(
          name: 'updateGearFavourite',
          params: {
            'gear': _i1.ParameterDescription(
              name: 'gear',
              type: _i1.getType<_i11.Gear>(),
              nullable: false,
            ),
            'isFavourite': _i1.ParameterDescription(
              name: 'isFavourite',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i8.UserEndpoint).updateGearFavourite(
            session,
            params['gear'],
            params['isFavourite'],
          ),
        ),
        'updateUser': _i1.MethodConnector(
          name: 'updateUser',
          params: {
            'extraUser': _i1.ParameterDescription(
              name: 'extraUser',
              type: _i1.getType<_i22.PrzeUser>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i8.UserEndpoint).updateUser(
            session,
            params['extraUser'],
          ),
        ),
        'getFavourites': _i1.MethodConnector(
          name: 'getFavourites',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i8.UserEndpoint).getFavourites(session),
        ),
        'watchPrzeUser': _i1.MethodStreamConnector(
          name: 'watchPrzeUser',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['user'] as _i8.UserEndpoint).watchPrzeUser(
            session,
            params['userId'],
          ),
        ),
        'watchFavourites': _i1.MethodStreamConnector(
          name: 'watchFavourites',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['user'] as _i8.UserEndpoint).watchFavourites(session),
        ),
      },
    );
    modules['serverpod_auth'] = _i23.Endpoints()..initializeEndpoints(server);
  }
}
