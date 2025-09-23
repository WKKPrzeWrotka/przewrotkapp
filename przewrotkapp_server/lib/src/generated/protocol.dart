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
import 'gear/comment.dart' as _i6;
import 'gear/comment_type.dart' as _i7;
import 'gear/gear_belt.dart' as _i8;
import 'gear/gear_clothing.dart' as _i9;
import 'gear/gear_floatbag.dart' as _i10;
import 'gear/gear_helmet.dart' as _i11;
import 'gear/gear_kayak.dart' as _i12;
import 'gear/gear_paddle.dart' as _i13;
import 'gear/gear_pfd.dart' as _i14;
import 'gear/gear_spraydeck.dart' as _i15;
import 'gear/gear_throwbag.dart' as _i16;
import 'gear/gear.dart' as _i17;
import 'gear/gear_extra.dart' as _i18;
import 'gear/gear_pair.dart' as _i19;
import 'gear/gear_type.dart' as _i20;
import 'gear/generic_gear_size.dart' as _i21;
import 'gear/kayak_type.dart' as _i22;
import 'gear/paddle_type.dart' as _i23;
import 'gear/pfd_type.dart' as _i24;
import 'gear/spraydeck_deck_size.dart' as _i25;
import 'rental/rental.dart' as _i26;
import 'rental/rental_junction.dart' as _i27;
import 'user/extra_user_info.dart' as _i28;
import 'user/favourites.dart' as _i29;
import 'package:przewrotkapp_server/src/generated/gear/gear.dart' as _i30;
import 'package:przewrotkapp_server/src/generated/gear/gear_belt.dart' as _i31;
import 'package:przewrotkapp_server/src/generated/gear/gear_clothing.dart'
    as _i32;
import 'package:przewrotkapp_server/src/generated/gear/gear_floatbag.dart'
    as _i33;
import 'package:przewrotkapp_server/src/generated/gear/gear_helmet.dart'
    as _i34;
import 'package:przewrotkapp_server/src/generated/gear/gear_kayak.dart' as _i35;
import 'package:przewrotkapp_server/src/generated/gear/gear_paddle.dart'
    as _i36;
import 'package:przewrotkapp_server/src/generated/gear/gear_pfd.dart' as _i37;
import 'package:przewrotkapp_server/src/generated/gear/gear_spraydeck.dart'
    as _i38;
import 'package:przewrotkapp_server/src/generated/gear/gear_throwbag.dart'
    as _i39;
