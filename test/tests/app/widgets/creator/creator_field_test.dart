import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_maker/ui_maker.dart';
// import 'package:test/test.dart';

import '../../../../utils.dart';

/// TESTS SHOULD:
/// - Check all parameters
/// - Check rendering (if applicable)
/// - Mock data for simulation (if applicable)
/// - GIVE THE USER FAITH IN THE CODE

/// Widget tests will need to be sorted into two categories:
/// 1. WIDGET TESTS
///   - Do the widgets change state correctly (e.g. creator context menu + other tests)
///   - Do the widgets preserve and update information correctly (w/ regards to db)
/// 2. LAYOUT (SCREEN) TESTS
///   - Do they sort correctly (including a lack of sorting)?
///   - Do they filter correctly?
///   - Do they drag/drop correctly (and write to the db accordingly)?

// TODO: I'd like to rework fields to only allow one kind of draggable field
// (and pass the keyboard input type as a parameter)
// I'd also need to rework this test

void main() {
  setUpAll(() async {
    await testUtils.ensureInitialized();
  });
  group('''`CreatorField(); Layout layout = TestUtils.emptyLayout??, 
        WidgetSettings widgetSetting = TestUtils.numField`''', () {
    testWidgets('Sort', (WidgetTester tester) async {
      await tester.pumpWidget(TestUtils.widgets[WidgetNames.textfield.name]!);
      UnimplementedError();
      return Future.value(null);
    });
    testWidgets('Filter', (WidgetTester tester) async {
      await tester.pumpWidget(TestUtils.widgets[WidgetNames.textfield.name]!);
      UnimplementedError();
      return Future.value(null);
    });
    testWidgets('Drag/Drop', (WidgetTester tester) async {
      await tester.pumpWidget(TestUtils.widgets[WidgetNames.textfield.name]!);
      UnimplementedError();
      return Future.value(null);
    });
    group("Context Menu State Changes", () {
      UnimplementedError();
    });
    testWidgets('Check db and UI on input', (WidgetTester tester) async {
      await tester.pumpWidget(TestUtils.widgets[WidgetNames.textfield.name]!);
      expect(generateLayout(LayoutNames.emptyLayout.name), equals(null));
      return Future.value(null);
    });
  });
}

class FieldTests extends Tests {}
