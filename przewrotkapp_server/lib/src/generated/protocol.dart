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
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'exceptions/kayak_exception.dart' as _i4;
import 'gear/clothing_type.dart' as _i5;
import 'gear/gear.dart' as _i6;
import 'gear/gear_belt.dart' as _i7;
import 'gear/gear_clothing.dart' as _i8;
import 'gear/gear_floatbag.dart' as _i9;
import 'gear/gear_helmet.dart' as _i10;
import 'gear/gear_kayak.dart' as _i11;
import 'gear/gear_paddle.dart' as _i12;
import 'gear/gear_pfd.dart' as _i13;
import 'gear/gear_spraydeck.dart' as _i14;
import 'gear/gear_throwbag.dart' as _i15;
import 'gear/gear_type.dart' as _i16;
import 'gear/generic_gear_size.dart' as _i17;
import 'gear/kayak_type.dart' as _i18;
import 'gear/paddle_type.dart' as _i19;
import 'gear/pfd_type.dart' as _i20;
import 'gear/spraydeck_deck_size.dart' as _i21;
import 'rental/rental.dart' as _i22;
import 'rental/rental_junction.dart' as _i23;
import 'package:przewrotkapp_server/src/generated/gear/gear.dart' as _i24;
import 'package:przewrotkapp_server/src/generated/gear/gear_belt.dart' as _i25;
import 'package:przewrotkapp_server/src/generated/gear/gear_clothing.dart'
    as _i26;
import 'package:przewrotkapp_server/src/generated/gear/gear_floatbag.dart'
    as _i27;
import 'package:przewrotkapp_server/src/generated/gear/gear_helmet.dart'
    as _i28;
import 'package:przewrotkapp_server/src/generated/gear/gear_kayak.dart' as _i29;
import 'package:przewrotkapp_server/src/generated/gear/gear_paddle.dart'
    as _i30;
import 'package:przewrotkapp_server/src/generated/gear/gear_pfd.dart' as _i31;
import 'package:przewrotkapp_server/src/generated/gear/gear_spraydeck.dart'
    as _i32;
import 'package:przewrotkapp_server/src/generated/gear/gear_throwbag.dart'
    as _i33;
