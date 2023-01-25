import 'package:ui_maker/data/collections/widget.dart' as data;
import 'package:flutter/material.dart';
import 'package:ui_maker/app/widgets/creator_context_menu.dart';

class SettingsField extends StatefulWidget {
  data.Widget setting;
  SettingsWidgets settingsWidget;
  bool title;
  bool description;
  SettingsField({
    super.key,
    required this.setting,
    required this.settingsWidget,
    this.title = true,
    this.description = false,
  });

  @override
  State<SettingsField> createState() => _SettingsFieldState();
}

class _SettingsFieldState extends State<SettingsField> {
  TextEditingController controller = TextEditingController();
  late Color fieldColor;
  @override
  void initState() {
    if (widget.title) {
      controller.text = widget.setting.title;
    } else if (widget.description) {
      controller.text = widget.setting.description ?? '';
    } else if (widget.setting.mapValues.containsKey(widget.setting.title)) {
      controller.text = widget.setting.mapValues[widget.setting.title];
    }
    fieldColor = inputTypeColor(widget.setting.inputType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // If an individual widget, display a form option with validation
    (widget.setting.individual)
        ? TextFormField(
            controller: controller,
            style: TextStyle(
              decorationColor: fieldColor,
            ),
            keyboardType: widget.settingsWidget == SettingsWidgets.numField
                ? TextInputType.number
                : TextInputType.text,
            onFieldSubmitted: (value) {
              if (widget.title) {
                setState(() {
                  widget.setting.title = controller.text;
                });
              } else if (widget.description) {
                setState(() {
                  widget.setting.description = controller.text;
                });
              } else {
                setState(() {
                  widget.setting.mapValues.addAll(
                      {widget.setting.title: int.parse(controller.text)});
                });
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.setting.validation != null
                ? widget.setting.validation
                : ((value) {
                    if (value == null) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),
          )
        : SettingsContextMenu(
            setting: widget.setting,
            settingsWidget: TextField(
              controller: controller,
              style: TextStyle(
                decorationColor: fieldColor,
              ),
              keyboardType: widget.settingsWidget == SettingsWidgets.numField
                  ? TextInputType.number
                  : TextInputType.text,
              onSubmitted: (value) {
                if (widget.title) {
                  setState(() {
                    widget.setting.title = controller.text;
                  });
                } else if (widget.description) {
                  setState(() {
                    widget.setting.description = controller.text;
                  });
                } else {
                  setState(() {
                    widget.setting.mapValues.addAll(
                        {widget.setting.title: int.parse(controller.text)});
                  });
                }
              },
            ),
          );
    throw Exception("Settings field failed to render");
  }
}
