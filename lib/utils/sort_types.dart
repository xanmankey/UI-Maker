import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:isar/isar.dart';
import 'package:ui_maker/data/isar_db.dart';

/// A class for handling the sorting of the widgets in a CreatorArea
class SortTypes {
  // The available sort types can be found below
  static final SortTypes title = SortTypes._("title");
  static final SortTypes color = SortTypes._('color');
  static final SortTypes widgetType = SortTypes._('widgetType');
  // Values is the dynamic sortType option
  static final SortTypes values = SortTypes._('values');

  final String _name;

  SortTypes._(this._name);

  static List<SortTypes> get sortTypes => [title, color, widgetType, values];

  static SortTypes? fromString(String name) {
    for (SortTypes sortType in sortTypes) {
      if (sortType._name == name) {
        return sortType;
      }
    }
    return null;
  }

  /// Sorts the provided widgets by the given index
  Future<List<WidgetSettings>> sortWidgets(
      SortTypes sortType, Id layoutId) async {
    // Fetch db and layout from db
    Isar isarDB = await db.isarDB;
    Layout? layout =
        await isarDB.layouts.where().idEqualTo(layoutId).findFirst();
    assert(layout != null);
    // Create switch statement based off of all sortTypes
    switch (sortType._name) {
      case "title":
        return await layout!.widgets.filter().sortByTitleDesc().findAll();
      case "color":
        return await layout!.widgets.filter().sortByColor().findAll();
      case "widgetType":
        return await layout!.widgets.filter().sortByWidgetType().findAll();
      // Takes in the values property, sorts the strings in descending order
      // The collection already sorts
      case "values":
        return await layout!.widgets.filter().sortByValuesDesc().findAll();
      default:
        return await layout!.widgets.filter().findAll();
    }
  }

  Future<List<WidgetSettings>> filterWidgets(
      SortTypes sortType, Id layoutId, dynamic value) async {
    // Fetch db
    Isar isarDB = await db.isarDB;
    Layout? layout =
        await isarDB.layouts.where().idEqualTo(layoutId).findFirst();
    assert(layout != null);
    switch (sortType._name) {
      case "title":
        return await layout!.widgets.filter().titleEqualTo(value).findAll();
      case "color":
        return await layout!.widgets.filter().colorEqualTo(value).findAll();
      case "widgetType":
        return await layout!.widgets
            .filter()
            .widgetTypeEqualTo(value)
            .findAll();
      case "values":

      default:
        return await isarDB.widgetSettings.where().findAll();
    }
  }
}
