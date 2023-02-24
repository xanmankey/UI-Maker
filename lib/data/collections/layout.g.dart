// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetLayoutCollection on Isar {
  IsarCollection<Layout> get layouts => this.collection();
}

const LayoutSchema = CollectionSchema(
  name: r'Layout',
  id: -8976498532819133435,
  properties: {
    r'height': PropertySchema(
      id: 0,
      name: r'height',
      type: IsarType.double,
    ),
    r'layoutName': PropertySchema(
      id: 1,
      name: r'layoutName',
      type: IsarType.string,
    ),
    r'layoutType': PropertySchema(
      id: 2,
      name: r'layoutType',
      type: IsarType.byte,
      enumMap: _LayoutlayoutTypeEnumValueMap,
    ),
    r'numGroups': PropertySchema(
      id: 3,
      name: r'numGroups',
      type: IsarType.long,
    ),
    r'sortOption': PropertySchema(
      id: 4,
      name: r'sortOption',
      type: IsarType.byte,
      enumMap: _LayoutsortOptionEnumValueMap,
    ),
    r'width': PropertySchema(
      id: 5,
      name: r'width',
      type: IsarType.double,
    )
  },
  estimateSize: _layoutEstimateSize,
  serialize: _layoutSerialize,
  deserialize: _layoutDeserialize,
  deserializeProp: _layoutDeserializeProp,
  idName: r'id',
  indexes: {
    r'layoutName': IndexSchema(
      id: 3865651608717070949,
      name: r'layoutName',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'layoutName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'layoutType': IndexSchema(
      id: -2393727137416813581,
      name: r'layoutType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'layoutType',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'numGroups': IndexSchema(
      id: 8487955435739437758,
      name: r'numGroups',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'numGroups',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'sortOption': IndexSchema(
      id: 3501856697699648544,
      name: r'sortOption',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sortOption',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'widgets': LinkSchema(
      id: 4285643237229661806,
      name: r'widgets',
      target: r'WidgetSettings',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _layoutGetId,
  getLinks: _layoutGetLinks,
  attach: _layoutAttach,
  version: '3.0.5',
);

int _layoutEstimateSize(
  Layout object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.layoutName.length * 3;
  return bytesCount;
}

void _layoutSerialize(
  Layout object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.height);
  writer.writeString(offsets[1], object.layoutName);
  writer.writeByte(offsets[2], object.layoutType.index);
  writer.writeLong(offsets[3], object.numGroups);
  writer.writeByte(offsets[4], object.sortOption.index);
  writer.writeDouble(offsets[5], object.width);
}

Layout _layoutDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Layout(
    height: reader.readDouble(offsets[0]),
    layoutName: reader.readString(offsets[1]),
    layoutType:
        _LayoutlayoutTypeValueEnumMap[reader.readByteOrNull(offsets[2])] ??
            LayoutType.columns,
    numGroups: reader.readLongOrNull(offsets[3]) ?? 4,
    sortOption:
        _LayoutsortOptionValueEnumMap[reader.readByteOrNull(offsets[4])] ??
            SortOption.sort,
    width: reader.readDouble(offsets[5]),
  );
  object.id = id;
  return object;
}

P _layoutDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (_LayoutlayoutTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          LayoutType.columns) as P;
    case 3:
      return (reader.readLongOrNull(offset) ?? 4) as P;
    case 4:
      return (_LayoutsortOptionValueEnumMap[reader.readByteOrNull(offset)] ??
          SortOption.sort) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LayoutlayoutTypeEnumValueMap = {
  'columns': 0,
  'rows': 1,
  'none': 2,
};
const _LayoutlayoutTypeValueEnumMap = {
  0: LayoutType.columns,
  1: LayoutType.rows,
  2: LayoutType.none,
};
const _LayoutsortOptionEnumValueMap = {
  'filter': 0,
  'sort': 1,
};
const _LayoutsortOptionValueEnumMap = {
  0: SortOption.filter,
  1: SortOption.sort,
};

Id _layoutGetId(Layout object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _layoutGetLinks(Layout object) {
  return [object.widgets];
}

void _layoutAttach(IsarCollection<dynamic> col, Id id, Layout object) {
  object.id = id;
  object.widgets
      .attach(col, col.isar.collection<WidgetSettings>(), r'widgets', id);
}

extension LayoutByIndex on IsarCollection<Layout> {
  Future<Layout?> getByLayoutName(String layoutName) {
    return getByIndex(r'layoutName', [layoutName]);
  }

  Layout? getByLayoutNameSync(String layoutName) {
    return getByIndexSync(r'layoutName', [layoutName]);
  }

  Future<bool> deleteByLayoutName(String layoutName) {
    return deleteByIndex(r'layoutName', [layoutName]);
  }

  bool deleteByLayoutNameSync(String layoutName) {
    return deleteByIndexSync(r'layoutName', [layoutName]);
  }

  Future<List<Layout?>> getAllByLayoutName(List<String> layoutNameValues) {
    final values = layoutNameValues.map((e) => [e]).toList();
    return getAllByIndex(r'layoutName', values);
  }

  List<Layout?> getAllByLayoutNameSync(List<String> layoutNameValues) {
    final values = layoutNameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'layoutName', values);
  }

  Future<int> deleteAllByLayoutName(List<String> layoutNameValues) {
    final values = layoutNameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'layoutName', values);
  }

  int deleteAllByLayoutNameSync(List<String> layoutNameValues) {
    final values = layoutNameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'layoutName', values);
  }

  Future<Id> putByLayoutName(Layout object) {
    return putByIndex(r'layoutName', object);
  }

  Id putByLayoutNameSync(Layout object, {bool saveLinks = true}) {
    return putByIndexSync(r'layoutName', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLayoutName(List<Layout> objects) {
    return putAllByIndex(r'layoutName', objects);
  }

  List<Id> putAllByLayoutNameSync(List<Layout> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'layoutName', objects, saveLinks: saveLinks);
  }
}

