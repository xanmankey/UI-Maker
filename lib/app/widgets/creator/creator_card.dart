import 'package:ui_maker/app/widgets/utility/custom_dialog.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:flutter/material.dart';
import 'package:ui_maker/app/creator_context_menu.dart';

/// A card widget that can be dragged in the UI by the user
/// to create a custom UI. Can contain widgets created inside the
/// CreatorDialog widget, which is shown when the card is pressed.
///
/// ```
/// class CreatorCard extends StatefulWidget {
///   WidgetSettings widgetSetting;
///   List<WidgetSettings>? dialogSettings;
///   CreatorCard({super.key, required this.widgetSetting, this.dialogSettings});
///
///   @override
///   State<CreatorCard> createState() => _CreatorCardState();
/// }
///
/// class _CreatorCardState extends State<CreatorCard> {
///   @override
///   Widget build(BuildContext context) {
///     return CreatorContextMenu(
///       widgetSetting: widget.widgetSetting,
///       creatorWidget: GestureDetector(
///         onTap: (() => showDialog(
///             context: context,
///             builder: (context) => CreatorDialog(
///                   cardSetting: widget.widgetSetting,
///                   widgetSettings: widget.dialogSettings,
///                 ))),
///         child: Card(
///           color: widget.widgetSetting.enabled
///               ? Color(widget.widgetSetting.color)
///               : Colors.grey,
///           child: Text(
///             widget.widgetSetting.title,
///           ),
///         ),
///       ),
///     );
///   }
/// }
/// ```
class CreatorCard extends StatefulWidget {
  WidgetSettings widgetSetting;
  List<WidgetSettings>? dialogSettings;
  CreatorCard({super.key, required this.widgetSetting, this.dialogSettings});

  @override
  State<CreatorCard> createState() => _CreatorCardState();
}

class _CreatorCardState extends State<CreatorCard> {
  @override
  Widget build(BuildContext context) {
    return CreatorContextMenu(
      widgetSetting: widget.widgetSetting,
      creatorWidget: GestureDetector(
        onTap: (() => showDialog(
            context: context,
            builder: (context) => CreatorDialog(
                  cardSetting: widget.widgetSetting,
                  widgetSettings: widget.dialogSettings,
                ))),
        child: Card(
          color: widget.widgetSetting.enabled
              ? Color(widget.widgetSetting.color)
              : Colors.grey,
          child: Text(
            widget.widgetSetting.title,
          ),
        ),
      ),
    );
  }
}
