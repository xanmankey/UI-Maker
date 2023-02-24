import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:ui_maker/vars/widget_types.dart';

part 'widget_settings.g.dart';

/// A collection for storing all user_created widgets and their info
///
/// ```
/// @collection
/// class Widget {
///   /// The id of each widget; autoincremented by Isar
///   Id id = Isar.autoIncrement;
///
///   /// The required title of a widget
///   @Index()
///   late String title;
///
///   /// An optional description (hint text) for a widget
///   /// Can be set via context menu (right click)
///   String? description;
///
///   /// The color value of the widget;
///   /// retrieved from flutter after a widget is created,
///   /// but can be changed via the combination of right click + color selector
///   @Index()
///   late int color;
///
///   /// The current screen offset of the widget
///   /// (in case layoutType is set to LayoutType.none in the layout collection)
///   late double offsetX;
///   late double offsetY;
///
///   /// The type of widget selected from the creator bar;
///   /// used for recreating the widget
///   @Index()
///   @enumerated
///   late WidgetType widgetType;
///
///   /// A map of values encoded and written to the database
///   /// These are specified by the user
///   @Ignore()
///   Map<String, dynamic> mapValues = {};
///
///   String get values => jsonEncode(mapValues);
///   set values(String json) => mapValues = jsonDecode(json);
///
///   /// Specifying extra widgets if your widget object is a layered widget,
///   /// e.g. creator_card
///   IsarLink<Widget>? widgets = IsarLink<Widget>();
///
///   @override
///   String toString() {
///     return '''$id: {title: $title, description: $description, values: $values,
///     validation: $validation, widgetType: $widgetType, color: $color, offset:
///     $offset}''';
///   }
/// }
/// ```
///
/// Backlinks to program and gamemode
///
///
@collection
class WidgetSettings {
  WidgetSettings({
    required this.title,
    required this.widgetType,
    required this.color,
    this.description = '',
    this.enabled = true,
    this.mapValues = const {},
    this.hasDropped = false,
    this.offsetX,
    this.offsetY,
    this.listNum,
  })  : id = Isar.autoIncrement,
        widgets = IsarLinks<WidgetSettings>();

  /// The id of each widget; autoincremented by Isar
  Id id;

  /// The required title of a widget
  @Index()
  String title;

  /// An optional description (hint text) for a widget
  /// Can be set via context menu (right click)
  String? description;

  /// A bool to determine if the widget is enabled or not;
  /// defaults to true
  bool enabled;

  /// A bool to determine if the widget has been dropped into a layout or not
  /// defaults to false
  bool hasDropped;

  // TODO: in addition to the below problem of custom validation type,
  /// I originally had plans to support a custom validation function,
  /// but isar doesn't support Function type.
  /// A custom validation function, in case it is necessary.
  // String? Function(dynamic)? validation;

  /// The color value of the widget;
  /// retrieved from flutter after a widget is created,
  /// but can be changed via the combination of right click + color selector
  @Index()
  int color;

  /// The current screen offset of the widget
  /// (in case layoutType is set to LayoutType.none in the layout collection)
  double? offsetX;
  double? offsetY;

  /// The listview number the widget is a part of
  @Index()
  int? listNum;

  /// The type of widget selected from the creator bar;
  /// used for recreating the widget
  @Index()
  @enumerated
  WidgetType widgetType;

  /// A map of values encoded and written to the database
  /// These are specified by the user
  @Ignore()
  Map<String, dynamic> mapValues;

  String get values => jsonEncode(mapValues);
  set values(String json) => mapValues = SplayTreeMap<String, dynamic>.from(
      jsonDecode(json), (key, value) => key.compareTo(value));

  /// Specifying extra widgets if your widget object is a layered widget,
  /// e.g. creator_card
  IsarLinks<WidgetSettings> widgets;

  @override
  String toString() {
    return '''$id: {title: $title, description: $description, values: $values,
    widgetType: $widgetType, color: $color, offset: 
    ($offsetX, $offsetY)}''';
  }

  // Check that all variables have the same string value
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    WidgetSettings otherSettings = other as WidgetSettings;
    return id == otherSettings.id &&
        title == otherSettings.title &&
        description == otherSettings.description &&
        enabled == otherSettings.enabled &&
        color == otherSettings.color &&
        offsetX == otherSettings.offsetX &&
        offsetY == otherSettings.offsetY &&
        listNum == otherSettings.listNum &&
        widgetType == otherSettings.widgetType &&
        mapValues.length == otherSettings.mapValues.length;
  }
}
