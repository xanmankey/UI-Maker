import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:ui_maker/app/creator_context_menu.dart';
import 'package:ui_maker/app/utils/generate_widget_settings.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/data/isar_db.dart';
import 'package:ui_maker/utils/layout_types.dart';
import 'package:ui_maker/utils/widget_types.dart';
import 'package:ui_maker/data/collections/layout.dart';

// TODO: I'm probably missing something w/ creator_area and creator_base here;
// only testing will allow me to know for certain

/// A flutter widget that can be instanced to create a creator widget.
/// All creator widgets share a few properties:
/// - They are all wrapped inside the CreatorContextMenu - build
/// - They all contain a database which is loaded during initState() - build
/// - They all take a widgetSetting instance as input (if one is not passed,
/// a default one is created) to represent widget values and information
class CreatorBase extends StatefulWidget {
  WidgetSettings? widgetSetting;
  // Each widget takes in a layout because each screen has a layout
  Layout layout;
  WidgetType widgetType;
  Widget creatorWidget;
  CreatorBase({
    super.key,
    required this.creatorWidget,
    required this.widgetType,
    required this.layout,
    this.widgetSetting,
  });

  @override
  State<CreatorBase> createState() => _CreatorBaseState();
}

class _CreatorBaseState extends State<CreatorBase> {
  late Isar isarDB;

  @override
  initState() async {
    widget.widgetSetting ??=
        generateWidgetSettings([widget.widgetType], context)[widget.widgetType];
    isarDB = await db.isarDB;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CreatorContextMenu(
      widgetSetting: widget.widgetSetting!,
      creatorWidget: Draggable(
        feedback: widget.creatorWidget,
        child: widget.creatorWidget,
        onDragCompleted: () async {
          // Write Initial WidgetSettings data to widget settings
          // On any change to widgetSettings, data is also written
          // if (await isarDB.widgetSettings.get(widget.widgetSetting!.id) !=
          //     null) {
          //   isarDB.widgetSettings.delete(widget.widgetSetting!.id);
          // }
          // isarDB
          //     .writeTxn(() => isarDB.widgetSettings.put(widget.widgetSetting!));
          db.updateWidgetSettings([widget.widgetSetting!]);
          widget.layout.widgets.add(widget.widgetSetting!);
          db.updateLayouts([widget.layout]);
        },
        onDragEnd: (details) {},
      ),
    );
  }
}
