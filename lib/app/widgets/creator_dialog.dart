// A widget for structuring entries in the character gallery
import 'dart:convert';

import 'package:ui_maker/app/widgets/creator_dropdown.dart';
import 'package:ui_maker/data/collections/widget.dart' as data;
import 'package:flutter/material.dart';

class SettingsDialog extends StatefulWidget {
  List<data.Widget>? dialogSettings;
  data.Widget cardSetting;
  SettingsDialog({super.key, required this.cardSetting, this.dialogSettings});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  late Storage storage;

  data.Widget inputTypesDropdown =
      createSettings([SettingsWidgets.inputTypesDropdown])[
          SettingsWidgets.inputTypesDropdown]!;
  data.Widget checkboxDropdown =
      createSettings([SettingsWidgets.checkbox])[SettingsWidgets.checkbox]!;

  @override
  void initState() {
    titleController.text = widget.cardSetting.title;
    descriptionController.text = widget.cardSetting.description ?? '';
    storage = Storage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          TextField(
            controller: descriptionController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "Description",
            ),
          ),
          for (Widget widget
              in generateSettingsWidgets(widget.dialogSettings ?? []))
            widget,
          SettingsDropdown(
              setting: inputTypesDropdown, items: Items.inputTypes),
          IconButton(
            iconSize: 36,
            icon: const Icon(Icons.delete),
            onPressed: () async {
              setState(() async {
                await storage.deleteSettings([
                  for (data.Widget setting in [
                    widget.cardSetting
                  ]..addAll(widget.dialogSettings ?? []))
                    setting.id
                ]);
              });
            },
          ),
        ],
      ),
    );
  }
}
