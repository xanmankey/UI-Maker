/*
import 'package:flutter/material.dart';
import 'package:draggable_widget/draggable_widget.dart';
import 'package:isar/isar.dart';
import 'package:ui_maker/app/utils/generate_widgets.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/data/isar_db.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/utils/layout_types.dart';

/// An area dedicated to draggable widgets that can be added to the UI.
/// Widgets should only be placed in designated ```CreatorArea``` widgets
/// so the database backend can handle UI settings and generation accordingly
///
/// ```
///
/// ```
class CreatorArea extends StatefulWidget {
  Layout layout;
  CreatorArea({super.key, required this.layout});

  @override
  State<CreatorArea> createState() => _CreatorAreaState();
}

class _CreatorAreaState extends State<CreatorArea> {
  late Isar isarDB;
  late List<List<WidgetSettings>> widgetList;

  @override
  void initState() async {
    for (int i = 1; i < widget.layout.numGroups; i++) {
      widgetList.add(await isarDB.widgetSettings
          .where()
          .filter()
          .listviewNumEqualTo(i - 1)
          .sortByListviewIndex()
          .findAll());
    }
    super.initState();
  }

  // TODO: implement this new CreatorArea idea
  // The idea here could be to create x number of drag target widgets depending
  // on the layoutType.
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          DragTarget(
            builder: ((context, candidateData, rejectedData) {
              // Build creator area based on layout
              switch (widget.layout.layoutType) {
                case LayoutType.columns:
                  // Create $numGroups columns (actually listViews) for widgets to be placed
                  return Row(
                    children: [
                      for (int i = 0; i < widget.layout.numGroups; i++)
                        ListView.builder(
                          itemBuilder: (context, index) {
                            return generateWidgets(widgetList[i]);
                          },
                        )
                    ],
                  );
                case LayoutType.rows:
                  // Create $numGroups rows (actually listViews) for widgets to be placed
                  return Column(
                    children: [
                      for (int i = 0; i < widget.layout.numGroups; i++)
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return generateWidgets(widgetList[i]);
                          },
                        )
                    ],
                  );
                case LayoutType.none:
                  // Allow widgets to be placed wherever in a specified area
                  return Expanded(
                      child: Column(
                    children: [
                      for (List<WidgetSettings> widgetSettings in widgetList)
                        generateWidgets(widgetSettings, positioned: true)
                    ],
                  ));
              }
            }),

            /// Decided that writing new widget data should probably
            /// be handled in the CreatorBase
            /*
            onAcceptWithDetails: (details) {
              // Write new widget data to db
              // If I could figure out a way to write widgetData here,
              // then I wouldn't need to worry about a creator_updater
            },
            */
            // onMove: (details) {
            //   // A function for determining where the widgets CAN be moved
            //   // (based on layout)
            // },
          ),
          Column(
            children: [
              DropdownButton(
                  items: [
                    for (LayoutType type in LayoutType.values)
                      DropdownMenuItem(child: Text(type.toString()))
                  ],
                  value: widget.layout.layoutType,
                  onChanged: ((value) {
                    setState(() {
                      widget.layout.layoutType = LayoutType.fromString(value);
                      db.updateLayouts([widget.layout]);
                    });
                  })),
              DropdownButton(
                  items: const [
                    DropdownMenuItem(child: Text("True")),
                    DropdownMenuItem(child: Text("False"))
                  ],
                  value: widget.layout.filter,
                  onChanged: ((value) {
                    setState(() {
                      widget.layout.filter = bool.fromEnvironment(value);
                      db.updateLayouts([widget.layout]);
                    });
                  })),
            ],
          ),
        ],
      ),
    );
  }
}

*/