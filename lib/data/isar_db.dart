import 'package:isar/isar.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:logging/logging.dart';

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
///       logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
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
///       logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
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
///       logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
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
///       logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
///       return null;
///     }
///   }
// }
/// ```
class DB {
  late Future<Isar> isarDB;
  Logger logger = Logger('data');

  DB() {
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

  /// Retrieve widget(s) by a widget index value
  /// TODO: I would like to allow for indexes to be added to this check here
  /// e.g. the user wants to add a new sortable index, and that value is checked
  /// against here
  Future<List<WidgetSettings>> getWidgetSettings(
      Map<String, dynamic> index) async {
    try {
      Isar db = await isarDB;
      switch (index.entries.first.key) {
        case "title":
          return await db.widgetSettings
              .filter()
              .titleStartsWith(index.entries.first.value)
              .findAll();
        case "widgetType":
          return await db.widgetSettings
              .filter()
              .widgetTypeEqualTo(index.entries.first.value)
              .findAll();
        case "color":
          return await db.widgetSettings
              .filter()
              .colorEqualTo(index.entries.first.value)
              .findAll();
        case "id":
          return await db.widgetSettings
              .filter()
              .idEqualTo(index.entries.first.value)
              .findAll();
        default:
          return [];
      }
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return [];
    }
  }

  /// Returns a sorted list based on specified widgetSettings indexes
  /// This is primarily a SORTING function
  Future<List<WidgetSettings>> getWidgetSettingsList(
      List<Map<String, Sort>> indexes) async {
    try {
      Isar db = await isarDB;
      // Default case; sort by id
      if (indexes.isEmpty) {
        List<WidgetSettings> widgetSettings =
            await db.widgetSettings.where().findAll();
        return widgetSettings;
      }
      // Building a dynamic query to execute based on the user sorting preferences
      List<SortProperty> sortProperties = [];
      for (Map<String, Sort> index in indexes) {
        switch (index.entries.first.key) {
          case "title":
            sortProperties.add(SortProperty(
                property: 'title', sort: index.entries.first.value));
            break;
          case "widgetType":
            sortProperties.add(SortProperty(
                property: 'widgetType', sort: index.entries.first.value));
            break;
          case "color":
            sortProperties.add(SortProperty(
                property: 'color', sort: index.entries.first.value));
            break;
          default:
            break;
        }
      }
      List<WidgetSettings> widgetSettings = await db.widgetSettings
          .buildQuery<WidgetSettings>(sortBy: sortProperties)
          .findAll();
      return widgetSettings;
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
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
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
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
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return null;
    }
  }

  /// Retrieve layout by a layout index value
  Future<List<Layout>> getLayout(Map<String, dynamic> index) async {
    try {
      Isar db = await isarDB;
      switch (index.entries.first.key) {
        case "layoutType":
          return await db.layouts
              .filter()
              .layoutTypeEqualTo(index.entries.first.value)
              .findAll();
        case "numGroup":
          return await db.layouts
              .filter()
              .numGroupsEqualTo(index.entries.first.value)
              .findAll();
        case "filter":
          return await db.layouts
              .filter()
              .filterEqualTo(index.entries.first.value)
              .findAll();
        case "id":
          return await db.layouts
              .filter()
              .idEqualTo(index.entries.first.value)
              .findAll();
        default:
          return [];
      }
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return [];
    }
  }

  /// Returns a sorted list based on specified layout indexes
  /// This is primarily a SORTING function
  Future<List<Layout>> getLayoutList(List<Map<String, Sort>> indexes) async {
    try {
      Isar db = await isarDB;
      // Default case; sort by id
      if (indexes.isEmpty) {
        List<Layout> layouts = await db.layouts.where().findAll();
        return layouts;
      }
      // Building a dynamic query to execute based on the user sorting preferences
      List<SortProperty> sortProperties = [];
      for (Map<String, Sort> index in indexes) {
        switch (index.entries.first.key) {
          case "layoutType":
            sortProperties.add(SortProperty(
                property: 'layoutType', sort: index.entries.first.value));
            break;
          case "numGroup":
            sortProperties.add(SortProperty(
                property: 'numGroup', sort: index.entries.first.value));
            break;
          case "filter":
            sortProperties.add(SortProperty(
                property: 'filter', sort: index.entries.first.value));
            break;
          default:
            break;
        }
      }
      List<Layout> layouts =
          await db.layouts.buildQuery<Layout>(sortBy: sortProperties).findAll();
      return layouts;
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
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
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
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
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return null;
    }
  }
}

/// Instantiation of the DB class
DB db = DB();
