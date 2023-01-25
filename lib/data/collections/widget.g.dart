// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetWidgetCollection on Isar {
  IsarCollection<Widget> get widgets => this.collection();
}

const WidgetSchema = CollectionSchema(
  name: r'Widget',
  id: -9010514747698676556,
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
    r'offsetX': PropertySchema(
      id: 2,
      name: r'offsetX',
      type: IsarType.double,
    ),
    r'offsetY': PropertySchema(
      id: 3,
      name: r'offsetY',
      type: IsarType.double,
    ),
    r'title': PropertySchema(
      id: 4,
      name: r'title',
      type: IsarType.string,
    ),
    r'values': PropertySchema(
      id: 5,
      name: r'values',
      type: IsarType.string,
    ),
    r'widgetType': PropertySchema(
      id: 6,
      name: r'widgetType',
      type: IsarType.byte,
      enumMap: _WidgetwidgetTypeEnumValueMap,
    )
  },
  estimateSize: _widgetEstimateSize,
  serialize: _widgetSerialize,
  deserialize: _widgetDeserialize,
  deserializeProp: _widgetDeserializeProp,
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
      id: -1306453724581487875,
      name: r'widgets',
      target: r'Widget',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _widgetGetId,
  getLinks: _widgetGetLinks,
  attach: _widgetAttach,
  version: '3.0.5',
);

int _widgetEstimateSize(
  Widget object,
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

void _widgetSerialize(
  Widget object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.color);
  writer.writeString(offsets[1], object.description);
  writer.writeDouble(offsets[2], object.offsetX);
  writer.writeDouble(offsets[3], object.offsetY);
  writer.writeString(offsets[4], object.title);
  writer.writeString(offsets[5], object.values);
  writer.writeByte(offsets[6], object.widgetType.index);
}

Widget _widgetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Widget();
  object.color = reader.readLong(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.offsetX = reader.readDouble(offsets[2]);
  object.offsetY = reader.readDouble(offsets[3]);
  object.title = reader.readString(offsets[4]);
  object.values = reader.readString(offsets[5]);
  object.widgetType =
      _WidgetwidgetTypeValueEnumMap[reader.readByteOrNull(offsets[6])] ??
          WidgetType.card;
  return object;
}

P _widgetDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (_WidgetwidgetTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          WidgetType.card) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _WidgetwidgetTypeEnumValueMap = {
  'card': 0,
  'dropdown': 1,
  'checkbox': 2,
  'numField': 3,
  'textField': 4,
};
const _WidgetwidgetTypeValueEnumMap = {
  0: WidgetType.card,
  1: WidgetType.dropdown,
  2: WidgetType.checkbox,
  3: WidgetType.numField,
  4: WidgetType.textField,
};

Id _widgetGetId(Widget object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _widgetGetLinks(Widget object) {
  return [object.widgets];
}

void _widgetAttach(IsarCollection<dynamic> col, Id id, Widget object) {
  object.id = id;
  object.widgets.attach(col, col.isar.collection<Widget>(), r'widgets', id);
}

extension WidgetQueryWhereSort on QueryBuilder<Widget, Widget, QWhere> {
  QueryBuilder<Widget, Widget, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Widget, Widget, QAfterWhere> anyColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'color'),
      );
    });
  }

  QueryBuilder<Widget, Widget, QAfterWhere> anyWidgetType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'widgetType'),
      );
    });
  }
}

