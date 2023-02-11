import 'package:ui_maker/app/widgets/creator/creator_card.dart';
import 'package:ui_maker/app/widgets/creator/creator_checkbox.dart';
import 'package:ui_maker/app/widgets/creator/creator_dropdown.dart';
import 'package:ui_maker/app/widgets/creator/creator_field.dart';
import 'package:ui_maker/app/widgets/creator/creator_image.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';

enum WidgetType {
  card,
  dropdown,
  checkbox,
  numField,
  textField,
  imageSelector;
  // get types => WidgetType.values;

  Type toWidgetType() {
    switch (this) {
      case card:
        return CreatorCard;
      case dropdown:
        return CreatorDropdown;
      case checkbox:
        return CreatorCheckbox;
      case numField:
        return CreatorField;
      case textField:
        return CreatorField;
      case imageSelector:
        return CreatorImage;
    }
  }
}

// I suppose I could create a CreatorType type, but that would need
// to be inherited from

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
