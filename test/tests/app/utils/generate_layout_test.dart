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
  group('`generateLayout()`', () {
    test('layoutName = "layoutName"', () {
      expect(
          generateLayout("layoutName", width: 10, height: 10),
          equals(Layout()
            ..layoutName = "layoutName"
            ..filter = false
            ..numGroups = 4
            ..width = 10
            ..height = 10
            ..layoutType = LayoutType.columns));
    });
    // test('layoutName = already existing layout name, "emptyLayout"', () {
    //   expect(generateLayout("emptyLayout"), equals(null));
    // });
  });
}
