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
import '../gear_read_endpoint.dart' as _i2;
import '../rental_endpoint.dart' as _i3;
import 'package:przewrotkapp_server/src/generated/gear/gear.dart' as _i4;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'gearRead': _i2.GearReadEndpoint()
        ..initialize(
          server,
          'gearRead',
          null,
        ),
      'rental': _i3.RentalEndpoint()
        ..initialize(
          server,
          'rental',
          null,
        ),
    };
    connectors['gearRead'] = _i1.EndpointConnector(
      name: 'gearRead',
      endpoint: endpoints['gearRead']!,
      methodConnectors: {
        'getAllGear': _i1.MethodConnector(
          name: 'getAllGear',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i2.GearReadEndpoint)
                  .getAllGear(session),
        ),
        'getAllBelts': _i1.MethodConnector(
          name: 'getAllBelts',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i2.GearReadEndpoint)
                  .getAllBelts(session),
        ),
        'getAllClothes': _i1.MethodConnector(
          name: 'getAllClothes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i2.GearReadEndpoint)
                  .getAllClothes(session),
        ),
        'getAllFloatbags': _i1.MethodConnector(
          name: 'getAllFloatbags',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i2.GearReadEndpoint)
                  .getAllFloatbags(session),
        ),
        'getAllHelmets': _i1.MethodConnector(
          name: 'getAllHelmets',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i2.GearReadEndpoint)
                  .getAllHelmets(session),
        ),
        'getAllKayaks': _i1.MethodConnector(
          name: 'getAllKayaks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i2.GearReadEndpoint)
                  .getAllKayaks(session),
        ),
        'getAllPaddles': _i1.MethodConnector(
          name: 'getAllPaddles',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i2.GearReadEndpoint)
                  .getAllPaddles(session),
        ),
        'getAllPfds': _i1.MethodConnector(
          name: 'getAllPfds',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i2.GearReadEndpoint)
                  .getAllPfds(session),
        ),
        'getAllSpraydecks': _i1.MethodConnector(
          name: 'getAllSpraydecks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i2.GearReadEndpoint)
                  .getAllSpraydecks(session),
        ),
        'getAllThrowbags': _i1.MethodConnector(
          name: 'getAllThrowbags',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gearRead'] as _i2.GearReadEndpoint)
                  .getAllThrowbags(session),
        ),
      },
    );
    connectors['rental'] = _i1.EndpointConnector(
      name: 'rental',
      endpoint: endpoints['rental']!,
      methodConnectors: {
        'getAllRentals': _i1.MethodConnector(
          name: 'getAllRentals',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['rental'] as _i3.RentalEndpoint)
                  .getAllRentals(session),
        ),
        'rentGear': _i1.MethodConnector(
          name: 'rentGear',
          params: {
            'gear': _i1.ParameterDescription(
              name: 'gear',
              type: _i1.getType<List<_i4.Gear>>(),
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
              (endpoints['rental'] as _i3.RentalEndpoint).rentGear(
            session,
            params['gear'],
            params['from'],
            params['to'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i5.Endpoints()..initializeEndpoints(server);
  }
}
