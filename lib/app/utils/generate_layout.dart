// Functions for initializing a layout for a UI_Maker screen
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/utils/layout_types.dart';

// TODO: my generative functions don't actually WRITE the data; should they?

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
Layout generateLayout(
  String layoutName, {
  filter = false,
  int numGroups = 4,
  LayoutType layoutType = LayoutType.columns,
}) {
  Layout layout = Layout()
    ..filter = filter
    ..layoutName = layoutName
    ..numGroups = numGroups
    ..layoutType = layoutType;
  return layout;
}
