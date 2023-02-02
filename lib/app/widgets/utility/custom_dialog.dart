// A widget for structuring entries in the character gallery
import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:ui_maker/app/creator_area.dart';
import 'package:ui_maker/app/widgets/creator/creator_dropdown.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:flutter/material.dart';
import 'package:ui_maker/data/isar_db.dart';

// TODO: the dialog widget needs to be done along with the creator_area widget

/// A dialog widget shown by widgets such as the card widget that allows
/// creator widgets to be placed inside via the ```CreatorArea```
///
/// ```
///
/// ```
class CreatorDialog extends StatefulWidget {
  List<WidgetSettings>? widgetSettings;
  WidgetSettings cardSetting;
  CreatorDialog({super.key, required this.cardSetting, this.widgetSettings});

  @override
  State<CreatorDialog> createState() => _CreatorDialogState();
}

class _CreatorDialogState extends State<CreatorDialog> {
  late Isar isarDB;

  @override
  initState() async {
    isarDB = await db.isarDB;
    super.initState();
  }

  // WidgetSettings inputTypesDropdown = createSettings(
  //     [WidgetType.inputTypesDropdown])[WidgetType.inputTypesDropdown]!;
  // WidgetSettings checkboxDropdown =
  //     createSettings([WidgetType.checkbox])[WidgetType.checkbox]!;

  // TODO: the Dialog needs to be able to take in draggable widgets and have a
  // layout accordingly

  @override
  Widget build(BuildContext context) {
    return CreatorArea(
      child: Dialog(
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
                in generateSettingsWidgets(widget.widgetSettings ?? []))
              widget,
            CreatorDropdown(
                widgetSetting: inputTypesDropdown, items: Items.inputTypes),
            IconButton(
              iconSize: 36,
              icon: const Icon(Icons.delete),
              onPressed: () async {
                setState(() async {
                  await storage.deleteSettings([
                    for (WidgetSettings setting in [
                      widget.cardSetting
                    ]..addAll(widget.widgetSettings ?? []))
                      setting.id
                  ]);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
