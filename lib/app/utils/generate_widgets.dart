import 'package:ui_maker/app/widgets/creator_checkbox.dart';
import 'package:ui_maker/app/widgets/creator_dropdown.dart';
import 'package:ui_maker/app/widgets/creator_field.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/utils/widget_types.dart';

/// A function for creating a widget based off of widget data
generateWidgets(List<WidgetSettings> widgets) {
  List<WidgetSettings> widgets = [];
  for (WidgetSettings widgetSettings in widgets) {
    switch (widgetSettings.widgetType) {
      case WidgetType.checkbox:
        widgets.add(CreatorCheckbox(widgetSetting: widgetSetting));
        break;
      case WidgetType.numField:
        widgets.add(CreatorField(
          widgetSetting: widgetSetting,
          widgetType: WidgetType.numField,
        ));
        break;
      case WidgetType.textField:
        widgets.add(CreatorField(
            widgetSetting: widgetSetting, widgetType: WidgetType.textField));
        break;
      case WidgetType.dropdown:
        widgets.add(CreatorDropdown(
          widgetSetting: widgetSetting,
          items: Items.inputTypes,
        ));
        break;
      // case WidgetType.inputsDropdown:
      //   widgets.add(SettingsDropdown(
      //     setting: setting,
      //     items: Items.inputs,
      //   ));
      //   break;
      // case WidgetType.filtersDropdown:
      //   widgets.add(SettingsDropdown(
      //     setting: setting,
      //     items: Items.filters,
      //   ));
      //   break;
      case WidgetType.card:
        break;
    }
  }
  return widgets;
}
