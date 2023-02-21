import 'dart:io';

import 'package:contextmenu/contextmenu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:ui_maker/ui_maker.dart';
import 'package:ui_maker/app/utils/menu_options.dart';
import 'package:ui_maker/logging.dart';

/// A class for shared test utilities and mock data. Includes:
/// - isarInitialization and writing of a test database
/// - flutterWidgetBindings initialization for widget tests
/// - and easily accessible testing utilities among other things!
/// DO NOT EDIT (you can add) ANY OF THIS TEST DATA UNLESS YOU ALSO PLAN ON CHANGING
/// ASSOCIATED TESTS
class TestUtils {
  late Future<Isar> isarDB;

  static final WidgetSettings checkbox = WidgetSettings(
    title: WidgetNames.checkbox.name,
    color: Colors.blue.value,
    offsetX: 50,
    offsetY: 100,
    listviewNum: 0,
    listviewIndex: 0,
    widgetType: WidgetType.checkbox,
  );

  static final WidgetSettings textField = WidgetSettings(
    title: WidgetNames.textfield.name,
    color: Colors.red.value,
    offsetX: 100,
    offsetY: 200,
    listviewNum: 0,
    listviewIndex: 1,
    widgetType: WidgetType.textField,
  );

  static final WidgetSettings image = WidgetSettings(
    title: WidgetNames.image.name,
    color: Colors.green.value,
    offsetX: 150,
    offsetY: 300,
    listviewNum: 0,
    listviewIndex: 2,
    widgetType: WidgetType.imageSelector,
  );

  static final WidgetSettings card = WidgetSettings(
    title: WidgetNames.card.name,
    color: Colors.red.value,
    offsetX: 20,
    offsetY: 300,
    listviewNum: 1,
    listviewIndex: 0,
    widgetType: WidgetType.card,
  )..widgets.addAll(
      [checkbox, textField, image],
    );

  static final WidgetSettings emptyCard = WidgetSettings(
    title: WidgetNames.emptyCard.name,
    color: Colors.blue.value,
    offsetX: 70,
    offsetY: 300,
    listviewNum: 1,
    listviewIndex: 1,
    widgetType: WidgetType.card,
  );

  static final WidgetSettings dropdown = WidgetSettings(
    title: WidgetNames.dropdown.name,
    color: Colors.red.value,
    offsetX: 110,
    offsetY: 300,
    listviewNum: 1,
    listviewIndex: 2,
    widgetType: WidgetType.dropdown,
    mapValues: {
      WidgetSettingsKeys.items.name: [0, 1, 2],
    },
  );

  static final WidgetSettings emptyDropdown = WidgetSettings(
    title: WidgetNames.emptyDropdown.name,
    color: Colors.blue.value,
    offsetX: 190,
    offsetY: 300,
    listviewNum: 1,
    listviewIndex: 3,
    widgetType: WidgetType.dropdown,
  );

  static Map<String, WidgetSettings> widgetSettings = {
    checkbox.title: checkbox,
    textField.title: textField,
    image.title: image,
    card.title: card,
    emptyCard.title: emptyCard,
    dropdown.title: dropdown,
    emptyDropdown.title: emptyDropdown,
  };

  static Layout listOneLayout = Layout(
    layoutName: LayoutNames.listOneLayout.name,
    numGroups: 1,
    width: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width,
    height:
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height,
  )..widgets.addAll([
      for (WidgetSettings setting in widgetSettings.values)
        if (setting.listviewNum == 0) setting
    ]);

  static Layout allWidgetsLayout = Layout(
    layoutName: LayoutNames.allWidgetsLayout.name,
    layoutType: LayoutType.rows,
    numGroups: 2,
    width: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width,
    height:
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height,
  )..widgets
      .addAll([for (WidgetSettings setting in widgetSettings.values) setting]);

  static Layout emptyLayout = Layout(
    layoutName: LayoutNames.emptyLayout.name,
    layoutType: LayoutType.none,
    numGroups: 0,
    width: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width,
    height:
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height,
  );

