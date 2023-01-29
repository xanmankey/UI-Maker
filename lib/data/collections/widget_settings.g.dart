// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetWidgetSettingsCollection on Isar {
  IsarCollection<WidgetSettings> get widgetSettings => this.collection();
}

const WidgetSettingsSchema = CollectionSchema(
  name: r'WidgetSettings',
  id: 4820156579752087572,
  properties: {
    r'color': PropertySchema(
      id: 0,
      name: r'color',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'enabled': PropertySchema(
      id: 2,
      name: r'enabled',
      type: IsarType.bool,
    ),
    r'offsetX': PropertySchema(
      id: 3,
      name: r'offsetX',
      type: IsarType.double,
    ),
    r'offsetY': PropertySchema(
      id: 4,
      name: r'offsetY',
      type: IsarType.double,
    ),
    r'title': PropertySchema(
      id: 5,
      name: r'title',
      type: IsarType.string,
    ),
    r'values': PropertySchema(
      id: 6,
      name: r'values',
      type: IsarType.string,
    ),
    r'widgetType': PropertySchema(
      id: 7,
      name: r'widgetType',
      type: IsarType.byte,
      enumMap: _WidgetSettingswidgetTypeEnumValueMap,
    )
  },
  estimateSize: _widgetSettingsEstimateSize,
  serialize: _widgetSettingsSerialize,
  deserialize: _widgetSettingsDeserialize,
  deserializeProp: _widgetSettingsDeserializeProp,
  idName: r'id',
  indexes: {
    r'title': IndexSchema(
      id: -7636685945352118059,
      name: r'title',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'title',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'color': IndexSchema(
      id: 880366885425937065,
      name: r'color',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'color',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'widgetType': IndexSchema(
      id: -40241655692754270,
      name: r'widgetType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'widgetType',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'widgets': LinkSchema(
      id: 1560134347547876117,
      name: r'widgets',
      target: r'WidgetSettings',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _widgetSettingsGetId,
  getLinks: _widgetSettingsGetLinks,
  attach: _widgetSettingsAttach,
  version: '3.0.5',
);

int _widgetSettingsEstimateSize(
  WidgetSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.values.length * 3;
  return bytesCount;
}

void _widgetSettingsSerialize(
  WidgetSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.color);
  writer.writeString(offsets[1], object.description);
  writer.writeBool(offsets[2], object.enabled);
  writer.writeDouble(offsets[3], object.offsetX);
  writer.writeDouble(offsets[4], object.offsetY);
  writer.writeString(offsets[5], object.title);
  writer.writeString(offsets[6], object.values);
  writer.writeByte(offsets[7], object.widgetType.index);
}

WidgetSettings _widgetSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WidgetSettings();
  object.color = reader.readLong(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.enabled = reader.readBool(offsets[2]);
  object.id = id;
  object.offsetX = reader.readDouble(offsets[3]);
  object.offsetY = reader.readDouble(offsets[4]);
  object.title = reader.readString(offsets[5]);
  object.values = reader.readString(offsets[6]);
  object.widgetType = _WidgetSettingswidgetTypeValueEnumMap[
          reader.readByteOrNull(offsets[7])] ??
      WidgetType.card;
  return object;
}

P _widgetSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (_WidgetSettingswidgetTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          WidgetType.card) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _WidgetSettingswidgetTypeEnumValueMap = {
  'card': 0,
  'dropdown': 1,
  'checkbox': 2,
  'numField': 3,
  'textField': 4,
  'imageSelector': 5,
};
const _WidgetSettingswidgetTypeValueEnumMap = {
  0: WidgetType.card,
  1: WidgetType.dropdown,
  2: WidgetType.checkbox,
  3: WidgetType.numField,
  4: WidgetType.textField,
  5: WidgetType.imageSelector,
};

Id _widgetSettingsGetId(WidgetSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _widgetSettingsGetLinks(WidgetSettings object) {
  return [object.widgets];
}

void _widgetSettingsAttach(
    IsarCollection<dynamic> col, Id id, WidgetSettings object) {
  object.id = id;
  object.widgets
      .attach(col, col.isar.collection<WidgetSettings>(), r'widgets', id);
}

extension WidgetSettingsQueryWhereSort
    on QueryBuilder<WidgetSettings, WidgetSettings, QWhere> {
  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhere> anyColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'color'),
      );
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhere> anyWidgetType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'widgetType'),
      );
    });
  }
}

