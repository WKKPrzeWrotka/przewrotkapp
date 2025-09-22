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
import '../events_endpoint.dart' as _i2;
import '../gear_read_endpoint.dart' as _i3;
import '../rental_endpoint.dart' as _i4;
import '../user_endpoint.dart' as _i5;
import 'package:przewrotkapp_server/src/generated/protocol.dart' as _i6;
import 'package:przewrotkapp_server/src/generated/gear/gear.dart' as _i7;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i8;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'events': _i2.Events()
        ..initialize(
          server,
          'events',
          null,
        ),
      'gearRead': _i3.GearReadEndpoint()
        ..initialize(
          server,
          'gearRead',
          null,
        ),
      'rental': _i4.RentalEndpoint()
        ..initialize(
          server,
          'rental',
          null,
        ),
      'user': _i5.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
    };
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
              (endpoints['events'] as _i2.Events)
                  .getDiscordEvents(
                    session,
                    past: params['past'],
                  )
                  .then((container) =>
                      _i6.mapRecordContainingContainerToJson(container)),
        )
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
              (endpoints['gearRead'] as _i3.GearReadEndpoint)
                  .getAllBelts(session)
                  .then((container) =>
                      _i6.mapRecordContainingContainerToJson(container)),
        ),
        'getAllClothes': _i1.MethodConnector(
          name: 'getAllClothes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i3.GearReadEndpoint)
                  .getAllClothes(session)
                  .then((container) =>
                      _i6.mapRecordContainingContainerToJson(container)),
        ),
        'getAllFloatbags': _i1.MethodConnector(
          name: 'getAllFloatbags',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i3.GearReadEndpoint)
                  .getAllFloatbags(session)
                  .then((container) =>
                      _i6.mapRecordContainingContainerToJson(container)),
        ),
        'getAllHelmets': _i1.MethodConnector(
          name: 'getAllHelmets',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i3.GearReadEndpoint)
                  .getAllHelmets(session)
                  .then((container) =>
                      _i6.mapRecordContainingContainerToJson(container)),
        ),
        'getAllKayaks': _i1.MethodConnector(
          name: 'getAllKayaks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i3.GearReadEndpoint)
                  .getAllKayaks(session)
                  .then((container) =>
                      _i6.mapRecordContainingContainerToJson(container)),
        ),
        'getAllPaddles': _i1.MethodConnector(
          name: 'getAllPaddles',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i3.GearReadEndpoint)
                  .getAllPaddles(session)
                  .then((container) =>
                      _i6.mapRecordContainingContainerToJson(container)),
        ),
        'getAllPfds': _i1.MethodConnector(
          name: 'getAllPfds',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i3.GearReadEndpoint)
                  .getAllPfds(session)
                  .then((container) =>
                      _i6.mapRecordContainingContainerToJson(container)),
        ),
        'getAllSpraydecks': _i1.MethodConnector(
          name: 'getAllSpraydecks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i3.GearReadEndpoint)
                  .getAllSpraydecks(session)
                  .then((container) =>
                      _i6.mapRecordContainingContainerToJson(container)),
        ),
        'getAllThrowbags': _i1.MethodConnector(
          name: 'getAllThrowbags',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i3.GearReadEndpoint)
                  .getAllThrowbags(session)
                  .then((container) =>
                      _i6.mapRecordContainingContainerToJson(container)),
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
              (endpoints['rental'] as _i4.RentalEndpoint).getRentals(
            session,
            past: params['past'],
          ),
        ),
        'rentGear': _i1.MethodConnector(
          name: 'rentGear',
          params: {
            'gear': _i1.ParameterDescription(
              name: 'gear',
              type: _i1.getType<List<_i7.Gear>>(),
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
              (endpoints['rental'] as _i4.RentalEndpoint).rentGear(
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
              (endpoints['rental'] as _i4.RentalEndpoint).watchRentals(
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
              (endpoints['user'] as _i5.UserEndpoint).getUserInfo(
            session,
            params['userId'],
          ),
        ),
        'getExtraUserInfo': _i1.MethodConnector(
          name: 'getExtraUserInfo',
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
              (endpoints['user'] as _i5.UserEndpoint).getExtraUserInfo(
            session,
            params['userId'],
          ),
        ),
        'updateGearFavourite': _i1.MethodConnector(
          name: 'updateGearFavourite',
          params: {
            'gear': _i1.ParameterDescription(
              name: 'gear',
              type: _i1.getType<_i7.Gear>(),
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
              (endpoints['user'] as _i5.UserEndpoint).updateGearFavourite(
            session,
            params['gear'],
            params['isFavourite'],
          ),
        ),
        'watchExtraUserInfo': _i1.MethodStreamConnector(
          name: 'watchExtraUserInfo',
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
              (endpoints['user'] as _i5.UserEndpoint).watchExtraUserInfo(
            session,
            params['userId'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i8.Endpoints()..initializeEndpoints(server);
  }
}