  static Map<String, Layout> layouts = {
    listOneLayout.layoutName: listOneLayout,
    allWidgetsLayout.layoutName: allWidgetsLayout,
    emptyLayout.layoutName: emptyLayout,
  };

  static Map<String, Widget> widgets = {
    for (WidgetSettings settings in widgetSettings.values)
      settings.title: generateWidgets([settings], allWidgetsLayout)[0]
  };

  TestUtils() {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      isarDB = openDB();
      setUpAll(() async {
        await testUtils.ensureInitialized();
      });
    }
  }

  Future<void> ensureInitialized() async {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      await Isar.initializeIsarCore(download: true);
      WidgetsFlutterBinding.ensureInitialized();
      await writeTestDB();
      // Pumping, unfortunately, will have to be handled on a group-by-group
      // or test-by-test basis
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
      db.widgetSettings.putAll(
          [for (WidgetSettings setting in widgetSettings.values) setting]);
      db.layouts.putAll([for (Layout layout in layouts.values) layout]);
    });
  }
}

TestUtils testUtils = TestUtils();

/// An abstract class for easily creating context menu tests
abstract class ContextMenuTests {
  /// A utility method for finding a Text widget via a String
  bool matchByString(Widget widget, String string) {
    if (widget is Text && widget.data == string) {
      return true;
    }
    return false;
  }

  Future<void> pumpWidget(WidgetTester widgetTester);

  /// Tests called before all context menu tests;
  /// ensures that the widget exists and the context menu can be opened.
  /// Note that in the context menu tests, finder is the Finder code
  /// for locating the desired widget to be tested
  Future<void> contextMenuTest<T>(
      WidgetTester widgetTester, Finder finder) async {
    // Push the base widget
    await pumpWidget(widgetTester);
    // A test for checking if the creator context menu (CCM)
    // appears with a right click
    expect(finder.evaluate().first.widget, isInstanceOf<T>());
    // test('check for context menu', () async {
    // Tap loaded widget with right mouse click button
    await widgetTester.tap(
      finder,
      buttons: kSecondaryMouseButton,
    );
    await widgetTester.pumpAndSettle();
    // Check if the Context Menu is visible
    expect(find.byType(ContextMenuArea), findsOneWidget);
  }

  // Checks for the new color set by the user
  void expectNewUIColor<T>(WidgetTester widgetTester, Finder finder);

  Future<void> colorSetUp<T>(WidgetTester widgetTester, Finder finder) async {
    // Open the context menu
    await contextMenuTest<T>(widgetTester, finder);
    // Select the color context menu option
    await widgetTester.tap(find.descendant(
        of: find.byType(ListTile),
        matching: find.byWidgetPredicate(
            (widget) => matchByString(widget, MenuOptions.color.name))));
    await widgetTester.pumpAndSettle();
    expect(find.byType(ColorPicker), findsOneWidget);
    // Select the red color option
    // debugDumpApp();
    // debugDumpRenderTree();
    // I believe the default color_picker is an HSV color picture;
    // given this, I'll probably just use the default color
    await widgetTester.tap(find.byWidgetPredicate(
        (widget) => widget is ColorPickerInput && widget.color == Colors.red));
    await widgetTester.pumpAndSettle();
    expect(find.byType(ColorPickerInput), findsNothing);
  }

  void colorTest<T>(Finder finder, WidgetSettings widgetSetting) {
    testWidgets("Check UI after color change",
        (WidgetTester widgetTester) async {
      await colorSetUp<T>(widgetTester, finder);
      // Check if widget color is red in UI
      // This method needs to be implemented on a case-by-case basis
      // due to the nature of typing in dart (+ probably my lack of
      // knowledge about the nature of typing in dart)
      expectNewUIColor(widgetTester, finder);
    });
    testWidgets('Check database after color change',
        (WidgetTester widgetTester) async {
      await colorSetUp<T>(widgetTester, finder);
      // Check if widget color is red in database
      List<WidgetSettings> newData = await db.getWidgetSettings([
        {
          "filter": {"title": widgetSetting.title}
        }
      ]);
      expect(newData.first.color, Colors.red.hashCode);
    });
  }

