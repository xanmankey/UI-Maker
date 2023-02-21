import 'package:auto_size_text/auto_size_text.dart';
import 'package:ui_maker/app/widgets/utility/creator_base.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:flutter/material.dart';
import 'package:ui_maker/data/utils/widget_settings_keys.dart';

/// A checkbox widget that can be dragged in the UI by the user
/// to create a custom UI. Useful for simple on-and-off states
///
/// ```
/// class CreatorCheckbox extends StatefulWidget {
///   WidgetSettings widgetSetting;
///   Layout layout;
///   CreatorCheckbox({
///     super.key,
///     required this.widgetSetting,
///     required this.layout,
///   });
///
///   @override
///   State<CreatorCheckbox> createState() => _CreatorCheckboxState();
/// }
///
/// class _CreatorCheckboxState extends State<CreatorCheckbox> {
///   @override
///   Widget build(BuildContext context) {
///     return CreatorBase(
///       widgetSetting: widget.widgetSetting,
///       widgetType: widget.widgetSetting.widgetType,
///       layout: widget.layout,
///       creatorWidget: CheckboxListTile(
///         value: true,
///         tileColor: Color(widget.widgetSetting.color),
///         onChanged: (value) {
///           setState(() {
///             widget.widgetSetting.mapValues
///                 .addAll({widget.widgetSetting.title: value});
///           });
///         },
///         title: Text(widget.widgetSetting.title),
///       ),
///     );
///   }
/// }

/// ```
class CreatorCheckbox extends StatefulWidget {
  WidgetSettings widgetSetting;
  Layout layout;
  double width;
  double height;
  CreatorCheckbox({
    super.key,
    required this.widgetSetting,
    required this.layout,
    this.width = 75,
    this.height = 50,
  });

  @override
  State<CreatorCheckbox> createState() => CreatorCheckboxState();
}

@visibleForTesting
class CreatorCheckboxState extends State<CreatorCheckbox> {
  bool testCheckboxState = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.widgetSetting.hasDropped)
        ? CreatorBase(
            widgetSetting: widget.widgetSetting,
            widgetType: widget.widgetSetting.widgetType,
            layout: widget.layout,
            context: true,
            creatorWidget: SizedBox(
              width: widget.width,
              height: widget.height,
              child: CheckboxListTile(
                value: (widget.widgetSetting.mapValues
                        .containsKey(WidgetSettingsKeys.checkboxState.name))
                    ? widget.widgetSetting
                        .mapValues[WidgetSettingsKeys.checkboxState.name]
                    : false,
                tileColor: Color(widget.widgetSetting.color),
                onChanged: (value) {
                  setState(() {
                    widget.widgetSetting.mapValues
                        .addAll({WidgetSettingsKeys.checkboxState.name: value});
                    testCheckboxState = value!;
                  });
                },
                secondary: AutoSizeText(widget.widgetSetting.title),
              ),
            ),
          )
        : CreatorBase(
            widgetSetting: widget.widgetSetting,
            widgetType: widget.widgetSetting.widgetType,
            layout: widget.layout,
            context: false,
            creatorWidget: CheckboxListTile(
              value: testCheckboxState,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(() {
                  testCheckboxState = value!;
                });
              },
              secondary: const AutoSizeText(
                "Checkbox",
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
            ),
          );
  }
}