import 'package:przewrotkapp_server/src/generated/rental/rental.dart' as _i40;
export 'exceptions/kayak_exception.dart';
export 'gear/clothing_type.dart';
export 'gear/comment.dart';
export 'gear/comment_type.dart';
export 'gear/gear.dart';
export 'gear/gear_belt.dart';
export 'gear/gear_clothing.dart';
export 'gear/gear_extra.dart';
export 'gear/gear_floatbag.dart';
export 'gear/gear_helmet.dart';
export 'gear/gear_kayak.dart';
export 'gear/gear_paddle.dart';
export 'gear/gear_pair.dart';
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
export 'user/extra_user_info.dart';
export 'user/favourites.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'comments',
      dartName: 'Comment',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'comments_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'byId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'gearId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:CommentType',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'hoursForResolving',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'resolved',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'resolvedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'comments_fk_0',
          columns: ['byId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'comments_fk_1',
          columns: ['gearId'],
          referenceTable: 'gear',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'comments_fk_2',
          columns: ['resolvedById'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'comments_pkey',
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
          indexName: 'comment_by_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'byId',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'comment_gear_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'gearId',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'comment_resolved_by_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'resolvedById',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'extra_user_infos',
      dartName: 'ExtraUserInfo',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'extra_user_infos_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'phoneNumber',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'discordUsername',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'socialLinks',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'Map<String,Uri>',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'extra_user_infos_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'extra_user_infos_pkey',
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
          indexName: 'extra_user_info_user_info_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userInfoId',
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
      name: 'favourites_junctions',
      dartName: 'FavouritesJunction',
      schema: 'public',
      module: 'przewrotkapp',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'favourites_junctions_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'gearId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'extraUserInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'favourites_junctions_fk_0',
          columns: ['gearId'],
          referenceTable: 'gear',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'favourites_junctions_fk_1',
          columns: ['extraUserInfoId'],
          referenceTable: 'extra_user_infos',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'favourites_junctions_pkey',
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
          indexName: 'favourites_junctions_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'gearId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'extraUserInfoId',
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
          onDelete: _i2.ForeignKeyAction.cascade,
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
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
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
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'rentals_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
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
        ),
        _i2.IndexDefinition(
          indexName: 'rentals_users_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userInfoId',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
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
    if (t == _i6.Comment) {
      return _i6.Comment.fromJson(data) as T;
    }
    if (t == _i7.CommentType) {
      return _i7.CommentType.fromJson(data) as T;
    }
    if (t == _i8.GearBelt) {
      return _i8.GearBelt.fromJson(data) as T;
    }
    if (t == _i9.GearClothing) {
      return _i9.GearClothing.fromJson(data) as T;
    }
    if (t == _i10.GearFloatbag) {
      return _i10.GearFloatbag.fromJson(data) as T;
    }
    if (t == _i11.GearHelmet) {
      return _i11.GearHelmet.fromJson(data) as T;
    }
    if (t == _i12.GearKayak) {
      return _i12.GearKayak.fromJson(data) as T;
    }
    if (t == _i13.GearPaddle) {
      return _i13.GearPaddle.fromJson(data) as T;
    }
    if (t == _i14.GearPfd) {
      return _i14.GearPfd.fromJson(data) as T;
    }
    if (t == _i15.GearSpraydeck) {
      return _i15.GearSpraydeck.fromJson(data) as T;
    }
    if (t == _i16.GearThrowbag) {
      return _i16.GearThrowbag.fromJson(data) as T;
    }
    if (t == _i17.Gear) {
      return _i17.Gear.fromJson(data) as T;
    }
    if (t == _i18.GearExtra) {
      return _i18.GearExtra.fromJson(data) as T;
    }
    if (t == _i19.GearPair) {
      return _i19.GearPair.fromJson(data) as T;
    }
    if (t == _i20.GearType) {
      return _i20.GearType.fromJson(data) as T;
    }
    if (t == _i21.GenericGearSize) {
      return _i21.GenericGearSize.fromJson(data) as T;
    }
    if (t == _i22.KayakType) {
      return _i22.KayakType.fromJson(data) as T;
    }
    if (t == _i23.PaddleType) {
      return _i23.PaddleType.fromJson(data) as T;
    }
    if (t == _i24.PfdType) {
      return _i24.PfdType.fromJson(data) as T;
    }
    if (t == _i25.SpraydeckDeckSize) {
      return _i25.SpraydeckDeckSize.fromJson(data) as T;
    }
    if (t == _i26.Rental) {
      return _i26.Rental.fromJson(data) as T;
    }
    if (t == _i27.RentalJunction) {
      return _i27.RentalJunction.fromJson(data) as T;
    }
    if (t == _i28.ExtraUserInfo) {
      return _i28.ExtraUserInfo.fromJson(data) as T;
    }
    if (t == _i29.FavouritesJunction) {
      return _i29.FavouritesJunction.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.KayakException?>()) {
      return (data != null ? _i4.KayakException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ClothingType?>()) {
      return (data != null ? _i5.ClothingType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Comment?>()) {
      return (data != null ? _i6.Comment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.CommentType?>()) {
      return (data != null ? _i7.CommentType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.GearBelt?>()) {
      return (data != null ? _i8.GearBelt.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.GearClothing?>()) {
      return (data != null ? _i9.GearClothing.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.GearFloatbag?>()) {
      return (data != null ? _i10.GearFloatbag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.GearHelmet?>()) {
      return (data != null ? _i11.GearHelmet.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.GearKayak?>()) {
      return (data != null ? _i12.GearKayak.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.GearPaddle?>()) {
      return (data != null ? _i13.GearPaddle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.GearPfd?>()) {
      return (data != null ? _i14.GearPfd.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.GearSpraydeck?>()) {
      return (data != null ? _i15.GearSpraydeck.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.GearThrowbag?>()) {
      return (data != null ? _i16.GearThrowbag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Gear?>()) {
      return (data != null ? _i17.Gear.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.GearExtra?>()) {
      return (data != null ? _i18.GearExtra.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.GearPair?>()) {
      return (data != null ? _i19.GearPair.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.GearType?>()) {
      return (data != null ? _i20.GearType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.GenericGearSize?>()) {
      return (data != null ? _i21.GenericGearSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.KayakType?>()) {
      return (data != null ? _i22.KayakType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.PaddleType?>()) {
      return (data != null ? _i23.PaddleType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.PfdType?>()) {
      return (data != null ? _i24.PfdType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.SpraydeckDeckSize?>()) {
      return (data != null ? _i25.SpraydeckDeckSize.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.Rental?>()) {
      return (data != null ? _i26.Rental.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.RentalJunction?>()) {
      return (data != null ? _i27.RentalJunction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.ExtraUserInfo?>()) {
      return (data != null ? _i28.ExtraUserInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.FavouritesJunction?>()) {
      return (data != null ? _i29.FavouritesJunction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<List<Uri>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<Uri>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i27.RentalJunction>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i27.RentalJunction>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i29.FavouritesJunction>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i29.FavouritesJunction>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i27.RentalJunction>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i27.RentalJunction>(e))
              .toList()
          : null) as T;
    }
    if (t == Map<String, Uri>) {
      return (data as Map).map(
          (k, v) => MapEntry(deserialize<String>(k), deserialize<Uri>(v))) as T;
    }
    if (t == _i1.getType<List<_i29.FavouritesJunction>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i29.FavouritesJunction>(e))
              .toList()
          : null) as T;
    }
    if (t == List<({DateTime from, String name, DateTime to})>) {
      return (data as List)
          .map((e) =>
              deserialize<({DateTime from, String name, DateTime to})>(e))
          .toList() as T;
    }
    if (t == _i1.getType<({DateTime from, String name, DateTime to})>()) {
      return (
        from: deserialize<DateTime>(((data as Map)['n'] as Map)['from']),
        name: deserialize<String>(data['n']['name']),
        to: deserialize<DateTime>(data['n']['to']),
      ) as T;
    }
    if (t == _i1.getType<({DateTime from, String name, DateTime to})>()) {
      return (
        from: deserialize<DateTime>(((data as Map)['n'] as Map)['from']),
        name: deserialize<String>(data['n']['name']),
        to: deserialize<DateTime>(data['n']['to']),
      ) as T;
    }
    if (t == List<(_i30.Gear, _i31.GearBelt)>) {
      return (data as List)
          .map((e) => deserialize<(_i30.Gear, _i31.GearBelt)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i31.GearBelt)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i31.GearBelt>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i31.GearBelt)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i31.GearBelt>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i30.Gear, _i32.GearClothing)>) {
      return (data as List)
          .map((e) => deserialize<(_i30.Gear, _i32.GearClothing)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i32.GearClothing)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i32.GearClothing>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i32.GearClothing)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i32.GearClothing>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i30.Gear, _i33.GearFloatbag)>) {
      return (data as List)
          .map((e) => deserialize<(_i30.Gear, _i33.GearFloatbag)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i33.GearFloatbag)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i33.GearFloatbag>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i33.GearFloatbag)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i33.GearFloatbag>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i30.Gear, _i34.GearHelmet)>) {
      return (data as List)
          .map((e) => deserialize<(_i30.Gear, _i34.GearHelmet)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i34.GearHelmet)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i34.GearHelmet>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i34.GearHelmet)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i34.GearHelmet>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i30.Gear, _i35.GearKayak)>) {
      return (data as List)
          .map((e) => deserialize<(_i30.Gear, _i35.GearKayak)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i35.GearKayak)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i35.GearKayak>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i35.GearKayak)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i35.GearKayak>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i30.Gear, _i36.GearPaddle)>) {
      return (data as List)
          .map((e) => deserialize<(_i30.Gear, _i36.GearPaddle)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i36.GearPaddle)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i36.GearPaddle>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i36.GearPaddle)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i36.GearPaddle>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i30.Gear, _i37.GearPfd)>) {
      return (data as List)
          .map((e) => deserialize<(_i30.Gear, _i37.GearPfd)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i37.GearPfd)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i37.GearPfd>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i37.GearPfd)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i37.GearPfd>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i30.Gear, _i38.GearSpraydeck)>) {
      return (data as List)
          .map((e) => deserialize<(_i30.Gear, _i38.GearSpraydeck)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i38.GearSpraydeck)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i38.GearSpraydeck>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i38.GearSpraydeck)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i38.GearSpraydeck>(data['p'][1]),
      ) as T;
    }
    if (t == List<(_i30.Gear, _i39.GearThrowbag)>) {
      return (data as List)
          .map((e) => deserialize<(_i30.Gear, _i39.GearThrowbag)>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i39.GearThrowbag)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i39.GearThrowbag>(data['p'][1]),
      ) as T;
    }
    if (t == _i1.getType<(_i30.Gear, _i39.GearThrowbag)>()) {
      return (
        deserialize<_i30.Gear>(((data as Map)['p'] as List)[0]),
        deserialize<_i39.GearThrowbag>(data['p'][1]),
      ) as T;
    }
    if (t == List<_i40.Rental>) {
      return (data as List).map((e) => deserialize<_i40.Rental>(e)).toList()
          as T;
    }
    if (t == List<_i30.Gear>) {
      return (data as List).map((e) => deserialize<_i30.Gear>(e)).toList() as T;
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
    if (data is _i6.Comment) {
      return 'Comment';
    }
    if (data is _i7.CommentType) {
      return 'CommentType';
    }
    if (data is _i8.GearBelt) {
      return 'GearBelt';
    }
    if (data is _i9.GearClothing) {
      return 'GearClothing';
    }
    if (data is _i10.GearFloatbag) {
      return 'GearFloatbag';
    }
    if (data is _i11.GearHelmet) {
      return 'GearHelmet';
    }
    if (data is _i12.GearKayak) {
      return 'GearKayak';
    }
    if (data is _i13.GearPaddle) {
      return 'GearPaddle';
    }
    if (data is _i14.GearPfd) {
      return 'GearPfd';
    }
    if (data is _i15.GearSpraydeck) {
      return 'GearSpraydeck';
    }
    if (data is _i16.GearThrowbag) {
      return 'GearThrowbag';
    }
    if (data is _i17.Gear) {
      return 'Gear';
    }
    if (data is _i18.GearExtra) {
      return 'GearExtra';
    }
    if (data is _i19.GearPair) {
      return 'GearPair';
    }
    if (data is _i20.GearType) {
      return 'GearType';
    }
    if (data is _i21.GenericGearSize) {
      return 'GenericGearSize';
    }
    if (data is _i22.KayakType) {
      return 'KayakType';
    }
    if (data is _i23.PaddleType) {
      return 'PaddleType';
    }
    if (data is _i24.PfdType) {
      return 'PfdType';
    }
    if (data is _i25.SpraydeckDeckSize) {
      return 'SpraydeckDeckSize';
    }
    if (data is _i26.Rental) {
      return 'Rental';
    }
    if (data is _i27.RentalJunction) {
      return 'RentalJunction';
    }
    if (data is _i28.ExtraUserInfo) {
      return 'ExtraUserInfo';
    }
    if (data is _i29.FavouritesJunction) {
      return 'FavouritesJunction';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is List<_i40.Rental>) {
      return 'List<Rental>';
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
    if (dataClassName == 'Comment') {
      return deserialize<_i6.Comment>(data['data']);
    }
    if (dataClassName == 'CommentType') {
      return deserialize<_i7.CommentType>(data['data']);
    }
    if (dataClassName == 'GearBelt') {
      return deserialize<_i8.GearBelt>(data['data']);
    }
    if (dataClassName == 'GearClothing') {
      return deserialize<_i9.GearClothing>(data['data']);
    }
    if (dataClassName == 'GearFloatbag') {
      return deserialize<_i10.GearFloatbag>(data['data']);
    }
    if (dataClassName == 'GearHelmet') {
      return deserialize<_i11.GearHelmet>(data['data']);
    }
    if (dataClassName == 'GearKayak') {
      return deserialize<_i12.GearKayak>(data['data']);
    }
    if (dataClassName == 'GearPaddle') {
      return deserialize<_i13.GearPaddle>(data['data']);
    }
    if (dataClassName == 'GearPfd') {
      return deserialize<_i14.GearPfd>(data['data']);
    }
    if (dataClassName == 'GearSpraydeck') {
      return deserialize<_i15.GearSpraydeck>(data['data']);
    }
    if (dataClassName == 'GearThrowbag') {
      return deserialize<_i16.GearThrowbag>(data['data']);
    }
    if (dataClassName == 'Gear') {
      return deserialize<_i17.Gear>(data['data']);
    }
    if (dataClassName == 'GearExtra') {
      return deserialize<_i18.GearExtra>(data['data']);
    }
    if (dataClassName == 'GearPair') {
      return deserialize<_i19.GearPair>(data['data']);
    }
    if (dataClassName == 'GearType') {
      return deserialize<_i20.GearType>(data['data']);
    }
    if (dataClassName == 'GenericGearSize') {
      return deserialize<_i21.GenericGearSize>(data['data']);
    }
    if (dataClassName == 'KayakType') {
      return deserialize<_i22.KayakType>(data['data']);
    }
    if (dataClassName == 'PaddleType') {
      return deserialize<_i23.PaddleType>(data['data']);
    }
    if (dataClassName == 'PfdType') {
      return deserialize<_i24.PfdType>(data['data']);
    }
    if (dataClassName == 'SpraydeckDeckSize') {
      return deserialize<_i25.SpraydeckDeckSize>(data['data']);
    }
    if (dataClassName == 'Rental') {
      return deserialize<_i26.Rental>(data['data']);
    }
    if (dataClassName == 'RentalJunction') {
      return deserialize<_i27.RentalJunction>(data['data']);
    }
    if (dataClassName == 'ExtraUserInfo') {
      return deserialize<_i28.ExtraUserInfo>(data['data']);
    }
    if (dataClassName == 'FavouritesJunction') {
      return deserialize<_i29.FavouritesJunction>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName == 'List<Rental>') {
      return deserialize<List<_i40.Rental>>(data['data']);
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
      case _i6.Comment:
        return _i6.Comment.t;
      case _i17.Gear:
        return _i17.Gear.t;
      case _i8.GearBelt:
        return _i8.GearBelt.t;
      case _i9.GearClothing:
        return _i9.GearClothing.t;
      case _i10.GearFloatbag:
        return _i10.GearFloatbag.t;
      case _i11.GearHelmet:
        return _i11.GearHelmet.t;
      case _i12.GearKayak:
        return _i12.GearKayak.t;
      case _i13.GearPaddle:
        return _i13.GearPaddle.t;
      case _i14.GearPfd:
        return _i14.GearPfd.t;
      case _i15.GearSpraydeck:
        return _i15.GearSpraydeck.t;
      case _i16.GearThrowbag:
        return _i16.GearThrowbag.t;
      case _i26.Rental:
        return _i26.Rental.t;
      case _i27.RentalJunction:
        return _i27.RentalJunction.t;
      case _i28.ExtraUserInfo:
        return _i28.ExtraUserInfo.t;
      case _i29.FavouritesJunction:
        return _i29.FavouritesJunction.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'przewrotkapp';
}

/// Maps any `Record`s known to this [Protocol] to their JSON representation
///
/// Throws in case the record type is not known.
///
/// This method will return `null` (only) for `null` inputs.
Map<String, dynamic>? mapRecordToJson(Record? record) {
  if (record == null) {
    return null;
  }
  if (record is ({DateTime from, String name, DateTime to})) {
    return {
      "n": {
        "from": record.from,
        "name": record.name,
        "to": record.to,
      },
    };
  }
  if (record is (_i30.Gear, _i31.GearBelt)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i30.Gear, _i32.GearClothing)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i30.Gear, _i33.GearFloatbag)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i30.Gear, _i34.GearHelmet)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i30.Gear, _i35.GearKayak)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i30.Gear, _i36.GearPaddle)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i30.Gear, _i37.GearPfd)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i30.Gear, _i38.GearSpraydeck)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (_i30.Gear, _i39.GearThrowbag)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  throw Exception('Unsupported record type ${record.runtimeType}');
}

/// Maps container types (like [List], [Map], [Set]) containing [Record]s to their JSON representation.
///
/// It should not be called for [SerializableModel] types. These handle the "[Record] in container" mapping internally already.
///
/// It is only supposed to be called from generated protocol code.
///
/// Returns either a `List<dynamic>` (for List, Sets, and Maps with non-String keys) or a `Map<String, dynamic>` in case the input was a `Map<String, …>`.
Object? mapRecordContainingContainerToJson(Object obj) {
  if (obj is! Iterable && obj is! Map) {
    throw ArgumentError.value(
      obj,
      'obj',
      'The object to serialize should be of type List, Map, or Set',
    );
  }

  dynamic mapIfNeeded(Object? obj) {
    return switch (obj) {
      Record record => mapRecordToJson(record),
      Iterable iterable => mapRecordContainingContainerToJson(iterable),
      Map map => mapRecordContainingContainerToJson(map),
      Object? value => value,
    };
  }

  switch (obj) {
    case Map<String, dynamic>():
      return {
        for (var entry in obj.entries) entry.key: mapIfNeeded(entry.value),
      };
    case Map():
      return [
        for (var entry in obj.entries)
          {
            'k': mapIfNeeded(entry.key),
            'v': mapIfNeeded(entry.value),
          }
      ];

    case Iterable():
      return [
        for (var e in obj) mapIfNeeded(e),
      ];
  }

  return obj;
}
