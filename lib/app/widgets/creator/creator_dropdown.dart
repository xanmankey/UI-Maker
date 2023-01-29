import 'package:flutter/material.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/app/creator_context_menu.dart';

class CreatorDropdown extends StatefulWidget {
  WidgetSettings widgetSetting;
  Items items;
  CreatorDropdown({
    super.key,
    required this.widgetSetting,
    required this.items,
  });

  @override
  State<CreatorDropdown> createState() => _CreatorDropdownState();
}

class _CreatorDropdownState extends State<CreatorDropdown> {
  @override
  Widget build(BuildContext context) {
    // If an individual widget, display a form option with validation
    (widget.widgetSetting.individual)
        ? CreatorContextMenu(
            widgetSetting: widget.widgetSetting,
            creatorWidget: DropdownButtonFormField(
              items: populateDropdown(widget.items),
              // value: widget.setting.enabled,
              dropdownColor: inputTypeColor(widget.widgetSetting.inputType),
              hint: Text(widget.widgetSetting.description ?? ''),
              onChanged: (widget.widgetSetting.enabled)
                  ? (value) {
                      setState(() {
                        widget.widgetSetting.mapValues
                            .addAll({widget.widgetSetting.title: value});
                      });
                    }
                  : null,
              // ? Autovalidate mode?
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.widgetSetting.validation != null
                  ? widget.widgetSetting.validation
                  : (value) {
                      if (value == null) {
                        return 'Please select an option';
                      }
                      return null;
                    },
            ),
          )
        : CreatorContextMenu(
            widgetSetting: widget.widgetSetting,
            creatorWidget: DropdownButton(
                items: populateDropdown(widget.items),
                value: widget.widgetSetting.enabled,
                dropdownColor: inputTypeColor(widget.widgetSetting.inputType),
                hint: Text(widget.widgetSetting.description ?? ''),
                onChanged: (widget.widgetSetting.enabled)
                    ? (value) {
                        setState(() {
                          widget.widgetSetting.mapValues
                              .addAll({widget.widgetSetting.title: value});
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
