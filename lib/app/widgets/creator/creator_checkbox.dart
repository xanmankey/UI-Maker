library ui_maker;

export 'creator_checkbox.dart';

import 'package:ui_maker/app/widgets/utility/creator_base.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:flutter/material.dart';

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
  CreatorCheckbox({
    super.key,
    required this.widgetSetting,
    required this.layout,
  });

  @override
  State<CreatorCheckbox> createState() => _CreatorCheckboxState();
}

class _CreatorCheckboxState extends State<CreatorCheckbox> {
  @override
  Widget build(BuildContext context) {
    return CreatorBase(
      widgetSetting: widget.widgetSetting,
      widgetType: widget.widgetSetting.widgetType,
      layout: widget.layout,
      creatorWidget: CheckboxListTile(
        value: true,
        tileColor: Color(widget.widgetSetting.color),
        onChanged: (value) {
          setState(() {
            widget.widgetSetting.mapValues
                .addAll({widget.widgetSetting.title: value});
          });
        },
        title: Text(widget.widgetSetting.title),
      ),
    );
  }
}
