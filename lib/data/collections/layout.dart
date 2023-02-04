import 'package:isar/isar.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/utils/layout_types.dart';
import 'package:ui_maker/utils/sort_types.dart';

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
  /// The id of each widget; autoincremented by Isar
  Id id = Isar.autoIncrement;

  /// The widgets that a particular layout has
  IsarLinks<WidgetSettings> widgets = IsarLinks<WidgetSettings>();

  /// The structure of the layout; by default it is columns,
  /// but horizontal rows are also supported, as well as no layout
  /// (widgets will retain their current position)
  @Index()
  @enumerated
  LayoutType layoutType = LayoutType.columns;

  /// The number of listviews alloted by the layout
  @Index()
  int numGroups = 4;

  late double width;
  late double height;

  /// A boolean to determine whether the widgets should be filtered or sorted
  @Index()
  bool filter = false;

  @override
  String toString() {
    return '''$id: {layoutType: $layoutType, widgets: ${widgets.toList()}, filter: 
    $filter}''';
  }
}
