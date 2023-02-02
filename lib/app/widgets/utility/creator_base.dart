import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:ui_maker/app/creator_context_menu.dart';
import 'package:ui_maker/app/utils/generate_widget_settings.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/data/isar_db.dart';
import 'package:ui_maker/utils/widget_types.dart';

// Scrapped this idea for the moment because I wasn't sure of the best way
// to go about implementation

/// A flutter widget that can be instanced to create a creator widget.
/// All creator widgets share a few properties:
/// - They are all wrapped inside the CreatorContextMenu - build
/// - They all contain a database which is loaded during initState() - build
/// - They all take a widgetSetting instance as input (if one is not passed,
/// a default one is created) to represent widget values and information
/*
class CreatorBase extends InheritedWidget {
  WidgetSettings? widgetSetting;
  WidgetType widgetType;
  Widget creatorWidget;
  Future<Isar> isarDB;
  CreatorBase({
    super.key,
    required this.creatorWidget,
    required this.widgetType,
    this.widgetSetting,
  })  : isarDB = db.isarDB,
        super(child: creatorWidget);

  static CreatorBase? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CreatorBase>();
  }

  @override
  bool updateShouldNotify(CreatorBase oldWidget) {
    return widgetSetting != oldWidget.widgetSetting;
  }
}

class _CreatorBaseState extends State<CreatorBase> {
  @override
  initState() async {
    widget.db = await db.isarDB;
    widget.widgetSetting ??=
        generateWidgetSettings([widget.widgetType], context)[widget.widgetType];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CreatorContextMenu(
      widgetSetting: widget.widgetSetting!,
      creatorWidget: widget.creatorWidget,
    );
  }
}
*/