import 'package:isar/isar.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/logging.dart';

/// A class for creating and retrieving the Isar database instance.
/// Also defines widget filter, sort, update, and delete functions.
///
/// ```
/// class DB {
///   late Future<Isar> isarDB;
///   Logger logger = Logger('data');
///
///   DB() {
///     isarDB = openDB();
///   }
///
///   Future<Isar> openDB() async {
///     late Isar isarDB;
///     if (Isar.instanceNames.isEmpty) {
///       isarDB = await Isar.open(
///         [
///           WidgetSettingsSchema,
///           LayoutSchema,
///         ],
///         name: "db",
///       );
///     }
///     return isarDB;
///   }
///
///   /// Retrieve widget(s) by a widget index value
///   /// TODO: I would like to allow for indexes to be added to this check here
///   /// e.g. the user wants to add a new sortable index, and that value is checked
///   /// against here
///   Future<List<WidgetSettings>> getWidgetSettings(
///       Map<String, dynamic> index) async {
///     try {
///       Isar db = await isarDB;
///       switch (index.entries.first.key) {
///         case "title":
///           return await db.widgetSettings
///               .filter()
///               .titleStartsWith(index.entries.first.value)
///               .findAll();
///         case "widgetType":
///           return await db.widgetSettings
///               .filter()
///               .widgetTypeEqualTo(index.entries.first.value)
///               .findAll();
///         case "color":
///           return await db.widgetSettings
///               .filter()
///               .colorEqualTo(index.entries.first.value)
///               .findAll();
///         default:
///           return [];
///       }
///     } catch (e, stacktrace) {
///       logger.warning("$stacktrace: $e");
///       return [];
///     }
///   }
///
///   /// Returns a sorted list based on specified widgetSettings indexes
///   /// This is primarily a SORTING function
///   Future<List<WidgetSettings>> getWidgetSettingsList(
///       List<Map<String, Sort>> indexes) async {
///     try {
///       Isar db = await isarDB;
///       // Default case; sort by id
///       if (indexes.isEmpty) {
///         List<WidgetSettings> widgetSettings =
///             await db.widgetSettings.where().findAll();
///         return widgetSettings;
///       }
///       // Building a dynamic query to execute based on the user sorting preferences
///       List<SortProperty> sortProperties = [];
///       for (Map<String, Sort> index in indexes) {
///         switch (index.entries.first.key) {
///           case "title":
///             sortProperties.add(SortProperty(
///                 property: 'title', sort: index.entries.first.value));
///             break;
///           case "widgetType":
///             sortProperties.add(SortProperty(
///                 property: 'widgetType', sort: index.entries.first.value));
///             break;
///           case "color":
///             sortProperties.add(SortProperty(
///                 property: 'color', sort: index.entries.first.value));
///             break;
///           default:
///             break;
///         }
///       }
///       List<WidgetSettings> widgetSettings = await db.widgetSettings
///           .buildQuery<WidgetSettings>(sortBy: sortProperties)
///           .findAll();
///       return widgetSettings;
///     } catch (e, stacktrace) {
///       logger.warning("$stacktrace: $e");
///       return [];
///     }
///   }
///
///   /// Update all given widgetSettings
///   Future<List<WidgetSettings?>?> updateWidgetSettings(
///       List<WidgetSettings> widgetSettings) async {
///     try {
///       Isar db = await isarDB;
///       List<int> ids = await db.widgetSettings.putAll(widgetSettings);
///       return await db.widgetSettings.getAll(ids);
///     } catch (e, stacktrace) {
///       logger.warning("$stacktrace: $e");
///       return null;
///     }
///   }
///
///   /// Deletes all widgetSettings with the selected ids
///   Future<int?> deleteWidgetSettings(List<int> characterIds) async {
///     try {
///       Isar db = await isarDB;
///       int numCharactersDeleted =
///           await db.widgetSettings.deleteAll(characterIds);
///       return numCharactersDeleted;
///     } catch (e, stacktrace) {
///       logger.warning("$stacktrace: $e");
///       return null;
///     }
///   }
// }
/// ```
class DB {
  late Future<Isar> isarDB;
  bool logging;

  DB({this.logging = false}) {
    isarDB = openDB();
  }

