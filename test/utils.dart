import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:native_context_menu/native_context_menu.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/ui_maker.dart';
import 'package:ui_maker/utils/logging.dart';
import 'package:ui_maker/utils/widget_types.dart';
import '../examples/prebuilt_UI.dart';
import 'package:ui_maker/app/widgets/creator_context_menu.dart';

/// A class for shared test utilities and mock data. Includes:
/// - isarInitialization and writing of a test database
/// - flutterWidgetBindings initialization for widget tests
/// - and easily accessible testing utilities among other things!
/// DO NOT EDIT (you can add) ANY OF THIS TEST DATA UNLESS YOU ALSO PLAN ON CHANGING
/// ASSOCIATED TESTS
class TestUtils {
  late Future<Isar> isarDB;

  static WidgetSettings checkbox = WidgetSettings()
    ..title = widgetNames.checkbox.toString()
    ..color = Colors.blue.value
    ..offsetX = 50
    ..offsetY = 100
    ..listviewNum = 0
    ..listviewIndex = 0
    ..widgetType = WidgetType.checkbox;
  static WidgetSettings textField = WidgetSettings()
    ..title = widgetNames.textfield.toString()
    ..color = Colors.red.value
    ..offsetX = 100
    ..offsetY = 200
    ..listviewNum = 0
    ..listviewIndex = 1
    ..widgetType = WidgetType.textField;
  static WidgetSettings disabledImage = WidgetSettings()
    ..title = widgetNames.disabledImage.toString()
    ..enabled = false
    ..color = Colors.green.value
    ..offsetX = 150
    ..offsetY = 300
    ..listviewNum = 0
    ..listviewIndex = 2
    ..widgetType = WidgetType.imageSelector;
  static WidgetSettings card = WidgetSettings()
    ..title = widgetNames.card.toString()
    ..color = Colors.red.value
    ..offsetX = 20
    ..offsetY = 300
    ..listviewNum = 1
    ..listviewIndex = 0
    ..widgetType = WidgetType.card
    ..widgets.addAll([checkbox, textField, disabledImage]);
  static WidgetSettings emptyCard = WidgetSettings()
    ..title = widgetNames.emptyCard.toString()
    ..color = Colors.blue.value
    ..offsetX = 70
    ..offsetY = 300
    ..listviewNum = 1
    ..listviewIndex = 1
    ..widgetType = WidgetType.card;
  static WidgetSettings dropdown = WidgetSettings()
    ..title = widgetNames.dropdown.toString()
    ..color = Colors.red.value
    ..offsetX = 110
    ..offsetY = 300
    ..listviewNum = 1
    ..listviewIndex = 2
    ..widgetType = WidgetType.dropdown
    ..mapValues = {
      WidgetSettingsKeys.items.name: [0, 1, 2]
    };
  static WidgetSettings emptyDropdown = WidgetSettings()
    ..title = widgetNames.emptyDropdown.toString()
    ..color = Colors.blue.value
    ..offsetX = 190
    ..offsetY = 300
    ..listviewNum = 1
    ..listviewIndex = 3
    ..widgetType = WidgetType.dropdown;

  static Map<String, WidgetSettings> widgetSettings = {
    checkbox.title: checkbox,
    textField.title: textField,
    disabledImage.title: disabledImage,
    card.title: card,
    emptyCard.title: emptyCard,
    dropdown.title: dropdown,
    emptyDropdown.title: emptyDropdown,
  };

  static Layout listOneLayout = Layout()
    ..layoutName = layoutNames.listOneLayout.toString()
    ..widgets.addAll([
      for (WidgetSettings setting in widgetSettings.values)
        if (setting.listviewNum == 0) setting
    ])
    ..numGroups = 1
    ..width =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width
    ..height =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;

  static Layout allWidgetsLayout = Layout()
    ..layoutName = layoutNames.allWidgetsLayout.toString()
    ..widgets
        .addAll([for (WidgetSettings setting in widgetSettings.values) setting])
    ..layoutType = LayoutType.rows
    ..numGroups = 2
    ..width =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width
    ..height =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;

  static Layout emptyLayout = Layout()
    ..layoutName = layoutNames.emptyLayout.toString()
    ..layoutType = LayoutType.none
    ..numGroups = 0
    ..width =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width
    ..height =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;

  static Map<String, Layout> layouts = {
    listOneLayout.layoutName: listOneLayout,
    allWidgetsLayout.layoutName: allWidgetsLayout,
    emptyLayout.layoutName: emptyLayout,
  };

  static Map<String, Widget> widgets = {};

  TestUtils() {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      isarDB = openDB();
    }
  }

  Future<void> ensureInitialized() async {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      await Isar.initializeIsarCore(download: true);
      WidgetsFlutterBinding.ensureInitialized();
      await writeTestDB();
      for (WidgetSettings settings in widgetSettings.values) {
        widgets.addAll({
          settings.title: generateWidgets([settings], allWidgetsLayout)[0]
        });
      }
      // Pumping, unfortunately, will have to be handled on a group-by-group
      // or widget-by-widget basis
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

  Future<void> writeTestDB() async {
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

class Tests {
  static void contextMenuTest(WidgetTester tester, Finder finder) {
    // A test for checking if the creator context menu (CCM)
    // appears with a right click
    test('check for context menu', () async {
      // Tap loaded widget with right mouse click button
      await tester.tap(
        finder,
        buttons: kSecondaryMouseButton,
      );
      await tester.pump();
      // Check if the CCM is visible
      expect(find.byType(CreatorContextMenu), findsOneWidget);
    });
  }

  static void colorTest(WidgetTester tester, Finder finder) {
    // A test for checking if the widget color changes correctly
    // via creator context menu
    test('check color changing', () async {
      // Tap loaded widget with right mouse click button
      await tester.tap(
        finder,
        buttons: kSecondaryMouseButton,
      );
      await tester.pump();
      // TODO: I need to somehow press the buttons of the context menu
      // But the issue with that is that MenuItem is NOT a widget;
      // I need to do something similar to selecting an item from a dropdown widget
      final colorLocation = tester.getCenter(find.byWidget());
      await tester.tapAt();

      // Check if the CCM is visible
      expect(find.byType(CreatorContextMenu), findsOneWidget);
    });
  }

  static void disableTest(WidgetTester tester, Finder finder) {
    // A group of tests for checking if the widget is being disabled
    // correctly
    group('description', () {
      test('description', () => null);
      test('description', () => null);
    });
  }

  static void enableTest(WidgetTester tester, Finder finder) {
    // See above, but for enabling
    group('description', () {
      test('description', () => null);
      test('description', () => null);
    });
  }

  static void deleteTest(WidgetTester tester, Finder finder) {
    // For verifying that a widget is deleted correctly
    // and that the widget is removed
    test('description', () => null);
  }

  // Just want to say, this is honestly so cool that functions have specific
  // types and you can iterate over a list of them and call each one
  static List<Function> tests = [
    contextMenuTest,
    colorTest,
    disableTest,
    enableTest,
    deleteTest,
  ];
}

enum widgetNames {
  checkbox,
  textfield,
  disabledImage,
  card,
  emptyCard,
  dropdown,
  emptyDropdown;
}

enum layoutNames {
  listOneLayout,
  allWidgetsLayout,
  emptyLayout;
}
