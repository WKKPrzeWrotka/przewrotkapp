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
import 'package:serverpod/protocol.dart' as _i2;
import 'greeting.dart' as _i3;
import 'exceptions/kayak_exception.dart' as _i4;
import 'gear/clothing_type.dart' as _i5;
import 'gear/gear.dart' as _i6;
import 'gear/gear_data_belt.dart' as _i7;
import 'gear/gear_data_clothing.dart' as _i8;
import 'gear/gear_data_helmet.dart' as _i9;
import 'gear/gear_data_kayak.dart' as _i10;
import 'gear/gear_data_paddle.dart' as _i11;
import 'gear/gear_data_pfd.dart' as _i12;
import 'gear/gear_data_spraydeck.dart' as _i13;
import 'gear/gear_data_throwbag.dart' as _i14;
import 'gear/generic_gear_size.dart' as _i15;
import 'gear/kayak_type.dart' as _i16;
import 'gear/paddle_type.dart' as _i17;
import 'gear/pfd_type.dart' as _i18;
import 'gear/spraydeck_deck_size.dart' as _i19;
import 'package:przewrotkapp_server/src/generated/gear/gear.dart' as _i20;
export 'greeting.dart';
export 'exceptions/kayak_exception.dart';
export 'gear/clothing_type.dart';
export 'gear/gear.dart';
export 'gear/gear_data_belt.dart';
export 'gear/gear_data_clothing.dart';
export 'gear/gear_data_helmet.dart';
export 'gear/gear_data_kayak.dart';
export 'gear/gear_data_paddle.dart';
export 'gear/gear_data_pfd.dart';
export 'gear/gear_data_spraydeck.dart';
export 'gear/gear_data_throwbag.dart';
export 'gear/generic_gear_size.dart';
export 'gear/kayak_type.dart';
export 'gear/paddle_type.dart';
export 'gear/pfd_type.dart';
export 'gear/spraydeck_deck_size.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'gear',
      dartName: 'Gear',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'clubId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'manufacturer',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'model',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'friendlyName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'photoUrls',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<Uri>?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'gear_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'gear_data_belts',
      dartName: 'GearDataBelt',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_data_belts_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'gearId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'length',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'gear_data_belts_fk_0',
          columns: ['gearId'],
          referenceTable: 'gear',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'gear_data_belts_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'belts_gear_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'gearId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'gear_data_clothes',
      dartName: 'GearDataClothing',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_data_clothes_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'gearId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ClothingType',
        ),
        _i2.ColumnDefinition(
          name: 'typeDescription',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'gear_data_clothes_fk_0',
          columns: ['gearId'],
          referenceTable: 'gear',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'gear_data_clothes_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'clothes_gear_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'gearId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'gear_data_helmets',
      dartName: 'GearDataHelmet',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_data_helmets_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'gearId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'size',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:GenericGearSize',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'gear_data_helmets_fk_0',
          columns: ['gearId'],
          referenceTable: 'gear',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'gear_data_helmets_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'helmets_gear_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'gearId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'gear_data_kayaks',
      dartName: 'GearDataKayak',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_data_kayaks_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'gearId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:KayakType',
        ),
        _i2.ColumnDefinition(
          name: 'minWeight',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'maxWeight',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'length',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'gear_data_kayaks_fk_0',
          columns: ['gearId'],
          referenceTable: 'gear',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'gear_data_kayaks_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'kayaks_gear_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'gearId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'gear_data_paddles',
      dartName: 'GearDataPaddle',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_data_paddles_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'gearId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:PaddleType',
        ),
        _i2.ColumnDefinition(
          name: 'length',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'rotation',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'gear_data_paddles_fk_0',
          columns: ['gearId'],
          referenceTable: 'gear',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'gear_data_paddles_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'paddles_gear_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'gearId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'gear_data_pfds',
      dartName: 'GearDataPfd',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_data_pfds_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'gearId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'size',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:GenericGearSize',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:PfdType',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'gear_data_pfds_fk_0',
          columns: ['gearId'],
          referenceTable: 'gear',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'gear_data_pfds_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'pfds_gear_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'gearId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'gear_data_spraydecks',
      dartName: 'GearDataSpraydeck',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_data_spraydecks_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'gearId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'deckSize',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:SpraydeckDeckSize',
        ),
        _i2.ColumnDefinition(
          name: 'waistSize',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:GenericGearSize',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'gear_data_spraydecks_fk_0',
          columns: ['gearId'],
          referenceTable: 'gear',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'gear_data_spraydecks_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'spraydecks_gear_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'gearId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'gear_data_throwbags',
      dartName: 'GearDataThrowbag',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_data_throwbags_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'gearId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'length',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'gear_data_throwbags_fk_0',
          columns: ['gearId'],
          referenceTable: 'gear',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'gear_data_throwbags_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'throwbags_gear_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'gearId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.Greeting) {
      return _i3.Greeting.fromJson(data) as T;
    }
    if (t == _i4.KayakException) {
      return _i4.KayakException.fromJson(data) as T;
    }
    if (t == _i5.ClothingType) {
      return _i5.ClothingType.fromJson(data) as T;
    }
    if (t == _i6.Gear) {
      return _i6.Gear.fromJson(data) as T;
    }
    if (t == _i7.GearDataBelt) {
      return _i7.GearDataBelt.fromJson(data) as T;
    }
    if (t == _i8.GearDataClothing) {
      return _i8.GearDataClothing.fromJson(data) as T;
    }
    if (t == _i9.GearDataHelmet) {
      return _i9.GearDataHelmet.fromJson(data) as T;
    }
    if (t == _i10.GearDataKayak) {
      return _i10.GearDataKayak.fromJson(data) as T;
    }
    if (t == _i11.GearDataPaddle) {
      return _i11.GearDataPaddle.fromJson(data) as T;
    }
    if (t == _i12.GearDataPfd) {
      return _i12.GearDataPfd.fromJson(data) as T;
    }
    if (t == _i13.GearDataSpraydeck) {
      return _i13.GearDataSpraydeck.fromJson(data) as T;
    }
    if (t == _i14.GearDataThrowbag) {
      return _i14.GearDataThrowbag.fromJson(data) as T;
    }
    if (t == _i15.GenericGearSize) {
      return _i15.GenericGearSize.fromJson(data) as T;
    }
    if (t == _i16.KayakType) {
      return _i16.KayakType.fromJson(data) as T;
    }
    if (t == _i17.PaddleType) {
      return _i17.PaddleType.fromJson(data) as T;
    }
    if (t == _i18.PfdType) {
      return _i18.PfdType.fromJson(data) as T;
    }
    if (t == _i19.SpraydeckDeckSize) {
      return _i19.SpraydeckDeckSize.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.Greeting?>()) {
      return (data != null ? _i3.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.KayakException?>()) {
      return (data != null ? _i4.KayakException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ClothingType?>()) {
      return (data != null ? _i5.ClothingType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Gear?>()) {
      return (data != null ? _i6.Gear.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.GearDataBelt?>()) {
      return (data != null ? _i7.GearDataBelt.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.GearDataClothing?>()) {
      return (data != null ? _i8.GearDataClothing.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.GearDataHelmet?>()) {
      return (data != null ? _i9.GearDataHelmet.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.GearDataKayak?>()) {
      return (data != null ? _i10.GearDataKayak.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.GearDataPaddle?>()) {
      return (data != null ? _i11.GearDataPaddle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.GearDataPfd?>()) {
      return (data != null ? _i12.GearDataPfd.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.GearDataSpraydeck?>()) {
      return (data != null ? _i13.GearDataSpraydeck.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.GearDataThrowbag?>()) {
      return (data != null ? _i14.GearDataThrowbag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.GenericGearSize?>()) {
      return (data != null ? _i15.GenericGearSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.KayakType?>()) {
      return (data != null ? _i16.KayakType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.PaddleType?>()) {
      return (data != null ? _i17.PaddleType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.PfdType?>()) {
      return (data != null ? _i18.PfdType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.SpraydeckDeckSize?>()) {
      return (data != null ? _i19.SpraydeckDeckSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<Uri>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<Uri>(e)).toList()
          : null) as T;
    }
    if (t == List<_i20.Gear>) {
      return (data as List).map((e) => deserialize<_i20.Gear>(e)).toList() as T;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i3.Greeting) {
      return 'Greeting';
    }
    if (data is _i4.KayakException) {
      return 'KayakException';
    }
    if (data is _i5.ClothingType) {
      return 'ClothingType';
    }
    if (data is _i6.Gear) {
      return 'Gear';
    }
    if (data is _i7.GearDataBelt) {
      return 'GearDataBelt';
    }
    if (data is _i8.GearDataClothing) {
      return 'GearDataClothing';
    }
    if (data is _i9.GearDataHelmet) {
      return 'GearDataHelmet';
    }
    if (data is _i10.GearDataKayak) {
      return 'GearDataKayak';
    }
    if (data is _i11.GearDataPaddle) {
      return 'GearDataPaddle';
    }
    if (data is _i12.GearDataPfd) {
      return 'GearDataPfd';
    }
    if (data is _i13.GearDataSpraydeck) {
      return 'GearDataSpraydeck';
    }
    if (data is _i14.GearDataThrowbag) {
      return 'GearDataThrowbag';
    }
    if (data is _i15.GenericGearSize) {
      return 'GenericGearSize';
    }
    if (data is _i16.KayakType) {
      return 'KayakType';
    }
    if (data is _i17.PaddleType) {
      return 'PaddleType';
    }
    if (data is _i18.PfdType) {
      return 'PfdType';
    }
    if (data is _i19.SpraydeckDeckSize) {
      return 'SpraydeckDeckSize';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i3.Greeting>(data['data']);
    }
    if (dataClassName == 'KayakException') {
      return deserialize<_i4.KayakException>(data['data']);
    }
    if (dataClassName == 'ClothingType') {
      return deserialize<_i5.ClothingType>(data['data']);
    }
    if (dataClassName == 'Gear') {
      return deserialize<_i6.Gear>(data['data']);
    }
    if (dataClassName == 'GearDataBelt') {
      return deserialize<_i7.GearDataBelt>(data['data']);
    }
    if (dataClassName == 'GearDataClothing') {
      return deserialize<_i8.GearDataClothing>(data['data']);
    }
    if (dataClassName == 'GearDataHelmet') {
      return deserialize<_i9.GearDataHelmet>(data['data']);
    }
    if (dataClassName == 'GearDataKayak') {
      return deserialize<_i10.GearDataKayak>(data['data']);
    }
    if (dataClassName == 'GearDataPaddle') {
      return deserialize<_i11.GearDataPaddle>(data['data']);
    }
    if (dataClassName == 'GearDataPfd') {
      return deserialize<_i12.GearDataPfd>(data['data']);
    }
    if (dataClassName == 'GearDataSpraydeck') {
      return deserialize<_i13.GearDataSpraydeck>(data['data']);
    }
    if (dataClassName == 'GearDataThrowbag') {
      return deserialize<_i14.GearDataThrowbag>(data['data']);
    }
    if (dataClassName == 'GenericGearSize') {
      return deserialize<_i15.GenericGearSize>(data['data']);
    }
    if (dataClassName == 'KayakType') {
      return deserialize<_i16.KayakType>(data['data']);
    }
    if (dataClassName == 'PaddleType') {
      return deserialize<_i17.PaddleType>(data['data']);
    }
    if (dataClassName == 'PfdType') {
      return deserialize<_i18.PfdType>(data['data']);
    }
    if (dataClassName == 'SpraydeckDeckSize') {
      return deserialize<_i19.SpraydeckDeckSize>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i6.Gear:
        return _i6.Gear.t;
      case _i7.GearDataBelt:
        return _i7.GearDataBelt.t;
      case _i8.GearDataClothing:
        return _i8.GearDataClothing.t;
      case _i9.GearDataHelmet:
        return _i9.GearDataHelmet.t;
      case _i10.GearDataKayak:
        return _i10.GearDataKayak.t;
      case _i11.GearDataPaddle:
        return _i11.GearDataPaddle.t;
      case _i12.GearDataPfd:
        return _i12.GearDataPfd.t;
      case _i13.GearDataSpraydeck:
        return _i13.GearDataSpraydeck.t;
      case _i14.GearDataThrowbag:
        return _i14.GearDataThrowbag.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'przewrotkapp';
}
