import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget.dart';
import 'package:isar/isar.dart';
import 'package:ui_maker/data/isar_db.dart';

/// A class for handling the sorting of the widgets in a CreatorArea
class SortTypes {
  /// Sorts the provided widgets by the given index
  Future<List<Widget>> sortWidgets(SortTypesEnum sortType, Id layoutId) async {
    // Fetch db and layout from db
    Isar isarDB = await db.isarDB;
    Layout? layout =
        await isarDB.layouts.where().idEqualTo(layoutId).findFirst();
    assert(layout != null);
    switch (sortType) {
      case SortTypesEnum.title:
        return await isarDB.widgets.where().sortByTitleDesc().findAll();
      case SortTypesEnum.color:
        return await isarDB.widgets.where().sortByColor().findAll();
      case SortTypesEnum.widgetType:
        return await isarDB.widgets.where().sortByWidgetType().findAll();
    }
  }

  Future<List<Widget>> filterWidgets(
      SortTypesEnum sortType, Id layoutId, dynamic value) async {
    // Fetch db
    Isar isarDB = await db.isarDB;
    Layout? layout =
        await isarDB.layouts.where().idEqualTo(layoutId).findFirst();
    assert(layout != null);
    switch (sortType) {
      case SortTypesEnum.title:
        return await layout!.widgets.filter().titleEqualTo(value).findAll();
      case SortTypesEnum.color:
        return await layout!.widgets.filter().colorEqualTo(value).findAll();
      case SortTypesEnum.widgetType:
        return await layout!.widgets
            .filter()
            .widgetTypeEqualTo(value)
            .findAll();
    }
  }
}

enum SortTypesEnum {
  title,
  color,
  widgetType;
}