  Future<Isar> openDB() async {
    late Isar isarDB;
    if (Isar.instanceNames.isEmpty) {
      isarDB = await Isar.open(
        [
          WidgetSettingsSchema,
          LayoutSchema,
        ],
        name: "db",
      );
    }
    return isarDB;
  }

  /// Retrieve widget(s) by a widget index value via filtering or sorting
  /// (or both!). Note that using Isar standalone has much more functionality,
  /// but these functions expose access to basic functionality for the library
  /// via the DB class
  /// properties param ex: {"sort" || "filter": {"indexName": Sort type || yourFilterValue}
  Future<List<WidgetSettings>> getWidgetSettings(
      List<Map<String, Map<String, dynamic>>> properties) async {
    try {
      Isar db = await isarDB;
      List<FilterCondition> filterConditions = [];
      List<SortProperty> sortProperties = [];
      for (Map<String, Map<String, dynamic>> property in properties) {
        if (property.entries.first.key.toLowerCase() == "filter") {
          switch (property.entries.first.value.entries.first.key) {
            case "title":
              filterConditions.add(FilterCondition(
                type: FilterConditionType.equalTo,
                property: "title",
                value1: property.entries.first.value.entries.first.value,
                include1: true,
                include2: false,
                caseSensitive: false,
              ));
              break;
            case "widgetType":
              filterConditions.add(FilterCondition(
                type: FilterConditionType.equalTo,
                property: "widgetType",
                value1: property.entries.first.value.entries.first.value,
                include1: true,
                include2: false,
                caseSensitive: false,
              ));
              break;
            case "color":
              filterConditions.add(FilterCondition(
                type: FilterConditionType.equalTo,
                property: "color",
                value1: property.entries.first.value.entries.first.value,
                include1: true,
                include2: false,
                caseSensitive: false,
              ));
              break;
            case "listviewNum":
              filterConditions.add(FilterCondition(
                type: FilterConditionType.equalTo,
                property: "listviewNum",
                value1: property.entries.first.value.entries.first.value,
                include1: true,
                include2: false,
                caseSensitive: false,
              ));
              break;
            case "listviewIndex":
              filterConditions.add(FilterCondition(
                type: FilterConditionType.equalTo,
                property: "listviewIndex",
                value1: property.entries.first.value.entries.first.value,
                include1: true,
                include2: false,
                caseSensitive: false,
              ));
              break;
            case "id":
              filterConditions.add(FilterCondition(
                type: FilterConditionType.equalTo,
                property: "id",
                value1: property.entries.first.value.entries.first.value,
                include1: true,
                include2: false,
                caseSensitive: false,
              ));
              break;
            default:
              break;
          }
        } else if (property.entries.first.key.toLowerCase() == "sort") {
          switch (property.entries.first.key) {
            case "title":
              sortProperties.add(SortProperty(
                  property: 'title',
                  sort: property.entries.first.value.entries.first.value));
              break;
            case "widgetType":
              sortProperties.add(SortProperty(
                  property: 'widgetType',
                  sort: property.entries.first.value.entries.first.value));
              break;
            case "color":
              sortProperties.add(SortProperty(
                  property: 'color',
                  sort: property.entries.first.value.entries.first.value));
              break;
            case "listviewNum":
              sortProperties.add(SortProperty(
                  property: 'listviewNum',
                  sort: property.entries.first.value.entries.first.value));
              break;
            case "listviewIndex":
              sortProperties.add(SortProperty(
                  property: 'listviewIndex',
                  sort: property.entries.first.value.entries.first.value));
              break;
            default:
              break;
          }
        }
      }
      List<WidgetSettings> widgetSettings = await db.widgetSettings
          .buildQuery<WidgetSettings>(
              filter: FilterGroup(
                  type: FilterGroupType.and, filters: filterConditions),
              sortBy: sortProperties)
          .findAll();
      return widgetSettings;
    } catch (e, stacktrace) {
      logger.warning("$stacktrace: $e");
      return [];
    }
  }

