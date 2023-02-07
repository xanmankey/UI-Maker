import 'dart:io';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/ui_maker.dart';
import 'package:ui_maker/utils/logging.dart';
import 'package:ui_maker/utils/widget_types.dart';

/// A class for shared test utilities and mock data. Includes:
/// - isarInitialization and writing of a test database
/// - flutterWidgetBindings initialization for widget tests
/// - and easily accessible testing utilities among other things!
class TestUtils {
  late Future<Isar> isarDB;

  TestUtils() {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      isarDB = openDB();
      WidgetsFlutterBinding.ensureInitialized();
      writeTestDB();
    }
  }

  Future<Isar> openDB() async {
    late Isar isarDB;
    await Isar.initializeIsarCore(download: true);
    if (Isar.instanceNames.isEmpty) {
      isarDB = await Isar.open(
        [
          WidgetSettingsSchema,
          LayoutSchema,
        ],
        name: "testDB",
      );
    }
    return isarDB;
  }

  void writeTestDB() async {
    Map<String, WidgetSettings> widgetSettings = {
      "Checkbox ": WidgetSettings()
        ..title = "Checkbox"
        ..color = Colors.blue.value
        ..offsetX = 50
        ..offsetY = 100
        ..listviewNum = 0
        ..listviewIndex = 0
        ..widgetType = WidgetType.checkbox,
      "Textfield": WidgetSettings()
        ..title = "Textfield"
        ..color = Colors.red.value
        ..offsetX = 100
        ..offsetY = 200
        ..listviewNum = 0
        ..listviewIndex = 1
        ..widgetType = WidgetType.textField,
      "Disabled image": WidgetSettings()
        ..title = "Disabled image"
        ..enabled = false
        ..color = Colors.green.value
        ..offsetX = 150
        ..offsetY = 300
        ..listviewNum = 0
        ..listviewIndex = 2
        ..widgetType = WidgetType.imageSelector,
      "Card": WidgetSettings()
        ..title = "Card"
        ..color = Colors.red.value
        ..offsetX = 20
        ..offsetY = 300
        ..listviewNum = 1
        ..listviewIndex = 0
        ..widgetType = WidgetType.card,
      "Empty Card": WidgetSettings()
        ..title = "Empty Card"
        ..color = Colors.blue.value
        ..offsetX = 70
        ..offsetY = 300
        ..listviewNum = 1
        ..listviewIndex = 1
        ..widgetType = WidgetType.card,
      "Dropdown": WidgetSettings()
        ..title = "Dropdown"
        ..color = Colors.red.value
        ..offsetX = 110
        ..offsetY = 300
        ..listviewNum = 1
        ..listviewIndex = 2
        ..widgetType = WidgetType.dropdown,
      "Empty Dropdown": WidgetSettings()
        ..title = "Empty Dropdown"
        ..color = Colors.blue.value
        ..offsetX = 190
        ..offsetY = 300
        ..listviewNum = 1
        ..listviewIndex = 3
        ..widgetType = WidgetType.dropdown,
    };

    Map<String, Layout> layouts = {
      "listOneLayout": Layout()
        ..layoutName = "listOneLayout"
        ..widgets.addAll([
          for (WidgetSettings setting in widgetSettings.values)
            if (setting.listviewNum == 0) setting
        ])
        ..numGroups = 1
        ..width =
            MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width
        ..height = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .height,
      "allWidgetsLayout": Layout()
        ..layoutName = "allWidgetsLayout"
        ..widgets.addAll(
            [for (WidgetSettings setting in widgetSettings.values) setting])
        ..layoutType = LayoutType.rows
        ..numGroups = 2
        ..width =
            MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width
        ..height = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .height,
      "emptyLayout": Layout()
        ..layoutName = "emptyLayout"
        ..layoutType = LayoutType.none
        ..numGroups = 0
        ..width =
            MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width
        ..height = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .height,
    };
    // Write test data
    // No error handling; if this function fails, TESTS FAIL
    Isar db = await isarDB;
    await db.writeTxn(() async {
      await db.widgetSettings.putAll(
          [for (WidgetSettings setting in widgetSettings.values) setting]);
      await db.layouts.putAll([for (Layout layout in layouts.values) layout]);
    });
  }
}

TestUtils testUtils = TestUtils();
