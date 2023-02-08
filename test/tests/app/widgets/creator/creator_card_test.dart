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

// TODO: need to look into how to do a flutter_test here
// Each widget should have tested interaction

void main() {
  setUpAll(() async {
    await testUtils.ensureInitialized();
  });
  group('`CreatorCard()`', () {
    test(
        '''Layout layout = , WidgetSettings widgetSetting = , List<WidgetSettings>? = ''',
        () {
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
    });
    test('default params, simulate click', () {
      expect(generateLayout("emptyLayout"), equals(null));
    });
  });
}
