import 'dart:convert';

import 'package:ui_maker/utils/sort_types.dart';
import 'package:ui_maker/app/widgets/utility/custom_dialog.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:flutter/material.dart';
import 'package:ui_maker/app/creator_context_menu.dart';
import 'package:ui_maker/app/widgets/creator_checkbox.dart';

class CreatorCheckbox extends StatefulWidget {
  WidgetSettings widgetSetting;
  CreatorCheckbox({super.key, required this.widgetSetting});

  @override
  State<CreatorCheckbox> createState() => _CreatorCheckboxState();
}

class _CreatorCheckboxState extends State<CreatorCheckbox> {
  @override
  Widget build(BuildContext context) {
    // If an individual widget, display a form option with validation
    (widget.widgetSetting.individual)
        ? CreatorContextMenu(
            widgetSetting: widget.widgetSetting,
            creatorWidget: CheckboxListTileFormField(
              initialValue: false,
              activeColor: inputTypeColor(widget.widgetSetting.inputType),
              onChanged: (value) {
                setState(() {
                  widget.widgetSetting.mapValues
                      .addAll({widget.widgetSetting.title: value});
                });
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              title: Text(widget.widgetSetting.title),
              validator: widget.widgetSetting.validation != null
                  ? widget.widgetSetting.validation
                  : null,
            ),
          )
        : CreatorContextMenu(
            widgetSetting: widget.widgetSetting,
            creatorWidget: CheckboxListTile(
              value: true,
              tileColor: inputTypeColor(widget.widgetSetting.inputType),
              onChanged: (value) {
                setState(() {
                  widget.widgetSetting.mapValues
                      .addAll({widget.widgetSetting.title: value});
                });
              },
              title: Text(widget.widgetSetting.title),
            ),
          );
    throw Exception("Settings checkbox failed to render");
  }
}
