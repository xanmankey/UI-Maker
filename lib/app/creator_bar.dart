// A toolbar supporting various drag and drop flutter widgets
// to aid in program and gamemode creation

import 'package:ui_maker/app/widgets/creator_field.dart';
import 'package:ui_maker/app/widgets/creator_card.dart';
import 'package:ui_maker/app/widgets/creator_dropdown.dart';
import 'package:ui_maker/app/widgets/creator_checkbox.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:flutter/material.dart';
import 'package:ui_maker/utils/widget_types.dart';

/// A toolbar widget that appears at the bottom of your screen for dragging
/// and dropping creator widgets. If you want to create a creator widget,
/// right now you can add it manually via the ```CreatorBar```, but I am
/// considering a folder-based workaround
///
/// ```
///
/// ```
class CreatorBar extends StatefulWidget {
  WidgetSettings widgetSetting;
  CreatorBar({super.key, required this.widgetSetting});

  @override
  State<CreatorBar> createState() => _CreatorBarState();
}

class _CreatorBarState extends State<CreatorBar> {
  @override
  Widget build(BuildContext context) {
    bool visible = false;
    IconData arrowIcon = Icons.arrow_drop_up;
    List<Widget> items = [];
    return Visibility(
      visible: visible,
      replacement: GestureDetector(
        child: Icon(arrowIcon),
        onTap: () => setState(() {
          visible = !visible;
          if (visible) {
            Map<WidgetType, WidgetSettings> widgetSettings =
                createWidgetSettings(WidgetType.values);
            items = [
              CreatorCheckbox(
                  widgetSetting: widgetSettings[WidgetType.checkbox]!),
              CreatorCard(widgetSetting: widgetSettings[WidgetType.card]!),
              CreatorField(
                  widgetSetting: widgetSettings[WidgetType.numField]!,
                  widgetType: WidgetType.numField),
              CreatorDropdown(
                  widgetSetting: widgetSettings[WidgetType.textField]!,
                  items: Items.inputs),
              CreatorDropdown(
                  widgetSetting: widgetSettings[WidgetType.dropdown]!,
                  items: Items.inputTypes),
              CreatorDropdown(
                  widgetSetting: widgetSettings[WidgetType.filtersDropdown]!,
                  items: Items.filters),
              CreatorField(
                  widgetSetting: widgetSettings[WidgetType.textField]!,
                  widgetType: WidgetType.textField),
            ];
          }
        }),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          for (Widget widget in items) {
            return widget;
          }
          throw Exception('No WidgetType were created for the create bar');
        },
        itemCount: items.length,
        separatorBuilder: (context, index) {
          for (int i = 0; i < index; i++) {
            return const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10));
          }
          throw Exception('Padding failed to be created for the create bar');
        },
      ),
    );
  }
}
