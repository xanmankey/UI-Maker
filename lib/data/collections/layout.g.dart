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
    r'filter': PropertySchema(
      id: 0,
      name: r'filter',
      type: IsarType.bool,
    ),
    r'layoutType': PropertySchema(
      id: 1,
      name: r'layoutType',
      type: IsarType.byte,
      enumMap: _LayoutlayoutTypeEnumValueMap,
    ),
    r'sortType': PropertySchema(
      id: 2,
      name: r'sortType',
      type: IsarType.byte,
      enumMap: _LayoutsortTypeEnumValueMap,
    )
  },
  estimateSize: _layoutEstimateSize,
  serialize: _layoutSerialize,
  deserialize: _layoutDeserialize,
  deserializeProp: _layoutDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'widgets': LinkSchema(
      id: 4285643237229661806,
      name: r'widgets',
      target: r'Widget',
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
  return bytesCount;
}

void _layoutSerialize(
  Layout object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.filter);
  writer.writeByte(offsets[1], object.layoutType.index);
  writer.writeByte(offsets[2], object.sortType.index);
}

Layout _layoutDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Layout();
  object.filter = reader.readBool(offsets[0]);
  object.id = id;
  object.layoutType =
      _LayoutlayoutTypeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
          LayoutType.columns;
  object.sortType =
      _LayoutsortTypeValueEnumMap[reader.readByteOrNull(offsets[2])] ??
          SortTypesEnum.title;
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
      return (reader.readBool(offset)) as P;
    case 1:
      return (_LayoutlayoutTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          LayoutType.columns) as P;
    case 2:
      return (_LayoutsortTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          SortTypesEnum.title) as P;
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
const _LayoutsortTypeEnumValueMap = {
  'title': 0,
  'color': 1,
  'widgetType': 2,
};
const _LayoutsortTypeValueEnumMap = {
  0: SortTypesEnum.title,
  1: SortTypesEnum.color,
  2: SortTypesEnum.widgetType,
};

Id _layoutGetId(Layout object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _layoutGetLinks(Layout object) {
  return [object.widgets];
}

void _layoutAttach(IsarCollection<dynamic> col, Id id, Layout object) {
  object.id = id;
  object.widgets.attach(col, col.isar.collection<Widget>(), r'widgets', id);
}

extension LayoutQueryWhereSort on QueryBuilder<Layout, Layout, QWhere> {
  QueryBuilder<Layout, Layout, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
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
}

extension LayoutQueryFilter on QueryBuilder<Layout, Layout, QFilterCondition> {
  QueryBuilder<Layout, Layout, QAfterFilterCondition> filterEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filter',
        value: value,
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

  QueryBuilder<Layout, Layout, QAfterFilterCondition> sortTypeEqualTo(
      SortTypesEnum value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sortType',
        value: value,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> sortTypeGreaterThan(
    SortTypesEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sortType',
        value: value,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> sortTypeLessThan(
    SortTypesEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sortType',
        value: value,
      ));
    });
  }

  QueryBuilder<Layout, Layout, QAfterFilterCondition> sortTypeBetween(
    SortTypesEnum lower,
    SortTypesEnum upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sortType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LayoutQueryObject on QueryBuilder<Layout, Layout, QFilterCondition> {}

extension LayoutQueryLinks on QueryBuilder<Layout, Layout, QFilterCondition> {
  QueryBuilder<Layout, Layout, QAfterFilterCondition> widgets(
      FilterQuery<Widget> q) {
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
  QueryBuilder<Layout, Layout, QAfterSortBy> sortByFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filter', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> sortByFilterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filter', Sort.desc);
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

  QueryBuilder<Layout, Layout, QAfterSortBy> sortBySortType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortType', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> sortBySortTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortType', Sort.desc);
    });
  }
}

extension LayoutQuerySortThenBy on QueryBuilder<Layout, Layout, QSortThenBy> {
  QueryBuilder<Layout, Layout, QAfterSortBy> thenByFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filter', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> thenByFilterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filter', Sort.desc);
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

  QueryBuilder<Layout, Layout, QAfterSortBy> thenBySortType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortType', Sort.asc);
    });
  }

  QueryBuilder<Layout, Layout, QAfterSortBy> thenBySortTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortType', Sort.desc);
    });
  }
}

extension LayoutQueryWhereDistinct on QueryBuilder<Layout, Layout, QDistinct> {
  QueryBuilder<Layout, Layout, QDistinct> distinctByFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filter');
    });
  }

  QueryBuilder<Layout, Layout, QDistinct> distinctByLayoutType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'layoutType');
    });
  }

  QueryBuilder<Layout, Layout, QDistinct> distinctBySortType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sortType');
    });
  }
}

extension LayoutQueryProperty on QueryBuilder<Layout, Layout, QQueryProperty> {
  QueryBuilder<Layout, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Layout, bool, QQueryOperations> filterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filter');
    });
  }

  QueryBuilder<Layout, LayoutType, QQueryOperations> layoutTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'layoutType');
    });
  }

  QueryBuilder<Layout, SortTypesEnum, QQueryOperations> sortTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sortType');
    });
  }
}
