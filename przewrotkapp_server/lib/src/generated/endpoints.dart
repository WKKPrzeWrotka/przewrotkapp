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
import '../all_kayaks_endpoint.dart' as _i2;
import '../greeting_endpoint.dart' as _i3;
import 'package:przewrotkapp_server/src/generated/gear/gear.dart' as _i4;
import 'package:przewrotkapp_server/src/generated/gear/gear_kayak.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'allKayaks': _i2.AllKayaksEndpoint()
        ..initialize(
          server,
          'allKayaks',
          null,
        ),
      'greeting': _i3.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['allKayaks'] = _i1.EndpointConnector(
      name: 'allKayaks',
      endpoint: endpoints['allKayaks']!,
      methodConnectors: {
        'getAllKayaks': _i1.MethodConnector(
          name: 'getAllKayaks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['allKayaks'] as _i2.AllKayaksEndpoint)
                  .getAllKayaks(session),
        ),
        'addNewKayak': _i1.MethodConnector(
          name: 'addNewKayak',
          params: {
            'gear': _i1.ParameterDescription(
              name: 'gear',
              type: _i1.getType<_i4.Gear>(),
              nullable: false,
            ),
            'kayak': _i1.ParameterDescription(
              name: 'kayak',
              type: _i1.getType<_i5.GearKayak>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['allKayaks'] as _i2.AllKayaksEndpoint).addNewKayak(
            session,
            params['gear'],
            params['kayak'],
          ),
        ),
        'addKayakPhoto': _i1.MethodConnector(
          name: 'addKayakPhoto',
          params: {
            'clubId': _i1.ParameterDescription(
              name: 'clubId',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['allKayaks'] as _i2.AllKayaksEndpoint).addKayakPhoto(
            session,
            params['clubId'],
          ),
        ),
        'getKayakPhoto': _i1.MethodConnector(
          name: 'getKayakPhoto',
          params: {
            'clubId': _i1.ParameterDescription(
              name: 'clubId',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['allKayaks'] as _i2.AllKayaksEndpoint).getKayakPhoto(
            session,
            params['clubId'],
          ),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['greeting'] as _i3.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
  }
}