  /// Update all given widgetSettings
  Future<List<WidgetSettings?>?> updateWidgetSettings(
      List<WidgetSettings> widgetSettings) async {
    try {
      Isar db = await isarDB;
      List<int> ids = await db.widgetSettings.putAll(widgetSettings);
      return await db.widgetSettings.getAll(ids);
    } catch (e, stacktrace) {
      logger.warning("$stacktrace: $e");
      return null;
    }
  }

  /// Deletes all widgetSettings with the selected ids
  Future<int?> deleteWidgetSettings(List<int> widgetSettingsIds) async {
    try {
      Isar db = await isarDB;
      int numDeleted = await db.widgetSettings.deleteAll(widgetSettingsIds);
      return numDeleted;
    } catch (e, stacktrace) {
      logger.warning("$stacktrace: $e");
      return null;
    }
  }

  /// Retrieve layout by a layout index value using isar db queries
  /// properties param ex: {"sort" || "filter": {"indexName": Sort type || yourFilterValue}
  Future<List<Layout>> getLayouts(
      List<Map<String, Map<String, dynamic>>> properties) async {
    try {
      Isar db = await isarDB;
      List<FilterCondition> filterConditions = [];
      List<SortProperty> sortProperties = [];
      for (Map<String, Map<String, dynamic>> property in properties) {
        if (property.entries.first.key.toLowerCase() == "filter") {
          switch (property.entries.first.value.entries.first.key) {
            case "layoutType":
              filterConditions.add(FilterCondition(
                type: FilterConditionType.equalTo,
                property: "layoutType",
                value1: property.entries.first.value.entries.first.value,
                include1: true,
                include2: false,
                caseSensitive: false,
              ));
              break;
            case "numGroup":
              filterConditions.add(FilterCondition(
                type: FilterConditionType.equalTo,
                property: "numGroup",
                value1: property.entries.first.value.entries.first.value,
                include1: true,
                include2: false,
                caseSensitive: false,
              ));
              break;
            case "filter":
              filterConditions.add(FilterCondition(
                type: FilterConditionType.equalTo,
                property: "filter",
                value1: property.entries.first.value.entries.first.value,
                include1: true,
                include2: false,
                caseSensitive: false,
              ));
              break;
            case "id":
              filterConditions.add(FilterCondition(
                type: FilterConditionType.equalTo,
                property: "id",
                value1: property.entries.first.value.entries.first.value,
                include1: true,
                include2: false,
                caseSensitive: false,
              ));
              break;
            default:
              break;
          }
        } else if (property.entries.first.key.toLowerCase() == "sort") {
          switch (property.entries.first.key) {
            case "layoutType":
              sortProperties.add(SortProperty(
                  property: 'layoutType',
                  sort: property.entries.first.value.entries.first.value));
              break;
            case "numGroup":
              sortProperties.add(SortProperty(
                  property: 'numGroup',
                  sort: property.entries.first.value.entries.first.value));
              break;
            case "filter":
              sortProperties.add(SortProperty(
                  property: 'filter',
                  sort: property.entries.first.value.entries.first.value));
              break;
            default:
              break;
          }
        }
      }
      List<Layout> layouts = await db.layouts
          .buildQuery<Layout>(
              filter: FilterGroup(
                  type: FilterGroupType.and, filters: filterConditions),
              sortBy: sortProperties)
          .findAll();
      return layouts;
    } catch (e, stacktrace) {
      logger.warning("$stacktrace: $e");
      return [];
    }
  }

  /// Update all given layouts
  Future<List<Layout?>?> updateLayouts(List<Layout> layouts) async {
    try {
      Isar db = await isarDB;
      List<int> ids = await db.layouts.putAll(layouts);
      return await db.layouts.getAll(ids);
    } catch (e, stacktrace) {
      logger.warning("$stacktrace: $e");
      return null;
    }
  }

  /// Deletes all layouts with the selected ids
  Future<int?> deleteLayouts(List<int> layoutIds) async {
    try {
      Isar db = await isarDB;
      int numDeleted = await db.widgetSettings.deleteAll(layoutIds);
      return numDeleted;
    } catch (e, stacktrace) {
      logger.warning("$stacktrace: $e");
      return null;
    }
  }
}

/// Instantiation of the DB class
/// TODO: change this to false once ready to publish
DB db = DB(logging: true);