  // Checks for the color after the widget is disabled
  void expectNewDisableColor<T>(WidgetTester widgetTester, Finder finder);

  Future<void> disableSetUp<T>(WidgetTester widgetTester, Finder finder) async {
    // Open the context menu
    await contextMenuTest<T>(widgetTester, finder);
    // Select the disable option
    // test('Select disable option', () async {
    // Select the color context menu
    await widgetTester.tap(find.descendant(
        of: find.byType(ListTile),
        matching: find.byWidgetPredicate(
            (widget) => matchByString(widget, MenuOptions.disable.name))));
    await widgetTester.pump();
    // });
  }

  void disableTest<T>(Finder finder, WidgetSettings widgetSetting) {
    testWidgets("Check UI after disable", (widgetTester) async {
      disableSetUp<T>(widgetTester, finder);
      expectNewDisableColor(widgetTester, finder);
    });
    // For checking if the widget is being disabled correctly
    testWidgets('Check database after disable', (widgetTester) async {
      disableSetUp<T>(widgetTester, finder);
      // Check if widget color is red in database
      List<WidgetSettings> newData = await db.getWidgetSettings([
        {
          "filter": {"title": widgetSetting.title}
        }
      ]);
      expect(newData.first.enabled, false);
    });
  }

  // Checks for the color after the widget is enabled
  void expectNewEnableColor<T>(WidgetTester widgetTester, Finder finder);

  Future<void> enableSetUp<T>(WidgetTester widgetTester, Finder finder) async {
    // Open the context menu
    await contextMenuTest<T>(widgetTester, finder);
    // Select the enable option
    // test('Select enable option', () async {
    // Select the color context menu
    await widgetTester.tap(find.descendant(
        of: find.byType(ListTile),
        matching: find.byWidgetPredicate(
            (widget) => matchByString(widget, MenuOptions.enable.name))));
    await widgetTester.pump();
    // });
  }

  void enableTest<T>(Finder finder, WidgetSettings widgetSetting) {
    testWidgets("Check UI after enable", (widgetTester) async {
      await enableSetUp<T>(widgetTester, finder);
      expectNewEnableColor(widgetTester, finder);
    });
    // For checking if the widget is being enabled correctly
    testWidgets('Check database after enable',
        (WidgetTester widgetTester) async {
      await enableSetUp<T>(widgetTester, finder);
      // Check if widget color is red in database
      List<WidgetSettings> newData = await db.getWidgetSettings([
        {
          "filter": {"title": widgetSetting.title}
        }
      ]);
      expect(newData.first.enabled, true);
    });
  }

  // Checks for no widgets
  void expectDelete<T>(WidgetTester widgetTester, Finder finder);

  Future<void> deleteSetUp<T>(WidgetTester widgetTester, Finder finder) async {
    // Open the context menu
    await contextMenuTest<T>(widgetTester, finder);
    // Select the delete option
    await widgetTester.tap(find.descendant(
        of: find.byType(ListTile),
        matching: find.byWidgetPredicate(
            (widget) => matchByString(widget, MenuOptions.delete.name))));
    await widgetTester.pump();
    // Select the delete option in the dialog
    await widgetTester.tap(
      find.byType(IconButton),
    );
    await widgetTester.pump();
  }

  void deleteTest<T>(Finder finder, WidgetSettings widgetSetting) {
    testWidgets("Check UI after delete", (widgetTester) async {
      await deleteSetUp(widgetTester, finder);
      expectDelete(widgetTester, finder);
    });
    // For checking if the widget is being disabled correctly
    testWidgets('Check database after delete',
        (WidgetTester widgetTester) async {
      await deleteSetUp(widgetTester, finder);
      // Check if widget color is red in database
      List<WidgetSettings> newData = await db.getWidgetSettings([
        {
          "filter": {"title": widgetSetting.title}
        }
      ]);
      expect(newData.isEmpty, true);
    });
  }

  // Just want to say, this is honestly so cool that functions have specific
  // types and you can iterate over a list of them and call each one
  // Plus, when combined w/ an abstract function you can decide later
  // which tests you want to run
  // late List<Function(WidgetTester widgetTester, Finder finder)> tests;
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