import 'package:przewrotkapp_server/src/generated/rental/rental.dart' as _i34;
export 'exceptions/kayak_exception.dart';
export 'gear/clothing_type.dart';
export 'gear/gear.dart';
export 'gear/gear_belt.dart';
export 'gear/gear_clothing.dart';
export 'gear/gear_floatbag.dart';
export 'gear/gear_helmet.dart';
export 'gear/gear_kayak.dart';
export 'gear/gear_paddle.dart';
export 'gear/gear_pfd.dart';
export 'gear/gear_spraydeck.dart';
export 'gear/gear_throwbag.dart';
export 'gear/gear_type.dart';
export 'gear/generic_gear_size.dart';
export 'gear/kayak_type.dart';
export 'gear/paddle_type.dart';
export 'gear/pfd_type.dart';
export 'gear/spraydeck_deck_size.dart';
export 'rental/rental.dart';
export 'rental/rental_junction.dart';

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
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:GearType',
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
        ),
        _i2.IndexDefinition(
          indexName: 'gear_club_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'clubId',
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
      name: 'gear_belts',
      dartName: 'GearBelt',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_belts_id_seq\'::regclass)',
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
          constraintName: 'gear_belts_fk_0',
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
          indexName: 'gear_belts_pkey',
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
      name: 'gear_clothes',
      dartName: 'GearClothing',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_clothes_id_seq\'::regclass)',
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
          constraintName: 'gear_clothes_fk_0',
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
          indexName: 'gear_clothes_pkey',
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
      name: 'gear_floatbags',
      dartName: 'GearFloatbag',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_floatbags_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'gearId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'volume',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'gear_floatbags_fk_0',
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
          indexName: 'gear_floatbags_pkey',
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
          indexName: 'floatbags_gear_unique_idx',
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
      name: 'gear_helmets',
      dartName: 'GearHelmet',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_helmets_id_seq\'::regclass)',
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
          constraintName: 'gear_helmets_fk_0',
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
          indexName: 'gear_helmets_pkey',
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
      name: 'gear_kayaks',
      dartName: 'GearKayak',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_kayaks_id_seq\'::regclass)',
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
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'maxWeight',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
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
          constraintName: 'gear_kayaks_fk_0',
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
          indexName: 'gear_kayaks_pkey',
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
      name: 'gear_paddles',
      dartName: 'GearPaddle',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_paddles_id_seq\'::regclass)',
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
          constraintName: 'gear_paddles_fk_0',
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
          indexName: 'gear_paddles_pkey',
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
      name: 'gear_pfds',
      dartName: 'GearPfd',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_pfds_id_seq\'::regclass)',
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
          constraintName: 'gear_pfds_fk_0',
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
          indexName: 'gear_pfds_pkey',
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
      name: 'gear_spraydecks',
      dartName: 'GearSpraydeck',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_spraydecks_id_seq\'::regclass)',
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
          constraintName: 'gear_spraydecks_fk_0',
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
          indexName: 'gear_spraydecks_pkey',
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
      name: 'gear_throwbags',
      dartName: 'GearThrowbag',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'gear_throwbags_id_seq\'::regclass)',
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
          constraintName: 'gear_throwbags_fk_0',
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
          indexName: 'gear_throwbags_pkey',
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
    _i2.TableDefinition(
      name: 'rental_junctions',
      dartName: 'RentalJunction',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'rental_junctions_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'gearId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'rentalId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'rental_junctions_fk_0',
          columns: ['gearId'],
          referenceTable: 'gear',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'rental_junctions_fk_1',
          columns: ['rentalId'],
          referenceTable: 'rentals',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'rental_junctions_pkey',
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
          indexName: 'rental_junctions_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'gearId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'rentalId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'rentals',
      dartName: 'Rental',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'rentals_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'lastModified',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'from',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'to',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'rentals_pkey',
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
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.KayakException) {
      return _i4.KayakException.fromJson(data) as T;
    }
    if (t == _i5.ClothingType) {
      return _i5.ClothingType.fromJson(data) as T;
    }
    if (t == _i6.Gear) {
      return _i6.Gear.fromJson(data) as T;
    }
    if (t == _i7.GearBelt) {
      return _i7.GearBelt.fromJson(data) as T;
    }
    if (t == _i8.GearClothing) {
      return _i8.GearClothing.fromJson(data) as T;
    }
    if (t == _i9.GearFloatbag) {
      return _i9.GearFloatbag.fromJson(data) as T;
    }
    if (t == _i10.GearHelmet) {
      return _i10.GearHelmet.fromJson(data) as T;
    }
    if (t == _i11.GearKayak) {
      return _i11.GearKayak.fromJson(data) as T;
    }
    if (t == _i12.GearPaddle) {
      return _i12.GearPaddle.fromJson(data) as T;
    }
    if (t == _i13.GearPfd) {
      return _i13.GearPfd.fromJson(data) as T;
    }
    if (t == _i14.GearSpraydeck) {
      return _i14.GearSpraydeck.fromJson(data) as T;
    }
    if (t == _i15.GearThrowbag) {
      return _i15.GearThrowbag.fromJson(data) as T;
    }
    if (t == _i16.GearType) {
      return _i16.GearType.fromJson(data) as T;
    }
    if (t == _i17.GenericGearSize) {
      return _i17.GenericGearSize.fromJson(data) as T;
    }
    if (t == _i18.KayakType) {
      return _i18.KayakType.fromJson(data) as T;
    }
    if (t == _i19.PaddleType) {
      return _i19.PaddleType.fromJson(data) as T;
    }
    if (t == _i20.PfdType) {
      return _i20.PfdType.fromJson(data) as T;
    }
    if (t == _i21.SpraydeckDeckSize) {
      return _i21.SpraydeckDeckSize.fromJson(data) as T;
    }
    if (t == _i22.Rental) {
      return _i22.Rental.fromJson(data) as T;
    }
    if (t == _i23.RentalJunction) {
      return _i23.RentalJunction.fromJson(data) as T;
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
    if (t == _i1.getType<_i7.GearBelt?>()) {
      return (data != null ? _i7.GearBelt.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.GearClothing?>()) {
      return (data != null ? _i8.GearClothing.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.GearFloatbag?>()) {
      return (data != null ? _i9.GearFloatbag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.GearHelmet?>()) {
      return (data != null ? _i10.GearHelmet.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.GearKayak?>()) {
      return (data != null ? _i11.GearKayak.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.GearPaddle?>()) {
      return (data != null ? _i12.GearPaddle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.GearPfd?>()) {
      return (data != null ? _i13.GearPfd.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.GearSpraydeck?>()) {
      return (data != null ? _i14.GearSpraydeck.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.GearThrowbag?>()) {
      return (data != null ? _i15.GearThrowbag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.GearType?>()) {
      return (data != null ? _i16.GearType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.GenericGearSize?>()) {
      return (data != null ? _i17.GenericGearSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.KayakType?>()) {
      return (data != null ? _i18.KayakType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.PaddleType?>()) {
      return (data != null ? _i19.PaddleType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.PfdType?>()) {
      return (data != null ? _i20.PfdType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.SpraydeckDeckSize?>()) {
      return (data != null ? _i21.SpraydeckDeckSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.Rental?>()) {
      return (data != null ? _i22.Rental.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.RentalJunction?>()) {
      return (data != null ? _i23.RentalJunction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<Uri>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<Uri>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i23.RentalJunction>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i23.RentalJunction>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i23.RentalJunction>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i23.RentalJunction>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i24.Gear>) {
      return (data as List).map((e) => deserialize<_i24.Gear>(e)).toList() as T;
    }
    if (t == List<_i25.GearBelt>) {
      return (data as List).map((e) => deserialize<_i25.GearBelt>(e)).toList()
          as T;
    }
    if (t == List<_i26.GearClothing>) {
      return (data as List)
          .map((e) => deserialize<_i26.GearClothing>(e))
          .toList() as T;
    }
    if (t == List<_i27.GearFloatbag>) {
      return (data as List)
          .map((e) => deserialize<_i27.GearFloatbag>(e))
          .toList() as T;
    }
    if (t == List<_i28.GearHelmet>) {
      return (data as List).map((e) => deserialize<_i28.GearHelmet>(e)).toList()
          as T;
    }
    if (t == List<_i29.GearKayak>) {
      return (data as List).map((e) => deserialize<_i29.GearKayak>(e)).toList()
          as T;
    }
    if (t == List<_i30.GearPaddle>) {
      return (data as List).map((e) => deserialize<_i30.GearPaddle>(e)).toList()
          as T;
    }
    if (t == List<_i31.GearPfd>) {
      return (data as List).map((e) => deserialize<_i31.GearPfd>(e)).toList()
          as T;
    }
    if (t == List<_i32.GearSpraydeck>) {
      return (data as List)
          .map((e) => deserialize<_i32.GearSpraydeck>(e))
          .toList() as T;
    }
    if (t == List<_i33.GearThrowbag>) {
      return (data as List)
          .map((e) => deserialize<_i33.GearThrowbag>(e))
          .toList() as T;
    }
    if (t == List<_i34.Rental>) {
      return (data as List).map((e) => deserialize<_i34.Rental>(e)).toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.KayakException) {
      return 'KayakException';
    }
    if (data is _i5.ClothingType) {
      return 'ClothingType';
    }
    if (data is _i6.Gear) {
      return 'Gear';
    }
    if (data is _i7.GearBelt) {
      return 'GearBelt';
    }
    if (data is _i8.GearClothing) {
      return 'GearClothing';
    }
    if (data is _i9.GearFloatbag) {
      return 'GearFloatbag';
    }
    if (data is _i10.GearHelmet) {
      return 'GearHelmet';
    }
    if (data is _i11.GearKayak) {
      return 'GearKayak';
    }
    if (data is _i12.GearPaddle) {
      return 'GearPaddle';
    }
    if (data is _i13.GearPfd) {
      return 'GearPfd';
    }
    if (data is _i14.GearSpraydeck) {
      return 'GearSpraydeck';
    }
    if (data is _i15.GearThrowbag) {
      return 'GearThrowbag';
    }
    if (data is _i16.GearType) {
      return 'GearType';
    }
    if (data is _i17.GenericGearSize) {
      return 'GenericGearSize';
    }
    if (data is _i18.KayakType) {
      return 'KayakType';
    }
    if (data is _i19.PaddleType) {
      return 'PaddleType';
    }
    if (data is _i20.PfdType) {
      return 'PfdType';
    }
    if (data is _i21.SpraydeckDeckSize) {
      return 'SpraydeckDeckSize';
    }
    if (data is _i22.Rental) {
      return 'Rental';
    }
    if (data is _i23.RentalJunction) {
      return 'RentalJunction';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
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
    if (dataClassName == 'GearBelt') {
      return deserialize<_i7.GearBelt>(data['data']);
    }
    if (dataClassName == 'GearClothing') {
      return deserialize<_i8.GearClothing>(data['data']);
    }
    if (dataClassName == 'GearFloatbag') {
      return deserialize<_i9.GearFloatbag>(data['data']);
    }
    if (dataClassName == 'GearHelmet') {
      return deserialize<_i10.GearHelmet>(data['data']);
    }
    if (dataClassName == 'GearKayak') {
      return deserialize<_i11.GearKayak>(data['data']);
    }
    if (dataClassName == 'GearPaddle') {
      return deserialize<_i12.GearPaddle>(data['data']);
    }
    if (dataClassName == 'GearPfd') {
      return deserialize<_i13.GearPfd>(data['data']);
    }
    if (dataClassName == 'GearSpraydeck') {
      return deserialize<_i14.GearSpraydeck>(data['data']);
    }
    if (dataClassName == 'GearThrowbag') {
      return deserialize<_i15.GearThrowbag>(data['data']);
    }
    if (dataClassName == 'GearType') {
      return deserialize<_i16.GearType>(data['data']);
    }
    if (dataClassName == 'GenericGearSize') {
      return deserialize<_i17.GenericGearSize>(data['data']);
    }
    if (dataClassName == 'KayakType') {
      return deserialize<_i18.KayakType>(data['data']);
    }
    if (dataClassName == 'PaddleType') {
      return deserialize<_i19.PaddleType>(data['data']);
    }
    if (dataClassName == 'PfdType') {
      return deserialize<_i20.PfdType>(data['data']);
    }
    if (dataClassName == 'SpraydeckDeckSize') {
      return deserialize<_i21.SpraydeckDeckSize>(data['data']);
    }
    if (dataClassName == 'Rental') {
      return deserialize<_i22.Rental>(data['data']);
    }
    if (dataClassName == 'RentalJunction') {
      return deserialize<_i23.RentalJunction>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i6.Gear:
        return _i6.Gear.t;
      case _i7.GearBelt:
        return _i7.GearBelt.t;
      case _i8.GearClothing:
        return _i8.GearClothing.t;
      case _i9.GearFloatbag:
        return _i9.GearFloatbag.t;
      case _i10.GearHelmet:
        return _i10.GearHelmet.t;
      case _i11.GearKayak:
        return _i11.GearKayak.t;
      case _i12.GearPaddle:
        return _i12.GearPaddle.t;
      case _i13.GearPfd:
        return _i13.GearPfd.t;
      case _i14.GearSpraydeck:
        return _i14.GearSpraydeck.t;
      case _i15.GearThrowbag:
        return _i15.GearThrowbag.t;
      case _i22.Rental:
        return _i22.Rental.t;
      case _i23.RentalJunction:
        return _i23.RentalJunction.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'przewrotkapp';
}
