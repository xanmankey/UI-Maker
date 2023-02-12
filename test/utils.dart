import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:flutter/services.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/ui_maker.dart';
import 'package:ui_maker/utils/logging.dart';
import 'package:ui_maker/utils/widget_types.dart';
import '../examples/prebuilt_UI.dart';
import 'package:ui_maker/app/widgets/creator_context_menu.dart';
import 'package:ui_maker/app/utils/menu_options.dart';

/// A class for shared test utilities and mock data. Includes:
/// - isarInitialization and writing of a test database
/// - flutterWidgetBindings initialization for widget tests
/// - and easily accessible testing utilities among other things!
/// DO NOT EDIT (you can add) ANY OF THIS TEST DATA UNLESS YOU ALSO PLAN ON CHANGING
/// ASSOCIATED TESTS
class TestUtils {
  late Future<Isar> isarDB;

  static WidgetSettings checkbox = WidgetSettings()
    ..title = WidgetNames.checkbox.toString()
    ..color = Colors.blue.value
    ..offsetX = 50
    ..offsetY = 100
    ..listviewNum = 0
    ..listviewIndex = 0
    ..widgetType = WidgetType.checkbox;
  static WidgetSettings textField = WidgetSettings()
    ..title = WidgetNames.textfield.toString()
    ..color = Colors.red.value
    ..offsetX = 100
    ..offsetY = 200
    ..listviewNum = 0
    ..listviewIndex = 1
    ..widgetType = WidgetType.textField;
  static WidgetSettings image = WidgetSettings()
    ..title = WidgetNames.image.toString()
    ..color = Colors.green.value
    ..offsetX = 150
    ..offsetY = 300
    ..listviewNum = 0
    ..listviewIndex = 2
    ..widgetType = WidgetType.imageSelector;
  static WidgetSettings card = WidgetSettings()
    ..title = WidgetNames.card.toString()
    ..color = Colors.red.value
    ..offsetX = 20
    ..offsetY = 300
    ..listviewNum = 1
    ..listviewIndex = 0
    ..widgetType = WidgetType.card
    ..widgets.addAll([checkbox, textField, image]);
  static WidgetSettings emptyCard = WidgetSettings()
    ..title = WidgetNames.emptyCard.toString()
    ..color = Colors.blue.value
    ..offsetX = 70
    ..offsetY = 300
    ..listviewNum = 1
    ..listviewIndex = 1
    ..widgetType = WidgetType.card;
  static WidgetSettings dropdown = WidgetSettings()
    ..title = WidgetNames.dropdown.toString()
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
    ..title = WidgetNames.emptyDropdown.toString()
    ..color = Colors.blue.value
    ..offsetX = 190
    ..offsetY = 300
    ..listviewNum = 1
    ..listviewIndex = 3
    ..widgetType = WidgetType.dropdown;

  static Map<String, WidgetSettings> widgetSettings = {
    checkbox.title: checkbox,
    textField.title: textField,
    image.title: image,
    card.title: card,
    emptyCard.title: emptyCard,
    dropdown.title: dropdown,
    emptyDropdown.title: emptyDropdown,
  };

  static Layout listOneLayout = Layout()
    ..layoutName = LayoutNames.listOneLayout.toString()
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
    ..layoutName = LayoutNames.allWidgetsLayout.toString()
    ..widgets
        .addAll([for (WidgetSettings setting in widgetSettings.values) setting])
    ..layoutType = LayoutType.rows
    ..numGroups = 2
    ..width =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width
    ..height =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;

  static Layout emptyLayout = Layout()
    ..layoutName = LayoutNames.emptyLayout.toString()
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

/// An abstract class for easily creating various creator tests
/// NOTE that I'm not sure how testing in Isar works; but I'm only
/// checking for specific values at a time, so it should be fine
abstract class Tests {
  bool matchByString(Widget widget, String string) {
    if (widget is Text && widget.data == string) {
      return true;
    }
    return false;
  }

  /// In the context menu tests, finder is the Finder code
  /// for locating the desired widget to be tested
  void contextMenuTest<T>(WidgetTester tester, Finder finder) {
    // A test for checking if the creator context menu (CCM)
    // appears with a right click
    group('Initial tests', () {
      test('check for correct widget type', () async {
        expect(finder.evaluate().first, isInstanceOf<T>());
      });
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
    });
  }

  // Checks for the new color set by the user
  void testNewUIColor<T>(WidgetTester tester, Finder finder);

