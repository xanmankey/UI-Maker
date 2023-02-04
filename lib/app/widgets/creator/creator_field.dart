library ui_maker;

export 'creator_field.dart';

import 'package:ui_maker/app/widgets/utility/creator_base.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:flutter/material.dart';
import 'package:ui_maker/data/utility/widget_settings_keys.dart';
import 'package:ui_maker/utils/widget_types.dart';

/// A field widget that can be dragged in the UI by the user
/// to create a custom UI. Supports number and text inputs
///
/// ```
/// class CreatorField extends StatefulWidget {
///   WidgetSettings widgetSetting;
///   WidgetType widgetType;
///   bool title;
///   bool description;
///   Layout layout;
///   CreatorField({
///     super.key,
///     required this.widgetSetting,
///     required this.widgetType,
///     required this.layout,
///     this.title = true,
///     this.description = false,
///   });
///
///   @override
///   State<CreatorField> createState() => _CreatorFieldState();
/// }
///
/// class _CreatorFieldState extends State<CreatorField> {
///   TextEditingController controller = TextEditingController();
///   @override
///   void initState() {
///     if (widget.title) {
///       controller.text = widget.widgetSetting.title;
///     } else if (widget.description) {
///       controller.text = widget.widgetSetting.description ?? '';
///     } else if (widget.widgetSetting.mapValues
///         .containsKey(widget.widgetSetting.title)) {
///       controller.text =
///           widget.widgetSetting.mapValues[widget.widgetSetting.title];
///     }
///     super.initState();
///   }
///
///   @override
///   Widget build(BuildContext context) {
///     return CreatorBase(
///       widgetSetting: widget.widgetSetting,
///       widgetType: widget.widgetType,
///       layout: widget.layout,
///       creatorWidget: TextFormField(
///         controller: controller,
///         style: TextStyle(
///           decorationColor: Color(widget.widgetSetting.color),
///         ),
///         keyboardType: widget.widgetType == WidgetType.numField
///             ? TextInputType.number
///             : TextInputType.text,
///         onFieldSubmitted: (value) {
///           if (widget.title) {
///             setState(() {
///               widget.widgetSetting.title = controller.text;
///             });
///           } else if (widget.description) {
///             setState(() {
///               widget.widgetSetting.description = controller.text;
///             });
///           } else {
///             setState(() {
///               if (widget.widgetType == WidgetType.numField) {
///                 widget.widgetSetting.mapValues.addAll({
///                   WidgetSettingsKeys.fieldText.name: int.parse(controller.text)
///                 });
///               } else {
///                 widget.widgetSetting.mapValues.addAll(
///                     {WidgetSettingsKeys.fieldText.name: controller.text});
///               }
///             });
///           }
///         },
///       ),
///     );
///   }
/// }

/// ```
class CreatorField extends StatefulWidget {
  WidgetSettings widgetSetting;
  WidgetType widgetType;
  bool title;
  bool description;
  Layout layout;
  CreatorField({
    super.key,
    required this.widgetSetting,
    required this.widgetType,
    required this.layout,
    this.title = true,
    this.description = false,
  });

  @override
  State<CreatorField> createState() => _CreatorFieldState();
}

class _CreatorFieldState extends State<CreatorField> {
  TextEditingController controller = TextEditingController();
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CreatorBase(
      widgetSetting: widget.widgetSetting,
      widgetType: widget.widgetType,
      layout: widget.layout,
      creatorWidget: TextFormField(
        controller: controller,
        style: TextStyle(
          decorationColor: Color(widget.widgetSetting.color),
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
              if (widget.widgetType == WidgetType.numField) {
                widget.widgetSetting.mapValues.addAll({
                  WidgetSettingsKeys.fieldText.name: int.parse(controller.text)
                });
              } else {
                widget.widgetSetting.mapValues.addAll(
                    {WidgetSettingsKeys.fieldText.name: controller.text});
              }
            });
          }
        },
      ),
    );
  }
}
