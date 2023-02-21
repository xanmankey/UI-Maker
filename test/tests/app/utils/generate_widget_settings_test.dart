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
  group('`generateWidgetSettings():`', () {
    // setUp(() async {
    //   await testUtils.ensureInitialized();
    // });
    test('List<WidgetType> widgets = [WidgetType.checkbox]', () {
      expect(
          generateWidgetSettings(
              [WidgetType.checkbox], null)[WidgetType.checkbox],
          equals(WidgetSettings(
              title: '',
              description: '',
              enabled: true,
              color: getColor(null, WidgetType.checkbox),
              offsetX: null,
              offsetY: null,
              listviewNum: null,
              listviewIndex: null,
              mapValues: {},
              widgetType: WidgetType.checkbox)));
    });
    test('List<WidgetType> widgets = []', () {
      expect(generateWidgetSettings([], null), equals({}));
    });
  });
}
