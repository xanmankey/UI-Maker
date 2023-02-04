import 'package:flutter/material.dart';
import 'package:ui_maker/app/widgets/creator/creator_card.dart';
import 'package:ui_maker/app/widgets/creator/creator_image.dart';
import 'package:ui_maker/app/widgets/creator/creator_checkbox.dart';
import 'package:ui_maker/app/widgets/creator/creator_dropdown.dart';
import 'package:ui_maker/app/widgets/creator/creator_field.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/utils/widget_types.dart';

/// A function for creating a widget based off of widget data
///
/// ```
/// List<Widget> generateWidgets(List<WidgetSettings> widgetSettings, Layout layout,
///     {bool positioned = false}) {
///   List<Widget> widgets = [];
///   if (positioned) {
///     for (WidgetSettings widgetSettings in widgetSettings) {
///       switch (widgetSettings.widgetType) {
///         case WidgetType.checkbox:
///           widgets.add(Positioned(
///             left: widgetSettings.offsetX,
///             top: widgetSettings.offsetY,
///             child: CreatorCheckbox(
///               widgetSetting: widgetSettings,
///               layout: layout,
///             ),
///           ));
///           break;
///         case WidgetType.numField:
///           widgets.add(Positioned(
///             left: widgetSettings.offsetX,
///             top: widgetSettings.offsetY,
///             child: CreatorField(
///               widgetSetting: widgetSettings,
///               layout: layout,
///               widgetType: WidgetType.numField,
///             ),
///           ));
///           break;
///         case WidgetType.textField:
///           widgets.add(Positioned(
///             left: widgetSettings.offsetX,
///             top: widgetSettings.offsetY,
///             child: CreatorField(
///                 widgetSetting: widgetSettings,
///                 layout: layout,
///                 widgetType: WidgetType.textField),
///           ));
///           break;
///         case WidgetType.dropdown:
///           // assert(widgetSettings.mapValues.containsKey("items"));
///           widgets.add(Positioned(
///             left: widgetSettings.offsetX,
///             top: widgetSettings.offsetY,
///             child: CreatorDropdown(
///               widgetSetting: widgetSettings,
///               layout: layout,
///             ),
///           ));
///           break;
///         case WidgetType.imageSelector:
///           widgets.add(Positioned(
///             left: widgetSettings.offsetX,
///             top: widgetSettings.offsetY,
///             child: CreatorImage(
///               widgetSetting: widgetSettings,
///               layout: layout,
///             ),
///           ));
///           break;
///         case WidgetType.card:
///           widgets.add(Positioned(
///             left: widgetSettings.offsetX,
///             top: widgetSettings.offsetY,
///             child: CreatorCard(
///               widgetSetting: widgetSettings,
///               layout: layout,
///             ),
///           ));
///           break;
///       }
///     }
///   } else {
///     for (WidgetSettings widgetSettings in widgetSettings) {
///       switch (widgetSettings.widgetType) {
///         case WidgetType.checkbox:
///           widgets.add(CreatorCheckbox(
///             widgetSetting: widgetSettings,
///             layout: layout,
///           ));
///           break;
///         case WidgetType.numField:
///           widgets.add(CreatorField(
///             widgetSetting: widgetSettings,
///             widgetType: WidgetType.numField,
///             layout: layout,
///           ));
///           break;
///         case WidgetType.textField:
///           widgets.add(CreatorField(
///             widgetSetting: widgetSettings,
///             widgetType: WidgetType.textField,
///             layout: layout,
///           ));
///           break;
///         case WidgetType.dropdown:
///           // assert(widgetSettings.mapValues.containsKey("items"));
///           widgets.add(CreatorDropdown(
///             widgetSetting: widgetSettings,
///             layout: layout,
///           ));
///           break;
///         case WidgetType.imageSelector:
///           widgets.add(CreatorImage(
///             widgetSetting: widgetSettings,
///             layout: layout,
///           ));
///           break;
///         case WidgetType.card:
///           widgets.add(CreatorCard(
///             widgetSetting: widgetSettings,
///             layout: layout,
///           ));
///       }
///     }
///   }
///   return widgets;
/// }
/// ```
List<Widget> generateWidgets(List<WidgetSettings> widgetSettings, Layout layout,
    {bool positioned = false}) {
  List<Widget> widgets = [];
  if (positioned) {
    for (WidgetSettings widgetSettings in widgetSettings) {
      switch (widgetSettings.widgetType) {
        case WidgetType.checkbox:
          widgets.add(Positioned(
            left: widgetSettings.offsetX,
            top: widgetSettings.offsetY,
            child: CreatorCheckbox(
              widgetSetting: widgetSettings,
              layout: layout,
            ),
          ));
          break;
        case WidgetType.numField:
          widgets.add(Positioned(
            left: widgetSettings.offsetX,
            top: widgetSettings.offsetY,
            child: CreatorField(
              widgetSetting: widgetSettings,
              layout: layout,
              widgetType: WidgetType.numField,
            ),
          ));
          break;
        case WidgetType.textField:
          widgets.add(Positioned(
            left: widgetSettings.offsetX,
            top: widgetSettings.offsetY,
            child: CreatorField(
                widgetSetting: widgetSettings,
                layout: layout,
                widgetType: WidgetType.textField),
          ));
          break;
        case WidgetType.dropdown:
          // assert(widgetSettings.mapValues.containsKey("items"));
          widgets.add(Positioned(
            left: widgetSettings.offsetX,
            top: widgetSettings.offsetY,
            child: CreatorDropdown(
              widgetSetting: widgetSettings,
              layout: layout,
            ),
          ));
          break;
        case WidgetType.imageSelector:
          widgets.add(Positioned(
            left: widgetSettings.offsetX,
            top: widgetSettings.offsetY,
            child: CreatorImage(
              widgetSetting: widgetSettings,
              layout: layout,
            ),
          ));
          break;
        case WidgetType.card:
          widgets.add(Positioned(
            left: widgetSettings.offsetX,
            top: widgetSettings.offsetY,
            child: CreatorCard(
              widgetSetting: widgetSettings,
              layout: layout,
            ),
          ));
          break;
      }
    }
  } else {
    for (WidgetSettings widgetSettings in widgetSettings) {
      switch (widgetSettings.widgetType) {
        case WidgetType.checkbox:
          widgets.add(CreatorCheckbox(
            widgetSetting: widgetSettings,
            layout: layout,
          ));
          break;
        case WidgetType.numField:
          widgets.add(CreatorField(
            widgetSetting: widgetSettings,
            widgetType: WidgetType.numField,
            layout: layout,
          ));
          break;
        case WidgetType.textField:
          widgets.add(CreatorField(
            widgetSetting: widgetSettings,
            widgetType: WidgetType.textField,
            layout: layout,
          ));
          break;
        case WidgetType.dropdown:
          // assert(widgetSettings.mapValues.containsKey("items"));
          widgets.add(CreatorDropdown(
            widgetSetting: widgetSettings,
            layout: layout,
          ));
          break;
        case WidgetType.imageSelector:
          widgets.add(CreatorImage(
            widgetSetting: widgetSettings,
            layout: layout,
          ));
          break;
        case WidgetType.card:
          widgets.add(CreatorCard(
            widgetSetting: widgetSettings,
            layout: layout,
          ));
      }
    }
  }
  return widgets;
}
