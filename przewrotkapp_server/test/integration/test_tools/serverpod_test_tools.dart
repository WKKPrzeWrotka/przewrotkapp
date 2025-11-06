/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_local_identifiers

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_test/serverpod_test.dart' as _i1;
import 'package:serverpod/serverpod.dart' as _i2;
import 'dart:async' as _i3;
import 'package:przewrotkapp_server/src/generated/gear/comment.dart' as _i4;
import 'package:przewrotkapp_server/src/generated/protocol.dart' as _i5;
import 'dart:typed_data' as _i6;
import 'package:przewrotkapp_server/src/generated/gear/gear.dart' as _i7;
import 'package:przewrotkapp_server/src/generated/gear/gear_belt.dart' as _i8;
import 'package:przewrotkapp_server/src/generated/gear/gear_clothing.dart'
    as _i9;
import 'package:przewrotkapp_server/src/generated/gear/gear_floatbag.dart'
    as _i10;
import 'package:przewrotkapp_server/src/generated/gear/gear_helmet.dart'
    as _i11;
import 'package:przewrotkapp_server/src/generated/gear/gear_kayak.dart' as _i12;
import 'package:przewrotkapp_server/src/generated/gear/gear_paddle.dart'
    as _i13;
import 'package:przewrotkapp_server/src/generated/gear/gear_pfd.dart' as _i14;
import 'package:przewrotkapp_server/src/generated/gear/gear_spraydeck.dart'
    as _i15;
import 'package:przewrotkapp_server/src/generated/gear/gear_throwbag.dart'
    as _i16;
import 'package:przewrotkapp_server/src/generated/hour.dart' as _i17;
import 'package:przewrotkapp_server/src/generated/rental/rental.dart' as _i18;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i19;
import 'package:przewrotkapp_server/src/generated/user/prze_user.dart' as _i20;
import 'package:przewrotkapp_server/src/generated/protocol.dart';
import 'package:przewrotkapp_server/src/generated/endpoints.dart';
export 'package:serverpod_test/serverpod_test_public_exports.dart';

/// Creates a new test group that takes a callback that can be used to write tests.
/// The callback has two parameters: `sessionBuilder` and `endpoints`.
/// `sessionBuilder` is used to build a `Session` object that represents the server state during an endpoint call and is used to set up scenarios.
/// `endpoints` contains all your Serverpod endpoints and lets you call them:
/// ```dart
/// withServerpod('Given Example endpoint', (sessionBuilder, endpoints) {
///   test('when calling `hello` then should return greeting', () async {
///     final greeting = await endpoints.example.hello(sessionBuilder, 'Michael');
///     expect(greeting, 'Hello Michael');
///   });
/// });
/// ```
///
/// **Configuration options**
///
/// [applyMigrations] Whether pending migrations should be applied when starting Serverpod. Defaults to `true`
///
/// [enableSessionLogging] Whether session logging should be enabled. Defaults to `false`
///
/// [rollbackDatabase] Options for when to rollback the database during the test lifecycle.
/// By default `withServerpod` does all database operations inside a transaction that is rolled back after each `test` case.
/// Just like the following enum describes, the behavior of the automatic rollbacks can be configured:
/// ```dart
/// /// Options for when to rollback the database during the test lifecycle.
/// enum RollbackDatabase {
///   /// After each test. This is the default.
///   afterEach,
///
///   /// After all tests.
///   afterAll,
///
///   /// Disable rolling back the database.
///   disabled,
/// }
/// ```
///
/// [runMode] The run mode that Serverpod should be running in. Defaults to `test`.
///
/// [serverpodLoggingMode] The logging mode used when creating Serverpod. Defaults to `ServerpodLoggingMode.normal`
///
/// [serverpodStartTimeout] The timeout to use when starting Serverpod, which connects to the database among other things. Defaults to `Duration(seconds: 30)`.
///
/// [testGroupTagsOverride] By default Serverpod test tools tags the `withServerpod` test group with `"integration"`.
/// This is to provide a simple way to only run unit or integration tests.
/// This property allows this tag to be overridden to something else. Defaults to `['integration']`.
///
/// [experimentalFeatures] Optionally specify experimental features. See [Serverpod] for more information.
@_i1.isTestGroup
void withServerpod(
  String testGroupName,
  _i1.TestClosure<TestEndpoints> testClosure, {
  bool? applyMigrations,
  bool? enableSessionLogging,
  _i2.ExperimentalFeatures? experimentalFeatures,
  _i1.RollbackDatabase? rollbackDatabase,
  String? runMode,
  _i2.RuntimeParametersListBuilder? runtimeParametersBuilder,
  _i2.ServerpodLoggingMode? serverpodLoggingMode,
  Duration? serverpodStartTimeout,
  List<String>? testGroupTagsOverride,
}) {
  _i1.buildWithServerpod<_InternalTestEndpoints>(
    testGroupName,
    _i1.TestServerpod(
      testEndpoints: _InternalTestEndpoints(),
      endpoints: Endpoints(),
      serializationManager: Protocol(),
      runMode: runMode,
      applyMigrations: applyMigrations,
      isDatabaseEnabled: true,
      serverpodLoggingMode: serverpodLoggingMode,
      experimentalFeatures: experimentalFeatures,
      runtimeParametersBuilder: runtimeParametersBuilder,
    ),
    maybeRollbackDatabase: rollbackDatabase,
    maybeEnableSessionLogging: enableSessionLogging,
    maybeTestGroupTagsOverride: testGroupTagsOverride,
    maybeServerpodStartTimeout: serverpodStartTimeout,
  )(testClosure);
}

