// A widget for structuring entries in the character gallery
import 'package:isar/isar.dart';
import 'package:ui_maker/app/creator_area.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:flutter/material.dart';
import 'package:ui_maker/data/isar_db.dart';

/// A dialog widget shown by widgets such as the card widget that allows
/// creator widgets to be placed inside via the ```CreatorArea```
///
/// ```
/// class CreatorDialog extends StatefulWidget {
///   List<WidgetSettings>? widgetSettings;
///   // Note that CreatorDialogs have INDEPENDENT layouts, hence the CreatorArea.
///   // Every instanced CreatorArea comes with its own layout
///   Layout layout;
///   WidgetSettings cardSetting;
///   CreatorDialog({
///     super.key,
///     required this.cardSetting,
///     required this.layout,
///     this.widgetSettings,
///   });
///
///   @override
///   State<CreatorDialog> createState() => _CreatorDialogState();
/// }
///
/// class _CreatorDialogState extends State<CreatorDialog> {
///   late Isar isarDB;
///
///   @override
///   initState() async {
///     isarDB = await db.isarDB;
///     super.initState();
///   }
///
///   @override
///   Widget build(BuildContext context) {
///     return Dialog(
///       child: CreatorArea(
///         layout: widget.layout,
///       ),
///     );
///   }
/// }

/// ```
class CreatorDialog extends StatefulWidget {
  List<WidgetSettings>? widgetSettings;
  // Note that CreatorDialogs have INDEPENDENT layouts, hence the CreatorArea.
  // Every instanced CreatorArea comes with its own layout
  Layout layout;
  WidgetSettings cardSetting;
  CreatorDialog({
    super.key,
    required this.cardSetting,
    required this.layout,
    this.widgetSettings,
  });

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

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: CreatorArea(
        layout: widget.layout,
      ),
    );
  }
}
