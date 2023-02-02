import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/data/isar_db.dart';

/// An InheritedWidget responsible for updating the database on the backend
/// with widget data. Also passes down one database for all the widgets to use
/// Ultimately, the creator tree should look like this:
/// ```CreatorUpdater``` -> ```CreatorBase``` -> ```YourWidget```
/// ```CreatorUpdater``` doesn't need to be instantiated by default however,
/// as it is wrapped as a part of the ```CreatorArea``` widget
class CreatorUpdater extends InheritedWidget {
  Future<Isar> isarDB;
  CreatorUpdater({
    required super.child,
    super.key,
  }) : isarDB = db.isarDB;

  // TODO: never used an inherited widget before, not sure if this is what's
  // going on
  static CreatorUpdater? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CreatorUpdater>();
  }

  @override
  bool updateShouldNotify(CreatorUpdater oldWidget) {
    return widgetSetting != oldWidget.widgetSetting;
  }
}
