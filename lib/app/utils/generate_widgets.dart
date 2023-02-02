import 'package:flutter/material.dart';
import 'package:ui_maker/app/widgets/creator/creator_image.dart';
import 'package:ui_maker/app/widgets/creator/creator_checkbox.dart';
import 'package:ui_maker/app/widgets/creator/creator_dropdown.dart';
import 'package:ui_maker/app/widgets/creator/creator_field.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/utils/widget_types.dart';

/// A function for creating a widget based off of widget data
generateWidgets(List<WidgetSettings> widgetSettings) {
  List<Widget> widgets = [];
  for (WidgetSettings widgetSettings in widgetSettings) {
    switch (widgetSettings.widgetType) {
      case WidgetType.checkbox:
        widgets.add(CreatorCheckbox(widgetSetting: widgetSettings));
        break;
      case WidgetType.numField:
        widgets.add(CreatorField(
          widgetSetting: widgetSettings,
          widgetType: WidgetType.numField,
        ));
        break;
      case WidgetType.textField:
        widgets.add(CreatorField(
            widgetSetting: widgetSettings, widgetType: WidgetType.textField));
        break;
      case WidgetType.dropdown:
        assert(widgetSettings.mapValues.containsKey("items"));
        widgets.add(CreatorDropdown(
          widgetSetting: widgetSettings,
          items: widgetSettings.mapValues["items"],
        ));
        break;
      case WidgetType.imageSelector:
        widgets.add(CreatorImage());
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