extension WidgetSettingsQueryWhere
    on QueryBuilder<WidgetSettings, WidgetSettings, QWhereClause> {
  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause> titleEqualTo(
      String title) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'title',
        value: [title],
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause>
      titleNotEqualTo(String title) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'title',
              lower: [],
              upper: [title],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'title',
              lower: [title],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'title',
              lower: [title],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'title',
              lower: [],
              upper: [title],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause> colorEqualTo(
      int color) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'color',
        value: [color],
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause>
      colorNotEqualTo(int color) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'color',
              lower: [],
              upper: [color],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'color',
              lower: [color],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'color',
              lower: [color],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'color',
              lower: [],
              upper: [color],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause>
      colorGreaterThan(
    int color, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'color',
        lower: [color],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause> colorLessThan(
    int color, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'color',
        lower: [],
        upper: [color],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause> colorBetween(
    int lowerColor,
    int upperColor, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'color',
        lower: [lowerColor],
        includeLower: includeLower,
        upper: [upperColor],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause>
      widgetTypeEqualTo(WidgetType widgetType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'widgetType',
        value: [widgetType],
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause>
      widgetTypeNotEqualTo(WidgetType widgetType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'widgetType',
              lower: [],
              upper: [widgetType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'widgetType',
              lower: [widgetType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'widgetType',
              lower: [widgetType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'widgetType',
              lower: [],
              upper: [widgetType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause>
      widgetTypeGreaterThan(
    WidgetType widgetType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'widgetType',
        lower: [widgetType],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause>
      widgetTypeLessThan(
    WidgetType widgetType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'widgetType',
        lower: [],
        upper: [widgetType],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterWhereClause>
      widgetTypeBetween(
    WidgetType lowerWidgetType,
    WidgetType upperWidgetType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'widgetType',
        lower: [lowerWidgetType],
        includeLower: includeLower,
        upper: [upperWidgetType],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WidgetSettingsQueryFilter
    on QueryBuilder<WidgetSettings, WidgetSettings, QFilterCondition> {
  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      colorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      colorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      colorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      colorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'color',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      enabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enabled',
        value: value,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      offsetXEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'offsetX',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      offsetXGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'offsetX',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      offsetXLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'offsetX',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      offsetXBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'offsetX',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      offsetYEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'offsetY',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      offsetYGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'offsetY',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      offsetYLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'offsetY',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      offsetYBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'offsetY',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      valuesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'values',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      valuesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'values',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      valuesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'values',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      valuesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'values',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      valuesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'values',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      valuesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'values',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      valuesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'values',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      valuesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'values',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      valuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'values',
        value: '',
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      valuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'values',
        value: '',
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      widgetTypeEqualTo(WidgetType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'widgetType',
        value: value,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      widgetTypeGreaterThan(
    WidgetType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'widgetType',
        value: value,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      widgetTypeLessThan(
    WidgetType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'widgetType',
        value: value,
      ));
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      widgetTypeBetween(
    WidgetType lower,
    WidgetType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'widgetType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WidgetSettingsQueryObject
    on QueryBuilder<WidgetSettings, WidgetSettings, QFilterCondition> {}

extension WidgetSettingsQueryLinks
    on QueryBuilder<WidgetSettings, WidgetSettings, QFilterCondition> {
  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition> widgets(
      FilterQuery<WidgetSettings> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'widgets');
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterFilterCondition>
      widgetsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'widgets', 0, true, 0, true);
    });
  }
}

extension WidgetSettingsQuerySortBy
    on QueryBuilder<WidgetSettings, WidgetSettings, QSortBy> {
  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> sortByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy>
      sortByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> sortByOffsetX() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetX', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy>
      sortByOffsetXDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetX', Sort.desc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> sortByOffsetY() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetY', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy>
      sortByOffsetYDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetY', Sort.desc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> sortByValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'values', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy>
      sortByValuesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'values', Sort.desc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy>
      sortByWidgetType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetType', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy>
      sortByWidgetTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetType', Sort.desc);
    });
  }
}

extension WidgetSettingsQuerySortThenBy
    on QueryBuilder<WidgetSettings, WidgetSettings, QSortThenBy> {
  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> thenByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy>
      thenByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> thenByOffsetX() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetX', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy>
      thenByOffsetXDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetX', Sort.desc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> thenByOffsetY() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetY', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy>
      thenByOffsetYDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetY', Sort.desc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy> thenByValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'values', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy>
      thenByValuesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'values', Sort.desc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy>
      thenByWidgetType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetType', Sort.asc);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QAfterSortBy>
      thenByWidgetTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetType', Sort.desc);
    });
  }
}

extension WidgetSettingsQueryWhereDistinct
    on QueryBuilder<WidgetSettings, WidgetSettings, QDistinct> {
  QueryBuilder<WidgetSettings, WidgetSettings, QDistinct> distinctByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'color');
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QDistinct> distinctByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enabled');
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QDistinct> distinctByOffsetX() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'offsetX');
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QDistinct> distinctByOffsetY() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'offsetY');
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QDistinct> distinctByValues(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'values', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WidgetSettings, WidgetSettings, QDistinct>
      distinctByWidgetType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'widgetType');
    });
  }
}

extension WidgetSettingsQueryProperty
    on QueryBuilder<WidgetSettings, WidgetSettings, QQueryProperty> {
  QueryBuilder<WidgetSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WidgetSettings, int, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<WidgetSettings, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<WidgetSettings, bool, QQueryOperations> enabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enabled');
    });
  }

  QueryBuilder<WidgetSettings, double, QQueryOperations> offsetXProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'offsetX');
    });
  }

  QueryBuilder<WidgetSettings, double, QQueryOperations> offsetYProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'offsetY');
    });
  }

  QueryBuilder<WidgetSettings, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<WidgetSettings, String, QQueryOperations> valuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'values');
    });
  }

  QueryBuilder<WidgetSettings, WidgetType, QQueryOperations>
      widgetTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'widgetType');
    });
  }
}
