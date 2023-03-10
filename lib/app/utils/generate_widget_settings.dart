import 'package:flutter/material.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/data/isar_db.dart';
import 'package:ui_maker/vars/widget_types.dart';

/// A function for creating the creator bar settings objects
///
/// ```
/// Map<WidgetType, WidgetSettings> generateWidgetSettings(
///     List<WidgetType> widgets, BuildContext? context,
///     {String? title,
///     String? description,
///     bool? enabled,
///     int? color,
///     Map<String, dynamic>? mapValues}) {
///   Map<WidgetType, WidgetSettings> items = {};
///   for (WidgetType widget in widgets) {
///     items.addAll({
///       widget: WidgetSettings()
///         ..title = title ?? ''
///         ..description = description ?? ''
///         ..enabled = enabled ?? true
///         ..color = color ?? getColor(context, widget)
///         ..mapValues = mapValues ?? {}
///         ..widgetType = widget
///     });
///   }
///   return items;
/// }
/// ```
Map<WidgetType, WidgetSettings> generateWidgetSettings(
  List<WidgetType> widgets,
  BuildContext? context, {
  String? title,
  String? description,
  bool? enabled,
  bool? hasDropped,
  int? color,
  double? offsetX,
  double? offsetY,
  int? listNum,
  Map<String, dynamic>? mapValues,
  // bool write = false,
}) {
  Map<WidgetType, WidgetSettings> items = {};
  for (WidgetType widget in widgets) {
    items.addAll({
      widget: WidgetSettings(
        title: title ?? '',
        description: description ?? '',
        enabled: enabled ?? true,
        hasDropped: hasDropped ?? false,
        color: color ?? getColor(context, widget),
        offsetX: offsetX,
        offsetY: offsetY,
        listNum: (listNum != null && listNum > initialListNum)
            ? listNum
            : initialListNum,
        widgetType: widget,
      )..mapValues = mapValues ?? {}
    });
  }
  // if (write) {
  //   Future<List<WidgetSettings?>?> settings = db.updateWidgetSettings(
  //       [for (WidgetSettings setting in items.values) setting]);
  //   settings.then((value) {
  //     if (value == null) {
  //       return null;
  //     }
  //   });
  // }
  return items;
}

const int initialListNum = 0;

/// A function for getting the initial color of a widget (if not speicifed)
/// based on theme color and current context
///
/// ```
/// int getColor(BuildContext? context, WidgetType type) {
///   if (context != null) {
///     switch (type) {
///       case WidgetType.checkbox:
///         return Theme.of(context).checkboxTheme.hashCode;
///       case WidgetType.numField:
///         return Theme.of(context).textTheme.hashCode;
///       case WidgetType.textField:
///         return Theme.of(context).textTheme.hashCode;
///       case WidgetType.dropdown:
///         return Theme.of(context).buttonTheme.hashCode;
///       case WidgetType.imageSelector:
///         return Theme.of(context).buttonTheme.hashCode;
///       case WidgetType.card:
///         return Theme.of(context).cardTheme.hashCode;
///     }
///   }
///   return Colors.blue.hashCode;
/// }
/// ```
int getColor(BuildContext? context, WidgetType type) {
  if (context != null) {
    switch (type) {
      case WidgetType.checkbox:
        return Theme.of(context).primaryColor.value;
      case WidgetType.textField:
        return Theme.of(context).primaryColorDark.value;
      case WidgetType.dropdown:
        return Theme.of(context)
            .dropdownMenuTheme
            .inputDecorationTheme!
            .fillColor!
            .value;
      case WidgetType.imageSelector:
        return Theme.of(context).buttonTheme.colorScheme!.onBackground.value;
      case WidgetType.card:
        return Theme.of(context).cardColor.value;
      default:
        return Theme.of(context).primaryColor.value;
    }
  }
  return Colors.blue.hashCode;
}