extension LayoutQueryWhereSort on QueryBuilder<Layout, Layout, QWhere> {
  QueryBuilder<Layout, Layout, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhere> anyLayoutType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'layoutType'),
      );
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhere> anyNumGroups() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'numGroups'),
      );
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhere> anySortOption() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'sortOption'),
      );
    });
  }
}

extension LayoutQueryWhere on QueryBuilder<Layout, Layout, QWhereClause> {
  QueryBuilder<Layout, Layout, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Layout, Layout, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> idBetween(
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

  QueryBuilder<Layout, Layout, QAfterWhereClause> layoutNameEqualTo(
      String layoutName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'layoutName',
        value: [layoutName],
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> layoutNameNotEqualTo(
      String layoutName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'layoutName',
              lower: [],
              upper: [layoutName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'layoutName',
              lower: [layoutName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'layoutName',
              lower: [layoutName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'layoutName',
              lower: [],
              upper: [layoutName],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> layoutTypeEqualTo(
      LayoutType layoutType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'layoutType',
        value: [layoutType],
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> layoutTypeNotEqualTo(
      LayoutType layoutType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'layoutType',
              lower: [],
              upper: [layoutType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'layoutType',
              lower: [layoutType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'layoutType',
              lower: [layoutType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'layoutType',
              lower: [],
              upper: [layoutType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> layoutTypeGreaterThan(
    LayoutType layoutType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'layoutType',
        lower: [layoutType],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> layoutTypeLessThan(
    LayoutType layoutType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'layoutType',
        lower: [],
        upper: [layoutType],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> layoutTypeBetween(
    LayoutType lowerLayoutType,
    LayoutType upperLayoutType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'layoutType',
        lower: [lowerLayoutType],
        includeLower: includeLower,
        upper: [upperLayoutType],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> numGroupsEqualTo(
      int numGroups) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'numGroups',
        value: [numGroups],
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> numGroupsNotEqualTo(
      int numGroups) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'numGroups',
              lower: [],
              upper: [numGroups],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'numGroups',
              lower: [numGroups],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'numGroups',
              lower: [numGroups],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'numGroups',
              lower: [],
              upper: [numGroups],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> numGroupsGreaterThan(
    int numGroups, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'numGroups',
        lower: [numGroups],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> numGroupsLessThan(
    int numGroups, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'numGroups',
        lower: [],
        upper: [numGroups],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> numGroupsBetween(
    int lowerNumGroups,
    int upperNumGroups, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'numGroups',
        lower: [lowerNumGroups],
        includeLower: includeLower,
        upper: [upperNumGroups],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> sortOptionEqualTo(
      SortOption sortOption) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sortOption',
        value: [sortOption],
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> sortOptionNotEqualTo(
      SortOption sortOption) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sortOption',
              lower: [],
              upper: [sortOption],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sortOption',
              lower: [sortOption],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sortOption',
              lower: [sortOption],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sortOption',
              lower: [],
              upper: [sortOption],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> sortOptionGreaterThan(
    SortOption sortOption, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sortOption',
        lower: [sortOption],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> sortOptionLessThan(
    SortOption sortOption, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sortOption',
        lower: [],
        upper: [sortOption],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterWhereClause> sortOptionBetween(
    SortOption lowerSortOption,
    SortOption upperSortOption, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sortOption',
        lower: [lowerSortOption],
        includeLower: includeLower,
        upper: [upperSortOption],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LayoutQueryFilter on QueryBuilder<Layout, Layout, QFilterCondition> {
  QueryBuilder<Layout, Layout, QAfterFilterCondition> heightEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> heightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> heightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> heightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'height',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Layout, Layout, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Layout, Layout, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Layout, Layout, QAfterFilterCondition> layoutNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'layoutName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> layoutNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'layoutName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> layoutNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'layoutName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> layoutNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'layoutName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> layoutNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'layoutName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> layoutNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'layoutName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> layoutNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'layoutName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> layoutNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'layoutName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> layoutNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'layoutName',
        value: '',
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> layoutNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'layoutName',
        value: '',
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> layoutTypeEqualTo(
      LayoutType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'layoutType',
        value: value,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> layoutTypeGreaterThan(
    LayoutType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'layoutType',
        value: value,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> layoutTypeLessThan(
    LayoutType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'layoutType',
        value: value,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> layoutTypeBetween(
    LayoutType lower,
    LayoutType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'layoutType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> numGroupsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numGroups',
        value: value,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> numGroupsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numGroups',
        value: value,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> numGroupsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numGroups',
        value: value,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> numGroupsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numGroups',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> sortOptionEqualTo(
      SortOption value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sortOption',
        value: value,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> sortOptionGreaterThan(
    SortOption value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sortOption',
        value: value,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> sortOptionLessThan(
    SortOption value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sortOption',
        value: value,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> sortOptionBetween(
    SortOption lower,
    SortOption upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sortOption',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> widthEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'width',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> widthGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'width',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> widthLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'width',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> widthBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'width',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension LayoutQueryObject on QueryBuilder<Layout, Layout, QFilterCondition> {}

extension LayoutQueryLinks on QueryBuilder<Layout, Layout, QFilterCondition> {
  QueryBuilder<Layout, Layout, QAfterFilterCondition> widgets(
      FilterQuery<WidgetSettings> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'widgets');
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> widgetsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'widgets', length, true, length, true);
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> widgetsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'widgets', 0, true, 0, true);
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> widgetsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'widgets', 0, false, 999999, true);
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> widgetsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'widgets', 0, true, length, include);
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> widgetsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'widgets', length, include, 999999, true);
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> widgetsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'widgets', lower, includeLower, upper, includeUpper);
    });
  }
}

extension LayoutQuerySortBy on QueryBuilder<Layout, Layout, QSortBy> {
  QueryBuilder<Layout, Layout, QAfterSortBy> sortByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> sortByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> sortByLayoutName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layoutName', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> sortByLayoutNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layoutName', Sort.desc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> sortByLayoutType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layoutType', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> sortByLayoutTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layoutType', Sort.desc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> sortByNumGroups() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numGroups', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> sortByNumGroupsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numGroups', Sort.desc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> sortBySortOption() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOption', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> sortBySortOptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOption', Sort.desc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> sortByWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> sortByWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.desc);
    });
  }
}

extension LayoutQuerySortThenBy on QueryBuilder<Layout, Layout, QSortThenBy> {
  QueryBuilder<Layout, Layout, QAfterSortBy> thenByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> thenByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> thenByLayoutName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layoutName', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> thenByLayoutNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layoutName', Sort.desc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> thenByLayoutType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layoutType', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> thenByLayoutTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layoutType', Sort.desc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> thenByNumGroups() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numGroups', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> thenByNumGroupsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numGroups', Sort.desc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> thenBySortOption() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOption', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> thenBySortOptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOption', Sort.desc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> thenByWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> thenByWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.desc);
    });
  }
}

extension LayoutQueryWhereDistinct on QueryBuilder<Layout, Layout, QDistinct> {
  QueryBuilder<Layout, Layout, QDistinct> distinctByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'height');
    });
  }

  QueryBuilder<Layout, Layout, QDistinct> distinctByLayoutName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'layoutName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Layout, Layout, QDistinct> distinctByLayoutType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'layoutType');
    });
  }

  QueryBuilder<Layout, Layout, QDistinct> distinctByNumGroups() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numGroups');
    });
  }

  QueryBuilder<Layout, Layout, QDistinct> distinctBySortOption() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sortOption');
    });
  }

  QueryBuilder<Layout, Layout, QDistinct> distinctByWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'width');
    });
  }
}

extension LayoutQueryProperty on QueryBuilder<Layout, Layout, QQueryProperty> {
  QueryBuilder<Layout, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Layout, double, QQueryOperations> heightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'height');
    });
  }

  QueryBuilder<Layout, String, QQueryOperations> layoutNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'layoutName');
    });
  }

  QueryBuilder<Layout, LayoutType, QQueryOperations> layoutTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'layoutType');
    });
  }

  QueryBuilder<Layout, int, QQueryOperations> numGroupsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numGroups');
    });
  }

  QueryBuilder<Layout, SortOption, QQueryOperations> sortOptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sortOption');
    });
  }

  QueryBuilder<Layout, double, QQueryOperations> widthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'width');
    });
  }
}
