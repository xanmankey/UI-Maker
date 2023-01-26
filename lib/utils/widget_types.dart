import 'package:ui_maker/data/collections/widget_settings.dart';

enum WidgetType {
  card,
  dropdown,
  checkbox,
  numField,
  textField,
  imageSelector;
}

/// A function for creating the default settings for a widget
createWidgetSettings(List<WidgetType> widgets,
    {String? title,
    String? description,
    bool? enabled,
    bool? individual,
    bool? ready,
    Map<String, dynamic>? mapValues}) {
  Map<WidgetType, WidgetSettings> items = {};
  for (WidgetType widgetType in widgets) {
    items.addAll({
      widgetType: WidgetSettings()
        ..title = title ?? ''
        ..description = description
        ..enabled = enabled ?? true
        ..mapValues = mapValues ?? {}
        ..widgetType = widgetType
    });
  }
  return items;
}
