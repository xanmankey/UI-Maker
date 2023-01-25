import 'package:flutter/material.dart';
import 'package:ui_maker/data/collections/widget.dart' as data;
import 'package:ui_maker/app/widgets/creator_context_menu.dart';

class SettingsDropdown extends StatefulWidget {
  data.Widget setting;
  Items items;
  SettingsDropdown({
    super.key,
    required this.setting,
    required this.items,
  });

  @override
  State<SettingsDropdown> createState() => _SettingsDropdownState();
}

class _SettingsDropdownState extends State<SettingsDropdown> {
  @override
  Widget build(BuildContext context) {
    // If an individual widget, display a form option with validation
    (widget.setting.individual)
        ? SettingsContextMenu(
            setting: widget.setting,
            settingsWidget: DropdownButtonFormField(
              items: populateDropdown(widget.items),
              // value: widget.setting.enabled,
              dropdownColor: inputTypeColor(widget.setting.inputType),
              hint: Text(widget.setting.description ?? ''),
              onChanged: (widget.setting.enabled)
                  ? (value) {
                      setState(() {
                        widget.setting.mapValues
                            .addAll({widget.setting.title: value});
                      });
                    }
                  : null,
              // ? Autovalidate mode?
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.setting.validation != null
                  ? widget.setting.validation
                  : (value) {
                      if (value == null) {
                        return 'Please select an option';
                      }
                      return null;
                    },
            ),
          )
        : SettingsContextMenu(
            setting: widget.setting,
            settingsWidget: DropdownButton(
                items: populateDropdown(widget.items),
                value: widget.setting.enabled,
                dropdownColor: inputTypeColor(widget.setting.inputType),
                hint: Text(widget.setting.description ?? ''),
                onChanged: (widget.setting.enabled)
                    ? (value) {
                        setState(() {
                          widget.setting.mapValues
                              .addAll({widget.setting.title: value});
                        });
                      }
                    : null),
          );
    throw Exception("Settings dropdown failed to render");
  }
}

List<DropdownMenuItem<String>> populateDropdown(Items items) {
  switch (items) {
    case Items.inputs:
      return [
        for (Inputs inputs in items.inputsIterable)
          DropdownMenuItem<String>(child: Text(text: inputs.toString()))
      ];
    case Items.inputTypes:
      return [
        for (InputTypes inputTypes in items.inputTypesIterable)
          DropdownMenuItem<String>(child: Text(text: inputTypes.toString()))
      ];
    case Items.filters:
      return [
        for (Filters filters in items.filtersIterable)
          DropdownMenuItem<String>(child: Text(text: filters.toString()))
      ];
    case Items.devices:
      return [
        for (Device device in items.filtersIterable)
          DropdownMenuItem<String>(child: Text(text: device.toString()))
      ];
  }
}
