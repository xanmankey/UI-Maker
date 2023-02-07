// Functions for initializing a layout for a UI_Maker screen
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/isar_db.dart';
import 'package:ui_maker/utils/layout_types.dart';
import 'package:ui_maker/utils/logging.dart';

// TODO: my generative functions don't actually WRITE the data; should they?
// TODO: e.g. I feel like this one should, because it needs to check if the
// layoutName is unique...

/// A function for creating layout instances; if the layoutName is unique, it is
/// written to the database.
///
/// ```
/// Layout generateLayout(
///   String layoutName, {
///   filter = false,
///   int numGroups = 4,
///   LayoutType layoutType = LayoutType.columns,
/// }) {
///   Layout layout = Layout()
///     ..filter = filter
///     ..layoutName = layoutName
///     ..numGroups = numGroups
///     ..layoutType = layoutType;
///   return layout;
/// }
/// ```
Layout? generateLayout(
  String layoutName, {
  bool filter = false,
  int numGroups = 4,
  LayoutType layoutType = LayoutType.columns,
}) {
  try {
    Layout layout = Layout()
      ..filter = filter
      ..layoutName = layoutName
      ..numGroups = numGroups
      ..layoutType = layoutType;
    // write layout
    db.updateLayouts([layout]);
    return layout;
  } catch (e, stacktrace) {
    logger.warning("$stacktrace: $e");
    return null;
  }
}