  void colorTest<T>(
      WidgetTester tester, Finder finder, WidgetSettings widgetSetting) {
    // A test for checking if the widget color changes correctly
    // via creator context menu
    group('Check color changing', () {
      // If setUp fails, the tests won't be called
      // setUp takes care of opening the context menu
      setUp(() {
        // Open the context menu
        contextMenuTest<T>(tester, finder);
        // Select the color option
        test('Select color option', () async {
          // Select the color context menu
          await tester.tap(find.descendant(
              of: find.byType(ListTile),
              matching: find.byWidgetPredicate(
                  (widget) => matchByString(widget, MenuOptions.color.name))));
          await tester.pump();

          // Check if the Color Picker is visible
          expect(find.byType(ColorPicker), findsOneWidget);
        });
      });
      test('Check UI and database after color change', () async {
        // TODO: not sure if ColorPickerInput is exactly what I need to tap here
        // I'll need to examine the widget tree myself
        await tester.tap(find.byWidgetPredicate((widget) =>
            widget is ColorPickerInput && widget.color == Colors.red));
        await tester.pump();

        // Check if widget color is red in UI
        // This method needs to be implemented on a case-by-case basis
        // due to the nature of typing in dart (+ probably my lack of
        // knowledge about the nature of typing in dart)
        testNewUIColor(tester, finder);
        // Check if widget color is red in database
        Isar isarDB = await testUtils.isarDB;
        List<WidgetSettings> newData = await db.getWidgetSettings([
          {
            "filter": {"title": widgetSetting.title}
          }
        ]);
        expect(newData.first.color, Colors.red.hashCode);
      });
    });
  }

  // Checks for the color after the widget is disabled
  void testNewDisableColor<T>(WidgetTester tester, Finder finder);

  void disableTest<T>(
      WidgetTester tester, Finder finder, WidgetSettings widgetSetting) {
    // A group of tests for checking if the widget is being disabled
    // correctly
    group('Try to disable the widget', () {
      setUp(() {
        // Open the context menu
        contextMenuTest<T>(tester, finder);
        // Select the disable option
        test('Select disable option', () async {
          // Select the color context menu
          await tester.tap(find.descendant(
              of: find.byType(ListTile),
              matching: find.byWidgetPredicate((widget) =>
                  matchByString(widget, MenuOptions.disable.name))));
          await tester.pump();
        });
      });
      test('Check UI and database after disable', () async {
        testNewDisableColor(tester, finder);
        // Check if widget color is red in database
        Isar isarDB = await testUtils.isarDB;
        List<WidgetSettings> newData = await db.getWidgetSettings([
          {
            "filter": {"title": widgetSetting.title}
          }
        ]);
        expect(newData.first.enabled, false);
      });
    });
  }

  // Checks for the color after the widget is enabled
  void testNewEnableColor<T>(WidgetTester tester, Finder finder);

  void enableTest<T>(
      WidgetTester tester, Finder finder, WidgetSettings widgetSetting) {
    // A group of tests for checking if the widget is being disabled
    // correctly
    group('Try to enable the widget', () {
      setUp(() {
        // Open the context menu
        contextMenuTest<T>(tester, finder);
        // Select the enable option
        test('Select enable option', () async {
          // Select the color context menu
          await tester.tap(find.descendant(
              of: find.byType(ListTile),
              matching: find.byWidgetPredicate(
                  (widget) => matchByString(widget, MenuOptions.enable.name))));
          await tester.pump();
        });
      });
      test('Check UI and database after enable', () async {
        testNewEnableColor(tester, finder);
        // Check if widget color is red in database
        Isar isarDB = await testUtils.isarDB;
        List<WidgetSettings> newData = await db.getWidgetSettings([
          {
            "filter": {"title": widgetSetting.title}
          }
        ]);
        expect(newData.first.enabled, true);
      });
    });
  }

  // Checks for no widgets
  void testDelete<T>(WidgetTester tester, Finder finder);

  void deleteTest<T>(
      WidgetTester tester, Finder finder, WidgetSettings widgetSetting) {
    // A group of tests for checking if the widget is being disabled
    // correctly
    group('Try to delete the widget', () {
      setUp(() {
        // Open the context menu
        contextMenuTest<T>(tester, finder);
        // Select the delete option
        test('Select delete option', () async {
          await tester.tap(find.descendant(
              of: find.byType(ListTile),
              matching: find.byWidgetPredicate(
                  (widget) => matchByString(widget, MenuOptions.enable.name))));
          await tester.pump();
        });
        test('Select delete option in dialog', () async {
          await tester.tap(
            find.byType(IconButton),
          );
          await tester.pump();
        });
      });
      test('Check UI and database after enable', () async {
        testDelete(tester, finder);
        // Check if widget color is red in database
        Isar isarDB = await testUtils.isarDB;
        List<WidgetSettings> newData = await db.getWidgetSettings([
          {
            "filter": {"title": widgetSetting.title}
          }
        ]);
        expect(newData.isEmpty, true);
      });
    });
  }

  // Just want to say, this is honestly so cool that functions have specific
  // types and you can iterate over a list of them and call each one
  // Plus, when combined w/ an abstract function you can decide later
  // which tests you want to run
  late List<Function> tests;
}

enum WidgetNames {
  checkbox,
  textfield,
  image,
  card,
  emptyCard,
  dropdown,
  emptyDropdown;
}

enum LayoutNames {
  listOneLayout,
  allWidgetsLayout,
  emptyLayout;
}
