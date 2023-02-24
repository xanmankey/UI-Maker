// Functions for initializing a layout for a UI_Maker screen
import 'package:flutter/material.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/isar_db.dart';
import 'package:ui_maker/vars/layout_types.dart';
import 'package:ui_maker/logging.dart';
import 'package:ui_maker/vars/sort_types.dart';

// TODO: my generative functions don't actually WRITE the data; should they?
// TODO: e.g. I feel like this one should, because it needs to check if the
// layoutName is unique...

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
Layout generateLayout(
  String layoutName, {
  SortOption sortOption = SortOption.sort,
  int numGroups = 4,
  double? width,
  double? height,
  LayoutType layoutType = LayoutType.columns,
  // bool write = false
}) {
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
  // write layout
  // if (write) {
  //   Future<List<Layout?>?> layouts = db.updateLayouts([layout]);
  //   // .then() returns a new future; it doesn't actually block the code...
  //   // so what do I do? Can I make generateLayout synchronous?
  //   layouts.then((value) {
  //     if (value == null) {
  //       return null;
  //     }
  //   });
  // }
  return layout;
}
