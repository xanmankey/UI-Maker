import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:ui_maker/app/utils/calculate_dimensions.dart';
import 'package:ui_maker/app/widgets/creator_context_menu.dart';
import 'package:ui_maker/app/utils/generate_widget_settings.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/data/isar_db.dart';
import 'package:ui_maker/vars/widget_types.dart';
import 'package:ui_maker/data/collections/layout.dart';

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
  bool context;
  bool hasDropped;
  CreatorBase({
    super.key,
    required this.creatorWidget,
    required this.widgetType,
    required this.layout,
    required this.context,
    this.hasDropped = false,
    this.widgetSetting,
  });

  @override
  State<CreatorBase> createState() => _CreatorBaseState();
}

class _CreatorBaseState extends State<CreatorBase> {
  double opacity = 1;

  @override
  initState() {
    widget.widgetSetting ??=
        generateWidgetSettings([widget.widgetType], context)[widget.widgetType];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.context)
        ? CreatorContextMenu(
            widgetSetting: widget.widgetSetting!,
            creatorWidget: Opacity(
              opacity: opacity,
              child: Draggable(
                feedback: SizedBox(
                  height: calculateHeight(widget.widgetType,
                      MediaQuery.of(context).size.height, false),
                  width: calculateWidth(widget.widgetType,
                      MediaQuery.of(context).size.width, false),
                  child: Material(child: widget.creatorWidget),
                ),
                data: {
                  "widgetSetting": widget.widgetSetting,
                  "layout": widget.layout,
                  "opacity": opacity,
                },
                child: Material(child: widget.creatorWidget),
                onDragEnd: (details) {
                  setState(() {
                    opacity = 1;
                  });
                },
                onDragStarted: () {
                  setState(() {
                    opacity = 0.7;
                  });
                },
              ),
            ),
          )
        : Opacity(
            opacity: opacity,
            child: Draggable(
              feedback: SizedBox(
                  height: calculateHeight(widget.widgetType,
                      MediaQuery.of(context).size.height, false),
                  width: calculateWidth(widget.widgetType,
                      MediaQuery.of(context).size.width, false),
                  child: Material(child: widget.creatorWidget)),
              onDragEnd: (details) {},
              data: {
                "widgetSetting": widget.widgetSetting,
                "layout": widget.layout,
                "opacity": opacity,
              },
              child: Material(child: widget.creatorWidget),
            ),
          );
  }
}
