import 'dart:convert';

import 'package:ui_maker/utils/sort_types.dart';
import 'package:ui_maker/app/widgets/creator_dialog.dart';
import 'package:ui_maker/data/collections/widget.dart' as data;
import 'package:flutter/material.dart';
import 'package:ui_maker/app/widgets/creator_context_menu.dart';
import 'package:ui_maker/app/widgets/creator_checkbox.dart';

class SettingsCheckbox extends StatefulWidget {
  data.Widget setting;
  SettingsCheckbox({super.key, required this.setting});

  @override
  State<SettingsCheckbox> createState() => _SettingsCheckboxState();
}

class _SettingsCheckboxState extends State<SettingsCheckbox> {
  @override
  Widget build(BuildContext context) {
    // If an individual widget, display a form option with validation
    (widget.setting.individual)
        ? SettingsContextMenu(
            setting: widget.setting,
            settingsWidget: CheckboxListTileFormField(
              initialValue: false,
              activeColor: inputTypeColor(widget.setting.inputType),
              onChanged: (value) {
                setState(() {
                  widget.setting.mapValues
                      .addAll({widget.setting.title: value});
                });
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              title: Text(widget.setting.title),
              validator: widget.setting.validation != null
                  ? widget.setting.validation
                  : null,
            ),
          )
        : SettingsContextMenu(
            setting: widget.setting,
            settingsWidget: CheckboxListTile(
              value: true,
              tileColor: inputTypeColor(widget.setting.inputType),
              onChanged: (value) {
                setState(() {
                  widget.setting.mapValues
                      .addAll({widget.setting.title: value});
                });
              },
              title: Text(widget.setting.title),
            ),
          );
    throw Exception("Settings checkbox failed to render");
  }
}
