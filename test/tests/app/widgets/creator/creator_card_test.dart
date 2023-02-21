import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_maker/ui_maker.dart';
import 'package:ui_maker/logging.dart';
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
///
/// Potentially considering https://pub.dev/packages/golden_toolkit
/// (screenshot-based comparison testing; "golden-testing")

void main() {
  group('''CreatorCard:''', () {
    CardTests contextMenuTests = CardTests();
    contextMenuTests.colorTest(find.byType(CreatorCard), TestUtils.card);
    // contextMenuTests.disableTest(find.byType(CreatorCard), TestUtils.card);
    // contextMenuTests.enableTest(find.byType(CreatorCard), TestUtils.card);
    // contextMenuTests.deleteTest(find.byType(CreatorCard), TestUtils.card);
    testWidgets('Check if dialog exists on click',
        (WidgetTester widgetTester) async {
      await contextMenuTests.colorSetUp(widgetTester, find.byType(CreatorCard));
      expect(generateLayout(LayoutNames.emptyLayout.name), equals(null));
    });
  });
}

class CardTests extends ContextMenuTests {
  @override
  Future<void> pumpWidget(WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: TestUtils.widgets[WidgetNames.card.name]!,
    ));
  }

  // An override to fetch the color of a CreatorCard
  // (in this case actually the color of the child card widget)
  @override
  expectNewUIColor<CreatorCard>(WidgetTester widgetTester, Finder finder) {
    // Check if widget color is actually red
    expect(finder.evaluate().first.widget,
        isA<Card>().having((card) => card.color, 'color', Colors.red));
  }

  @override
  expectNewDisableColor<CreatorCard>(WidgetTester widgetTester, Finder finder) {
    // Check if widget color is actually grey
    expect(widgetTester.widget(find.byType(Card)),
        isA<Card>().having((card) => card.color, 'color', Colors.grey));
  }

  @override
  expectNewEnableColor<CreatorCard>(WidgetTester widgetTester, Finder finder) {
    // Check if widget color is the correct color for the desired widget
    final CreatorCardState creatorCardState =
        widgetTester.state(find.byType(CreatorCard));
    expect(
        widgetTester.widget(find.byType(Card)),
        isA<Card>().having((card) => card.color, 'color',
            creatorCardState.widget.widgetSetting.color));
  }

  @override
  expectDelete<CreatorCard>(WidgetTester widgetTester, Finder finder) {
    // Expect that the CreatorCard widget is deleted from the UI
    expect(finder, findsNothing);
  }
}
