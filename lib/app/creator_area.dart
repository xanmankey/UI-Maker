import 'package:flutter/material.dart';
import 'package:draggable_widget/draggable_widget.dart';
import 'package:isar/isar.dart';
import 'package:ui_maker/app/utils/generate_widgets.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/data/isar_db.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/utils/layout_types.dart';

// TODO: DOCUMENT AND REORGANIZE for planning

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
    isarDB = await db.isarDB;
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DragTarget(
        builder: ((context, candidateData, rejectedData) {
          // Build creator area based on layout
          // TODO: I need a consistent way to ensure that these
          // widgets stay where they are; that means each
          // "group" needs to be ordered.
          // In addition, order data also needs to be SAVED.
          // How can I check the index of something in a ListView?
          switch (widget.layout.layoutType) {
            case LayoutType.columns:
              // Create $numGroups columns for widgets to be placed
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
              // Create $numGroups rows for widgets to be placed
              return Column(
                children: [
                  for (int i = 0; i < widget.layout.numGroups; i++)
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        // return generateWidgets(widgetList[i]);
                      },
                    )
                ],
              );
            case LayoutType.none:
              // Allow widgets to be placed wherever in a specified area
              return Expanded(child: Container());
          }
        }),
        onAcceptWithDetails: (details) {
          // Write data to db
        },
        onMove: (details) {
          // A function for determining where the widgets CAN be moved
          // (based on layout)
        },
      ),
    );
  }
}
