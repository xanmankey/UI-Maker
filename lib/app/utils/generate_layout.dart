// Functions for initializing a layout for a UI_Maker screen
import 'package:flutter/material.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/isar_db.dart';
import 'package:ui_maker/vars/layout_types.dart';
import 'package:ui_maker/logging.dart';
import 'package:ui_maker/vars/sort_types.dart';

/// A function for creating layout instances
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
Future<Layout> generateLayout(String layoutName,
    {SortOption sortOption = SortOption.sort,
    int numGroups = 4,
    double? width,
    double? height,
    LayoutType layoutType = LayoutType.columns,
    bool write = false}) async {
  Layout layout = Layout(
      sortOption: sortOption,
      layoutName: layoutName,
      numGroups: numGroups,
      layoutType: layoutType,
      width: width ??
          MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width,
      height: height ??
          MediaQueryData.fromWindow(WidgetsBinding.instance.window)
              .size
              .height);
  // attempt to write the layout
  if (write) {
    List<Layout?>? layouts = await db.updateLayouts([layout]);
    if (layouts == null) {
      TODO: what to do about exceptions;
      throw Exception("Invalid layout name; make sure it is a unique string!");
    }
  }
  return layout;
}
