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

void main() {
  setUpAll(() async {
    await testUtils.ensureInitialized();
  });
  group('''`CreatorCard(); Layout layout = TestUtils.emptyLayout??, 
        WidgetSettings widgetSetting = TestUtils.card`''', () {
    testWidgets('Sort', (WidgetTester tester) async {
      await tester.pumpWidget(TestUtils.widgets[WidgetNames.card.toString()]!);
      expect(
          CreatorCard(
            layout: TestUtils.emptyLayout,
            widgetSetting: TestUtils.card,
          ),
          equals(Layout()
            ..layoutName = "layoutName"
            ..filter = false
            ..numGroups = 4
            ..layoutType = LayoutType.columns));
      return Future.value(null);
    });
    testWidgets('Filter', (WidgetTester tester) async {
      await tester.pumpWidget(TestUtils.widgets[WidgetNames.card.toString()]!);
      expect(
          CreatorCard(
            layout: TestUtils.emptyLayout,
            widgetSetting: TestUtils.card,
          ),
          equals(Layout()
            ..layoutName = "layoutName"
            ..filter = false
            ..numGroups = 4
            ..layoutType = LayoutType.columns));
      return Future.value(null);
    });
    testWidgets('Drag/Drop', (WidgetTester tester) async {
      await tester.pumpWidget(TestUtils.widgets[WidgetNames.card.toString()]!);
      expect(
          CreatorCard(
            layout: TestUtils.emptyLayout,
            widgetSetting: TestUtils.card,
          ),
          equals(Layout()
            ..layoutName = "layoutName"
            ..filter = false
            ..numGroups = 4
            ..layoutType = LayoutType.columns));
      return Future.value(null);
    });
    group("Context Menu State Changes", () {
      setUp(() => Tests.contextMenuTest<T>(tester, finder));
      testWidgets('Drag/Drop', (WidgetTester tester) async {
        await tester
            .pumpWidget(TestUtils.widgets[WidgetNames.card.toString()]!);
        expect(
            CreatorCard(
              layout: TestUtils.emptyLayout,
              widgetSetting: TestUtils.card,
            ),
            equals(Layout()
              ..layoutName = "layoutName"
              ..filter = false
              ..numGroups = 4
              ..layoutType = LayoutType.columns));
        return Future.value(null);
      });
    });
    testWidgets('default params, simulate click', (WidgetTester tester) async {
      await tester.pumpWidget(TestUtils.widgets["Card"]!);
      expect(generateLayout("emptyLayout"), equals(null));
      return Future.value(null);
    });
  });
}
