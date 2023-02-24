// Note that the part command also includes the settings as part of the library

import 'package:isar/isar.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/vars/layout_types.dart';
import 'package:ui_maker/vars/sort_types.dart';

part 'layout.g.dart';

/// A collection for handling the layout of each widget in a CreatorArea
///
/// ```
/// @collection
/// class Layout {
///   /// The id of each widget; autoincremented by Isar
///   Id id = Isar.autoIncrement;
///
///   /// The widgets that a particular layout has
///   IsarLink<Widget> widgets = IsarLink<Widget>();
///
///   /// The structure of the layout; by default it is columns,
///   /// but horizontal rows are also supported, as well as no layout
///   /// (widgets will retain their current position)
///   @enumerated
///   LayoutType layoutType = LayoutType.columns;
///
///   /// How the widgets should be sorted; widget sorting only occurs if the
///   /// layout type is not LayoutType.none
///   @enumerated
///   late SortTypesEnum sortType;
///
///   /// A boolean to determine whether the widgets should be filtered or sorted
///   bool filter = false;
///
///   @override
///   String toString() {
///     return '''$id: {layoutType: $layoutType, sortType: $sortType, filter:
///     $filter}''';
///   }
/// }
/// ```
///
/// Backlinks to program and gamemode
///
///
@collection
class Layout {
  Layout({
    required this.layoutName,
    required this.width,
    required this.height,
    this.layoutType = LayoutType.columns,
    this.numGroups = 4,
    this.sortOption = SortOption.sort,
  })  : id = Isar.autoIncrement,
        widgets = IsarLinks<WidgetSettings>();

  /// The id of each widget; autoincremented by Isar
  Id id;

  @Index(unique: true)
  String layoutName;

  /// The widgets that a particular layout has
  IsarLinks<WidgetSettings> widgets;

  /// The structure of the layout; by default it is columns,
  /// but horizontal rows are also supported, as well as no layout
  /// (widgets will retain their current position)
  @Index()
  @enumerated
  LayoutType layoutType;

  /// The number of listviews alloted by the layout
  @Index()
  int numGroups;

  /// The width and height of the particular layout
  /// TODO: potentially late?
  double width;
  double height;

  /// A boolean to determine whether the widgets should be filtered or sorted
  @Index()
  @enumerated
  SortOption sortOption;

  @override
  String toString() {
    return '''$id: {layoutType: $layoutType, widgets: ${widgets.toList()}, filter: 
    $sortOption}''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Layout otherLayout = other as Layout;
    return id == otherLayout.id &&
        layoutName == otherLayout.layoutName &&
        layoutType == otherLayout.layoutType &&
        widgets.length == otherLayout.widgets.length &&
        sortOption == otherLayout.sortOption &&
        numGroups == otherLayout.numGroups &&
        width == otherLayout.width &&
        height == otherLayout.height;
  }
}
