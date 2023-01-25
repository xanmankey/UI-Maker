import 'dart:convert';

import 'package:ui_maker/utils/sort_types.dart';
import 'package:ui_maker/app/widgets/creator_dialog.dart';
import 'package:ui_maker/data/collections/widget.dart' as data;
import 'package:flutter/material.dart';
import 'package:ui_maker/app/widgets/creator_context_menu.dart';

// This goes inside a horizontal ListView
class SettingsCard extends StatefulWidget {
  data.Widget setting;
  List<data.Widget>? dialogSettings;
  SettingsCard({super.key, required this.setting, this.dialogSettings});

  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  @override
  Widget build(BuildContext context) {
    return SettingsContextMenu(
      setting: widget.setting,
      settingsWidget: GestureDetector(
        onTap: (() => showDialog(
            context: context,
            builder: (context) => SettingsDialog(
                  cardSetting: widget.setting,
                  dialogSettings: widget.dialogSettings,
                ))),
        child: Card(
          color: widget.setting.enabled
              ? inputTypeColor(widget.setting.inputType)
              : Colors.grey,
          child: Text(
            widget.setting.title,
          ),
        ),
      ),
    );
  }
}
