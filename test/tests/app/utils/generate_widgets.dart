import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:ui_maker/ui_maker.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

/// TESTS SHOULD:
/// - Check all parameters
/// - Check rendering (if applicable)
/// - Mock data for simulation (if applicable)
/// - GIVE THE USER FAITH IN THE CODE

void main() {
  setUpAll(() async {
    await testUtils.ensureInitialized();
  });
  group('`generateWidgets()`', () {
    test(
        'List<WidgetSettings> widgetSettings = [], Layout layout = TestUtils.layouts["emptyLayout"]',
        () {
      expect(
          generateWidgets([TestUtils.checkbox], TestUtils.emptyLayout),
          equals([
            CreatorCheckbox(
              widgetSetting: TestUtils.checkbox,
              layout: TestUtils.emptyLayout,
            ),
          ]));
    });
    test(
        'List<WidgetSettings> widgetSettings = [], Layout layout = TestUtils.layouts["emptyLayout"]',
        () {
      expect(
          generateWidgets(
              [], TestUtils.layouts[LayoutNames.emptyLayout.toString()]!),
          equals([]));
    });
  });
}
