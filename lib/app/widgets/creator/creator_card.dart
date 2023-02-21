import 'package:auto_size_text/auto_size_text.dart';
import 'package:ui_maker/app/widgets/utility/creator_base.dart';
import 'package:ui_maker/app/widgets/utility/custom_dialog.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:flutter/material.dart';
import 'package:ui_maker/ui_maker.dart';

/// A card widget that can be dragged in the UI by the user
/// to create a custom UI. Can contain widgets created inside the
/// CreatorDialog widget, which is shown when the card is pressed.
///
/// ```
/// class CreatorCard extends StatefulWidget {
///   Layout layout;
///   WidgetSettings widgetSetting;
///   List<WidgetSettings>? dialogSettings;
///   CreatorCard(
///       {super.key,
///       required this.widgetSetting,
///       required this.layout,
///       this.dialogSettings});
///
///   @override
///   State<CreatorCard> createState() => _CreatorCardState();
/// }
///
/// class _CreatorCardState extends State<CreatorCard> {
///   @override
///   Widget build(BuildContext context) {
///     return CreatorBase(
///       widgetSetting: widget.widgetSetting,
///       widgetType: widget.widgetSetting.widgetType,
///       layout: widget.layout,
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
  Layout layout;
  WidgetSettings widgetSetting;
  double? width;
  double? height;
  CreatorCard({
    super.key,
    required this.widgetSetting,
    required this.layout,
    this.width,
    this.height,
  });

  @override
  State<CreatorCard> createState() => CreatorCardState();
}

@visibleForTesting
class CreatorCardState extends State<CreatorCard> {
  @override
  Widget build(BuildContext context) {
    return (widget.widgetSetting.hasDropped)
        ? CreatorBase(
            widgetSetting: widget.widgetSetting,
            widgetType: widget.widgetSetting.widgetType,
            layout: widget.layout,
            context: true,
            creatorWidget: GestureDetector(
              onTap: (() => showDialog(
                  context: context,
                  builder: (context) => CreatorDialog(
                        cardSetting: widget.widgetSetting,
                        widgetSettings: widget.widgetSetting.widgets.toList(),
                        layout: widget.layout,
                      ))),
              child: Expanded(
                child: Card(
                  color: widget.widgetSetting.enabled
                      ? Color(widget.widgetSetting.color)
                      : Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: AutoSizeText(
                      widget.widgetSetting.title,
                    ),
                  ),
                ),
              ),
            ),
          )
        : CreatorBase(
            widgetSetting: widget.widgetSetting,
            widgetType: widget.widgetSetting.widgetType,
            layout: widget.layout,
            context: false,
            creatorWidget: const Card(
              child: Center(
                child: AutoSizeText(
                  "Card",
                ),
              ),
            ),
          );
  }
}
