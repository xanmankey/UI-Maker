import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:flutter/material.dart';
import 'package:ui_maker/app/widgets/creator_context_menu.dart';
import 'package:ui_maker/utils/widget_types.dart';

class CreatorField extends StatefulWidget {
  WidgetSettings widgetSetting;
  WidgetType widgetType;
  bool title;
  bool description;
  CreatorField({
    super.key,
    required this.widgetSetting,
    required this.widgetType,
    this.title = true,
    this.description = false,
  });

  @override
  State<CreatorField> createState() => _CreatorFieldState();
}

class _CreatorFieldState extends State<CreatorField> {
  TextEditingController controller = TextEditingController();
  late Color fieldColor;
  @override
  void initState() {
    if (widget.title) {
      controller.text = widget.widgetSetting.title;
    } else if (widget.description) {
      controller.text = widget.widgetSetting.description ?? '';
    } else if (widget.widgetSetting.mapValues
        .containsKey(widget.widgetSetting.title)) {
      controller.text =
          widget.widgetSetting.mapValues[widget.widgetSetting.title];
    }
    fieldColor = inputTypeColor(widget.widgetSetting.inputType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // If an individual widget, display a form option with validation
    (widget.widgetSetting.individual)
        ? TextFormField(
            controller: controller,
            style: TextStyle(
              decorationColor: fieldColor,
            ),
            keyboardType: widget.widgetType == WidgetType.numField
                ? TextInputType.number
                : TextInputType.text,
            onFieldSubmitted: (value) {
              if (widget.title) {
                setState(() {
                  widget.widgetSetting.title = controller.text;
                });
              } else if (widget.description) {
                setState(() {
                  widget.widgetSetting.description = controller.text;
                });
              } else {
                setState(() {
                  widget.widgetSetting.mapValues.addAll(
                      {widget.widgetSetting.title: int.parse(controller.text)});
                });
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.widgetSetting.validation != null
                ? widget.widgetSetting.validation
                : ((value) {
                    if (value == null) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),
          )
        : CreatorContextMenu(
            widgetSetting: widget.widgetSetting,
            creatorWidget: TextField(
              controller: controller,
              style: TextStyle(
                decorationColor: fieldColor,
              ),
              keyboardType: widget.widgetType == WidgetType.numField
                  ? TextInputType.number
                  : TextInputType.text,
              onSubmitted: (value) {
                if (widget.title) {
                  setState(() {
                    widget.widgetSetting.title = controller.text;
                  });
                } else if (widget.description) {
                  setState(() {
                    widget.widgetSetting.description = controller.text;
                  });
                } else {
                  setState(() {
                    widget.widgetSetting.mapValues.addAll({
                      widget.widgetSetting.title: int.parse(controller.text)
                    });
                  });
                }
              },
            ),
          );
    throw Exception("Settings field failed to render");
  }
}