extension WidgetQueryWhere on QueryBuilder<Widget, Widget, QWhereClause> {
  QueryBuilder<Widget, Widget, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Widget, Widget, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Widget, Widget, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Widget, Widget, QAfterWhereClause> idBetween(
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

  QueryBuilder<Widget, Widget, QAfterWhereClause> titleEqualTo(String title) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'title',
        value: [title],
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterWhereClause> titleNotEqualTo(
      String title) {
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

  QueryBuilder<Widget, Widget, QAfterWhereClause> colorEqualTo(int color) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'color',
        value: [color],
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterWhereClause> colorNotEqualTo(int color) {
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

  QueryBuilder<Widget, Widget, QAfterWhereClause> colorGreaterThan(
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

  QueryBuilder<Widget, Widget, QAfterWhereClause> colorLessThan(
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

  QueryBuilder<Widget, Widget, QAfterWhereClause> colorBetween(
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

  QueryBuilder<Widget, Widget, QAfterWhereClause> widgetTypeEqualTo(
      WidgetType widgetType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'widgetType',
        value: [widgetType],
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterWhereClause> widgetTypeNotEqualTo(
      WidgetType widgetType) {
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

  QueryBuilder<Widget, Widget, QAfterWhereClause> widgetTypeGreaterThan(
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

  QueryBuilder<Widget, Widget, QAfterWhereClause> widgetTypeLessThan(
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

  QueryBuilder<Widget, Widget, QAfterWhereClause> widgetTypeBetween(
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

extension WidgetQueryFilter on QueryBuilder<Widget, Widget, QFilterCondition> {
  QueryBuilder<Widget, Widget, QAfterFilterCondition> colorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> colorGreaterThan(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> colorLessThan(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> colorBetween(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> descriptionGreaterThan(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> offsetXEqualTo(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> offsetXGreaterThan(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> offsetXLessThan(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> offsetXBetween(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> offsetYEqualTo(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> offsetYGreaterThan(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> offsetYLessThan(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> offsetYBetween(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> valuesEqualTo(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> valuesGreaterThan(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> valuesLessThan(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> valuesBetween(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> valuesStartsWith(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> valuesEndsWith(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> valuesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'values',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> valuesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'values',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> valuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'values',
        value: '',
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> valuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'values',
        value: '',
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> widgetTypeEqualTo(
      WidgetType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'widgetType',
        value: value,
      ));
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> widgetTypeGreaterThan(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> widgetTypeLessThan(
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

  QueryBuilder<Widget, Widget, QAfterFilterCondition> widgetTypeBetween(
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

extension WidgetQueryObject on QueryBuilder<Widget, Widget, QFilterCondition> {}

extension WidgetQueryLinks on QueryBuilder<Widget, Widget, QFilterCondition> {
  QueryBuilder<Widget, Widget, QAfterFilterCondition> widgets(
      FilterQuery<Widget> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'widgets');
    });
  }

  QueryBuilder<Widget, Widget, QAfterFilterCondition> widgetsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'widgets', 0, true, 0, true);
    });
  }
}

extension WidgetQuerySortBy on QueryBuilder<Widget, Widget, QSortBy> {
  QueryBuilder<Widget, Widget, QAfterSortBy> sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> sortByOffsetX() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetX', Sort.asc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> sortByOffsetXDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetX', Sort.desc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> sortByOffsetY() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetY', Sort.asc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> sortByOffsetYDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetY', Sort.desc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> sortByValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'values', Sort.asc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> sortByValuesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'values', Sort.desc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> sortByWidgetType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetType', Sort.asc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> sortByWidgetTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetType', Sort.desc);
    });
  }
}

extension WidgetQuerySortThenBy on QueryBuilder<Widget, Widget, QSortThenBy> {
  QueryBuilder<Widget, Widget, QAfterSortBy> thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> thenByOffsetX() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetX', Sort.asc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> thenByOffsetXDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetX', Sort.desc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> thenByOffsetY() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetY', Sort.asc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> thenByOffsetYDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offsetY', Sort.desc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> thenByValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'values', Sort.asc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> thenByValuesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'values', Sort.desc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> thenByWidgetType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetType', Sort.asc);
    });
  }

  QueryBuilder<Widget, Widget, QAfterSortBy> thenByWidgetTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widgetType', Sort.desc);
    });
  }
}

extension WidgetQueryWhereDistinct on QueryBuilder<Widget, Widget, QDistinct> {
  QueryBuilder<Widget, Widget, QDistinct> distinctByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'color');
    });
  }

  QueryBuilder<Widget, Widget, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Widget, Widget, QDistinct> distinctByOffsetX() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'offsetX');
    });
  }

  QueryBuilder<Widget, Widget, QDistinct> distinctByOffsetY() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'offsetY');
    });
  }

  QueryBuilder<Widget, Widget, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Widget, Widget, QDistinct> distinctByValues(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'values', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Widget, Widget, QDistinct> distinctByWidgetType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'widgetType');
    });
  }
}

extension WidgetQueryProperty on QueryBuilder<Widget, Widget, QQueryProperty> {
  QueryBuilder<Widget, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Widget, int, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<Widget, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Widget, double, QQueryOperations> offsetXProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'offsetX');
    });
  }

  QueryBuilder<Widget, double, QQueryOperations> offsetYProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'offsetY');
    });
  }

  QueryBuilder<Widget, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<Widget, String, QQueryOperations> valuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'values');
    });
  }

  QueryBuilder<Widget, WidgetType, QQueryOperations> widgetTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'widgetType');
    });
  }
}