class TestEndpoints {
  late final _CommentsEndpoint comments;

  late final _Events events;

  late final _GearManageEndpoint gearManage;

  late final _GearReadEndpoint gearRead;

  late final _HoursEndpoint hours;

  late final _RentalEndpoint rental;

  late final _UserEndpoint user;
}

class _InternalTestEndpoints extends TestEndpoints
    implements _i1.InternalTestEndpoints {
  @override
  void initialize(
    _i2.SerializationManager serializationManager,
    _i2.EndpointDispatch endpoints,
  ) {
    comments = _CommentsEndpoint(
      endpoints,
      serializationManager,
    );
    events = _Events(
      endpoints,
      serializationManager,
    );
    gearManage = _GearManageEndpoint(
      endpoints,
      serializationManager,
    );
    gearRead = _GearReadEndpoint(
      endpoints,
      serializationManager,
    );
    hours = _HoursEndpoint(
      endpoints,
      serializationManager,
    );
    rental = _RentalEndpoint(
      endpoints,
      serializationManager,
    );
    user = _UserEndpoint(
      endpoints,
      serializationManager,
    );
  }
}

class _CommentsEndpoint {
  _CommentsEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<List<_i4.Comment>> getComments(
    _i1.TestSessionBuilder sessionBuilder, {
    required bool resolved,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'comments',
        method: 'getComments',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'comments',
          methodName: 'getComments',
          parameters: _i1.testObjectToJson({'resolved': resolved}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<List<_i4.Comment>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<List<_i4.Comment>> watchComments(
    _i1.TestSessionBuilder sessionBuilder, {
    required bool resolved,
  }) {
    var _localTestStreamManager = _i1.TestStreamManager<List<_i4.Comment>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        var _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
          endpoint: 'comments',
          method: 'watchComments',
        );
        var _localCallContext =
            await _endpointDispatch.getMethodStreamCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'comments',
          methodName: 'watchComments',
          arguments: {'resolved': resolved},
          requestedInputStreams: [],
          serializationManager: _serializationManager,
        );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }
}

class _Events {
  _Events(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<List<({DateTime from, String name, DateTime to})>>
      getDiscordEvents(
    _i1.TestSessionBuilder sessionBuilder, {
    required bool past,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'events',
        method: 'getDiscordEvents',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'events',
          methodName: 'getDiscordEvents',
          parameters: _i1.testObjectToJson({'past': past}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then((record) => _i5.Protocol()
                .deserialize<List<({DateTime from, String name, DateTime to})>>(
                    record));
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _GearManageEndpoint {
  _GearManageEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<Uri> uploadGearImage(
    _i1.TestSessionBuilder sessionBuilder,
    _i6.ByteData imageBytes,
    String clubId,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearManage',
        method: 'uploadGearImage',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearManage',
          methodName: 'uploadGearImage',
          parameters: _i1.testObjectToJson({
            'imageBytes': imageBytes,
            'clubId': clubId,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<Uri>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> createOrUpdateBelt(
    _i1.TestSessionBuilder sessionBuilder,
    _i7.Gear gear,
    _i8.GearBelt belt,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearManage',
        method: 'createOrUpdateBelt',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearManage',
          methodName: 'createOrUpdateBelt',
          parameters: _i1.testObjectToJson({
            'gear': gear,
            'belt': belt,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> createOrUpdateClothing(
    _i1.TestSessionBuilder sessionBuilder,
    _i7.Gear gear,
    _i9.GearClothing clothing,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearManage',
        method: 'createOrUpdateClothing',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearManage',
          methodName: 'createOrUpdateClothing',
          parameters: _i1.testObjectToJson({
            'gear': gear,
            'clothing': clothing,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> createOrUpdateFloatbag(
    _i1.TestSessionBuilder sessionBuilder,
    _i7.Gear gear,
    _i10.GearFloatbag floatbag,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearManage',
        method: 'createOrUpdateFloatbag',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearManage',
          methodName: 'createOrUpdateFloatbag',
          parameters: _i1.testObjectToJson({
            'gear': gear,
            'floatbag': floatbag,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> createOrUpdateHelmet(
    _i1.TestSessionBuilder sessionBuilder,
    _i7.Gear gear,
    _i11.GearHelmet helmet,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearManage',
        method: 'createOrUpdateHelmet',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearManage',
          methodName: 'createOrUpdateHelmet',
          parameters: _i1.testObjectToJson({
            'gear': gear,
            'helmet': helmet,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> createOrUpdateKayak(
    _i1.TestSessionBuilder sessionBuilder,
    _i7.Gear gear,
    _i12.GearKayak kayak,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearManage',
        method: 'createOrUpdateKayak',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearManage',
          methodName: 'createOrUpdateKayak',
          parameters: _i1.testObjectToJson({
            'gear': gear,
            'kayak': kayak,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> createOrUpdatePaddle(
    _i1.TestSessionBuilder sessionBuilder,
    _i7.Gear gear,
    _i13.GearPaddle paddle,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearManage',
        method: 'createOrUpdatePaddle',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearManage',
          methodName: 'createOrUpdatePaddle',
          parameters: _i1.testObjectToJson({
            'gear': gear,
            'paddle': paddle,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> createOrUpdatePfd(
    _i1.TestSessionBuilder sessionBuilder,
    _i7.Gear gear,
    _i14.GearPfd pfd,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearManage',
        method: 'createOrUpdatePfd',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearManage',
          methodName: 'createOrUpdatePfd',
          parameters: _i1.testObjectToJson({
            'gear': gear,
            'pfd': pfd,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> createOrUpdateSpraydeck(
    _i1.TestSessionBuilder sessionBuilder,
    _i7.Gear gear,
    _i15.GearSpraydeck spraydeck,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearManage',
        method: 'createOrUpdateSpraydeck',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearManage',
          methodName: 'createOrUpdateSpraydeck',
          parameters: _i1.testObjectToJson({
            'gear': gear,
            'spraydeck': spraydeck,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> createOrUpdateThrowbag(
    _i1.TestSessionBuilder sessionBuilder,
    _i7.Gear gear,
    _i16.GearThrowbag throwbag,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearManage',
        method: 'createOrUpdateThrowbag',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearManage',
          methodName: 'createOrUpdateThrowbag',
          parameters: _i1.testObjectToJson({
            'gear': gear,
            'throwbag': throwbag,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _GearReadEndpoint {
  _GearReadEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<List<(_i7.Gear, _i8.GearBelt)>> getAllBelts(
      _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearRead',
        method: 'getAllBelts',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'getAllBelts',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then((record) => _i5.Protocol()
                .deserialize<List<(_i7.Gear, _i8.GearBelt)>>(record));
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<List<(_i7.Gear, _i8.GearBelt)>> watchAllBelts(
      _i1.TestSessionBuilder sessionBuilder) {
    var _localTestStreamManager =
        _i1.TestStreamManager<List<(_i7.Gear, _i8.GearBelt)>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        var _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
          endpoint: 'gearRead',
          method: 'watchAllBelts',
        );
        var _localCallContext =
            await _endpointDispatch.getMethodStreamCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'watchAllBelts',
          arguments: {},
          requestedInputStreams: [],
          serializationManager: _serializationManager,
        );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<List<(_i7.Gear, _i9.GearClothing)>> getAllClothes(
      _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearRead',
        method: 'getAllClothes',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'getAllClothes',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then((record) => _i5.Protocol()
                .deserialize<List<(_i7.Gear, _i9.GearClothing)>>(record));
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<List<(_i7.Gear, _i9.GearClothing)>> watchAllClothes(
      _i1.TestSessionBuilder sessionBuilder) {
    var _localTestStreamManager =
        _i1.TestStreamManager<List<(_i7.Gear, _i9.GearClothing)>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        var _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
          endpoint: 'gearRead',
          method: 'watchAllClothes',
        );
        var _localCallContext =
            await _endpointDispatch.getMethodStreamCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'watchAllClothes',
          arguments: {},
          requestedInputStreams: [],
          serializationManager: _serializationManager,
        );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<List<(_i7.Gear, _i10.GearFloatbag)>> getAllFloatbags(
      _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearRead',
        method: 'getAllFloatbags',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'getAllFloatbags',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then((record) => _i5.Protocol()
                .deserialize<List<(_i7.Gear, _i10.GearFloatbag)>>(record));
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<List<(_i7.Gear, _i10.GearFloatbag)>> watchAllFloatbags(
      _i1.TestSessionBuilder sessionBuilder) {
    var _localTestStreamManager =
        _i1.TestStreamManager<List<(_i7.Gear, _i10.GearFloatbag)>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        var _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
          endpoint: 'gearRead',
          method: 'watchAllFloatbags',
        );
        var _localCallContext =
            await _endpointDispatch.getMethodStreamCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'watchAllFloatbags',
          arguments: {},
          requestedInputStreams: [],
          serializationManager: _serializationManager,
        );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<List<(_i7.Gear, _i11.GearHelmet)>> getAllHelmets(
      _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearRead',
        method: 'getAllHelmets',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'getAllHelmets',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then((record) => _i5.Protocol()
                .deserialize<List<(_i7.Gear, _i11.GearHelmet)>>(record));
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<List<(_i7.Gear, _i11.GearHelmet)>> watchAllHelmets(
      _i1.TestSessionBuilder sessionBuilder) {
    var _localTestStreamManager =
        _i1.TestStreamManager<List<(_i7.Gear, _i11.GearHelmet)>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        var _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
          endpoint: 'gearRead',
          method: 'watchAllHelmets',
        );
        var _localCallContext =
            await _endpointDispatch.getMethodStreamCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'watchAllHelmets',
          arguments: {},
          requestedInputStreams: [],
          serializationManager: _serializationManager,
        );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<List<(_i7.Gear, _i12.GearKayak)>> getAllKayaks(
      _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearRead',
        method: 'getAllKayaks',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'getAllKayaks',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then((record) => _i5.Protocol()
                .deserialize<List<(_i7.Gear, _i12.GearKayak)>>(record));
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<List<(_i7.Gear, _i12.GearKayak)>> watchAllKayaks(
      _i1.TestSessionBuilder sessionBuilder) {
    var _localTestStreamManager =
        _i1.TestStreamManager<List<(_i7.Gear, _i12.GearKayak)>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        var _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
          endpoint: 'gearRead',
          method: 'watchAllKayaks',
        );
        var _localCallContext =
            await _endpointDispatch.getMethodStreamCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'watchAllKayaks',
          arguments: {},
          requestedInputStreams: [],
          serializationManager: _serializationManager,
        );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<List<(_i7.Gear, _i13.GearPaddle)>> getAllPaddles(
      _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearRead',
        method: 'getAllPaddles',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'getAllPaddles',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then((record) => _i5.Protocol()
                .deserialize<List<(_i7.Gear, _i13.GearPaddle)>>(record));
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<List<(_i7.Gear, _i13.GearPaddle)>> watchAllPaddles(
      _i1.TestSessionBuilder sessionBuilder) {
    var _localTestStreamManager =
        _i1.TestStreamManager<List<(_i7.Gear, _i13.GearPaddle)>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        var _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
          endpoint: 'gearRead',
          method: 'watchAllPaddles',
        );
        var _localCallContext =
            await _endpointDispatch.getMethodStreamCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'watchAllPaddles',
          arguments: {},
          requestedInputStreams: [],
          serializationManager: _serializationManager,
        );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<List<(_i7.Gear, _i14.GearPfd)>> getAllPfds(
      _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearRead',
        method: 'getAllPfds',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'getAllPfds',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then((record) => _i5.Protocol()
                .deserialize<List<(_i7.Gear, _i14.GearPfd)>>(record));
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<List<(_i7.Gear, _i14.GearPfd)>> watchAllPfds(
      _i1.TestSessionBuilder sessionBuilder) {
    var _localTestStreamManager =
        _i1.TestStreamManager<List<(_i7.Gear, _i14.GearPfd)>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        var _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
          endpoint: 'gearRead',
          method: 'watchAllPfds',
        );
        var _localCallContext =
            await _endpointDispatch.getMethodStreamCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'watchAllPfds',
          arguments: {},
          requestedInputStreams: [],
          serializationManager: _serializationManager,
        );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<List<(_i7.Gear, _i15.GearSpraydeck)>> getAllSpraydecks(
      _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearRead',
        method: 'getAllSpraydecks',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'getAllSpraydecks',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then((record) => _i5.Protocol()
                .deserialize<List<(_i7.Gear, _i15.GearSpraydeck)>>(record));
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<List<(_i7.Gear, _i15.GearSpraydeck)>> watchAllSpraydecks(
      _i1.TestSessionBuilder sessionBuilder) {
    var _localTestStreamManager =
        _i1.TestStreamManager<List<(_i7.Gear, _i15.GearSpraydeck)>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        var _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
          endpoint: 'gearRead',
          method: 'watchAllSpraydecks',
        );
        var _localCallContext =
            await _endpointDispatch.getMethodStreamCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'watchAllSpraydecks',
          arguments: {},
          requestedInputStreams: [],
          serializationManager: _serializationManager,
        );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<List<(_i7.Gear, _i16.GearThrowbag)>> getAllThrowbags(
      _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'gearRead',
        method: 'getAllThrowbags',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'getAllThrowbags',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await _localCallContext.method
            .call(
              _localUniqueSession,
              _localCallContext.arguments,
            )
            .then((record) => _i5.Protocol()
                .deserialize<List<(_i7.Gear, _i16.GearThrowbag)>>(record));
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<List<(_i7.Gear, _i16.GearThrowbag)>> watchAllThrowbags(
      _i1.TestSessionBuilder sessionBuilder) {
    var _localTestStreamManager =
        _i1.TestStreamManager<List<(_i7.Gear, _i16.GearThrowbag)>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        var _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
          endpoint: 'gearRead',
          method: 'watchAllThrowbags',
        );
        var _localCallContext =
            await _endpointDispatch.getMethodStreamCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'gearRead',
          methodName: 'watchAllThrowbags',
          arguments: {},
          requestedInputStreams: [],
          serializationManager: _serializationManager,
        );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }
}

class _HoursEndpoint {
  _HoursEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<List<_i17.Hour>> getHours(
    _i1.TestSessionBuilder sessionBuilder, {
    int? userId,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'hours',
        method: 'getHours',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'hours',
          methodName: 'getHours',
          parameters: _i1.testObjectToJson({'userId': userId}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<List<_i17.Hour>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<List<_i17.Hour>> watchHours(
    _i1.TestSessionBuilder sessionBuilder, {
    int? userId,
  }) {
    var _localTestStreamManager = _i1.TestStreamManager<List<_i17.Hour>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        var _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
          endpoint: 'hours',
          method: 'watchHours',
        );
        var _localCallContext =
            await _endpointDispatch.getMethodStreamCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'hours',
          methodName: 'watchHours',
          arguments: {'userId': userId},
          requestedInputStreams: [],
          serializationManager: _serializationManager,
        );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<int> getHoursSum(
    _i1.TestSessionBuilder sessionBuilder,
    int userId,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'hours',
        method: 'getHoursSum',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'hours',
          methodName: 'getHoursSum',
          parameters: _i1.testObjectToJson({'userId': userId}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<int>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<int> watchHoursSum(
    _i1.TestSessionBuilder sessionBuilder,
    int userId,
  ) {
    var _localTestStreamManager = _i1.TestStreamManager<int>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        var _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
          endpoint: 'hours',
          method: 'watchHoursSum',
        );
        var _localCallContext =
            await _endpointDispatch.getMethodStreamCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'hours',
          methodName: 'watchHoursSum',
          arguments: {'userId': userId},
          requestedInputStreams: [],
          serializationManager: _serializationManager,
        );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<void> claimHour(
    _i1.TestSessionBuilder sessionBuilder,
    _i17.Hour hour,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'hours',
        method: 'claimHour',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'hours',
          methodName: 'claimHour',
          parameters: _i1.testObjectToJson({'hour': hour}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _RentalEndpoint {
  _RentalEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<List<_i18.Rental>> getRentals(
    _i1.TestSessionBuilder sessionBuilder, {
    required bool past,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'rental',
        method: 'getRentals',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'rental',
          methodName: 'getRentals',
          parameters: _i1.testObjectToJson({'past': past}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<List<_i18.Rental>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<List<_i18.Rental>> watchRentals(
    _i1.TestSessionBuilder sessionBuilder, {
    required bool past,
  }) {
    var _localTestStreamManager = _i1.TestStreamManager<List<_i18.Rental>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        var _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
          endpoint: 'rental',
          method: 'watchRentals',
        );
        var _localCallContext =
            await _endpointDispatch.getMethodStreamCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'rental',
          methodName: 'watchRentals',
          arguments: {'past': past},
          requestedInputStreams: [],
          serializationManager: _serializationManager,
        );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<void> rentGear(
    _i1.TestSessionBuilder sessionBuilder,
    List<_i7.Gear> gear,
    DateTime from,
    DateTime to,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'rental',
        method: 'rentGear',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'rental',
          methodName: 'rentGear',
          parameters: _i1.testObjectToJson({
            'gear': gear,
            'from': from,
            'to': to,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _UserEndpoint {
  _UserEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i19.UserInfoPublic> getUserInfo(
    _i1.TestSessionBuilder sessionBuilder,
    int userId,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'user',
        method: 'getUserInfo',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'user',
          methodName: 'getUserInfo',
          parameters: _i1.testObjectToJson({'userId': userId}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<_i19.UserInfoPublic>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i20.PrzeUser> getPrzeUser(
    _i1.TestSessionBuilder sessionBuilder, [
    int? userId,
  ]) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'user',
        method: 'getPrzeUser',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'user',
          methodName: 'getPrzeUser',
          parameters: _i1.testObjectToJson({'userId': userId}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<_i20.PrzeUser>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<_i20.PrzeUser> watchPrzeUser(
    _i1.TestSessionBuilder sessionBuilder, [
    int? userId,
  ]) {
    var _localTestStreamManager = _i1.TestStreamManager<_i20.PrzeUser>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        var _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
          endpoint: 'user',
          method: 'watchPrzeUser',
        );
        var _localCallContext =
            await _endpointDispatch.getMethodStreamCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'user',
          methodName: 'watchPrzeUser',
          arguments: {'userId': userId},
          requestedInputStreams: [],
          serializationManager: _serializationManager,
        );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }

  _i3.Future<void> updateGearFavourite(
    _i1.TestSessionBuilder sessionBuilder,
    _i7.Gear gear,
    bool isFavourite,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'user',
        method: 'updateGearFavourite',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'user',
          methodName: 'updateGearFavourite',
          parameters: _i1.testObjectToJson({
            'gear': gear,
            'isFavourite': isFavourite,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<void> updateUser(
    _i1.TestSessionBuilder sessionBuilder,
    _i20.PrzeUser extraUser,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'user',
        method: 'updateUser',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'user',
          methodName: 'updateUser',
          parameters: _i1.testObjectToJson({'extraUser': extraUser}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<void>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<int>> getFavourites(
      _i1.TestSessionBuilder sessionBuilder) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
        endpoint: 'user',
        method: 'getFavourites',
      );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'user',
          methodName: 'getFavourites',
          parameters: _i1.testObjectToJson({}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue = await (_localCallContext.method.call(
          _localUniqueSession,
          _localCallContext.arguments,
        ) as _i3.Future<List<int>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Stream<List<int>> watchFavourites(_i1.TestSessionBuilder sessionBuilder) {
    var _localTestStreamManager = _i1.TestStreamManager<List<int>>();
    _i1.callStreamFunctionAndHandleExceptions(
      () async {
        var _localUniqueSession =
            (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
          endpoint: 'user',
          method: 'watchFavourites',
        );
        var _localCallContext =
            await _endpointDispatch.getMethodStreamCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'user',
          methodName: 'watchFavourites',
          arguments: {},
          requestedInputStreams: [],
          serializationManager: _serializationManager,
        );
        await _localTestStreamManager.callStreamMethod(
          _localCallContext,
          _localUniqueSession,
          {},
        );
      },
      _localTestStreamManager.outputStreamController,
    );
    return _localTestStreamManager.outputStreamController.stream;
  }
}
