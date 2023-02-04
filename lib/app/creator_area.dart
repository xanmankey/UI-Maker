import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:ui_maker/app/utils/generate_widgets.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/data/isar_db.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/utils/layout_types.dart';

// TODO: based on custom_dialog, I'm assuming the creator_area
// handles ALL widget and options rendering
// This would be really nice, but will take some time to work out

/// An area dedicated to draggable widgets that can be added to the UI.
/// Widgets should only be placed in designated ```CreatorArea``` widgets
/// so the database backend can handle UI settings and generation accordingly
///
/// ```
/// class CreatorArea extends StatefulWidget {
///   Layout layout;
///   Offset? layoutTypePadding;
///   CreatorArea({super.key, required this.layout, this.layoutTypePadding});
///
///   @override
///   State<CreatorArea> createState() => _CreatorAreaState();
/// }
///
/// class _CreatorAreaState extends State<CreatorArea> {
///   late Isar isarDB;
///   late List<List<WidgetSettings>> widgetList;
///
///   @override
///   void initState() async {
///     for (int i = 1; i < widget.layout.numGroups; i++) {
///       widgetList.add(await isarDB.widgetSettings
///           .where()
///           .filter()
///           .listviewNumEqualTo(i - 1)
///           .sortByListviewIndex()
///           .findAll());
///     }
///     super.initState();
///   }
///
///   // Create x number of drag target widgets depending
///   // on the layoutType for sorting and snapping purposes.
///   @override
///   Widget build(BuildContext context) {
///     return Expanded(
///         child: (widget.layout.layoutType == LayoutType.none)
///             ? DragTarget(builder: ((context, candidateData, rejectedData) {
///                 return Expanded(
///                     child: Column(
///                   children: [
///                     for (List<WidgetSettings> widgetSettings in widgetList)
///                       for (Widget widget in generateWidgets(
///                         widgetSettings,
///                         widget.layout,
///                         positioned: true,
///                       ))
///                         widget
///                   ],
///                 ));
///               }))
///             : (widget.layout.layoutType == LayoutType.rows)
///                 ? Column(
///                     children: [
///                       for (int i = 0; i < widget.layout.numGroups; i++)
///                         Row(
///                           children: [
///                             DragTarget(builder:
///                                 ((context, candidateData, rejectedData) {
///                               // Build creator area based on layout
///                               // Create $numGroups rows (actually listViews) for widgets to be placed
///                               return ListView.builder(
///                                 scrollDirection: Axis.horizontal,
///                                 itemBuilder: (context, index) {
///                                   for (Widget widget in generateWidgets(
///                                       widgetList[i], widget.layout)) {
///                                     return widget;
///                                   }
///                                   return Container();
///                                 },
///                               );
///                             })),
///                             Padding(
///                               padding: EdgeInsets.symmetric(
///                                   horizontal: widget.layoutTypePadding?.dx ?? 0,
///                                   vertical: widget.layoutTypePadding?.dy ?? 15),
///                             )
///                           ],
///                         ),
///                       DropdownButton(
///                           items: [
///                             for (LayoutType type in LayoutType.values)
///                               DropdownMenuItem(child: Text(type.toString()))
///                           ],
///                           value: widget.layout.layoutType,
///                           onChanged: ((value) {
///                             setState(() {
///                               widget.layout.layoutType =
///                                   LayoutType.fromString(value);
///                               db.updateLayouts([widget.layout]);
///                             });
///                           })),
///                       DropdownButton(
///                           items: const [
///                             DropdownMenuItem(child: Text("True")),
///                             DropdownMenuItem(child: Text("False"))
///                           ],
///                           value: widget.layout.filter,
///                           onChanged: ((value) {
///                             setState(() {
///                               widget.layout.filter =
///                                   bool.fromEnvironment(value);
///                               db.updateLayouts([widget.layout]);
///                             });
///                           })),
///                     ],
///                   )
///                 : Row(
///                     children: [
///                       for (int i = 0; i < widget.layout.numGroups; i++)
///                         Column(
///                           children: [
///                             DragTarget(builder:
///                                 ((context, candidateData, rejectedData) {
///                               // Build creator area based on layout
///                               // Create $numGroups rows (actually listViews) for widgets to be placed
///                               return ListView.builder(
///                                 itemBuilder: (context, index) {
///                                   for (Widget widget in generateWidgets(
///                                       widgetList[i], widget.layout)) {
///                                     return widget;
///                                   }
///                                   return Container();
///                                 },
///                               );
///                             })),
///                             Padding(
///                               padding: EdgeInsets.symmetric(
///                                   horizontal:
///                                       widget.layoutTypePadding?.dx ?? 15,
///                                   vertical: widget.layoutTypePadding?.dy ?? 0),
///                             )
///                           ],
///                         ),
///                       DropdownButton(
///                           items: [
///                             for (LayoutType type in LayoutType.values)
///                               DropdownMenuItem(child: Text(type.toString()))
///                           ],
///                           value: widget.layout.layoutType,
///                           onChanged: ((value) {
///                             setState(() {
///                               widget.layout.layoutType =
///                                   LayoutType.fromString(value);
///                               db.updateLayouts([widget.layout]);
///                             });
///                           })),
///                       DropdownButton(
///                           items: const [
///                             DropdownMenuItem(child: Text("True")),
///                             DropdownMenuItem(child: Text("False"))
///                           ],
///                           value: widget.layout.filter,
///                           onChanged: ((value) {
///                             setState(() {
///                               widget.layout.filter =
///                                   bool.fromEnvironment(value);
///                               db.updateLayouts([widget.layout]);
///                             });
///                           })),
///                     ],
///                   )
///
///         /// Decided that writing new widget data should probably
///         /// be handled in the CreatorBase
///         /*
///         onAcceptWithDetails: (details) {
///           // Write new widget data to db
///           // If I could figure out a way to write widgetData here,
///           // then I wouldn't need to worry about a creator_updater
///         }
///         // onMove: (details) {
///         //   // A function for determining where the widgets CAN be moved
///         //   // (based on layout)
///         // },
///         */
///         );
///   }
/// }
/// ```
class CreatorArea extends StatefulWidget {
  Layout layout;
  Offset? layoutTypePadding;
  CreatorArea({super.key, required this.layout, this.layoutTypePadding});

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

  // Create x number of drag target widgets depending
  // on the layoutType for sorting and snapping purposes.
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: (widget.layout.layoutType == LayoutType.none)
            ? DragTarget(builder: ((context, candidateData, rejectedData) {
                return Expanded(
                    child: Column(
                  children: [
                    for (List<WidgetSettings> widgetSettings in widgetList)
                      for (Widget widget in generateWidgets(
                        widgetSettings,
                        widget.layout,
                        positioned: true,
                      ))
                        widget
                  ],
                ));
              }))
            : (widget.layout.layoutType == LayoutType.rows)
                ? Column(
                    children: [
                      for (int i = 0; i < widget.layout.numGroups; i++)
                        Row(
                          children: [
                            DragTarget(builder:
                                ((context, candidateData, rejectedData) {
                              // Build creator area based on layout
                              // Create $numGroups rows (actually listViews) for widgets to be placed
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  for (Widget widget in generateWidgets(
                                      widgetList[i], widget.layout)) {
                                    return widget;
                                  }
                                  return Container();
                                },
                              );
                            })),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: widget.layoutTypePadding?.dx ?? 0,
                                  vertical: widget.layoutTypePadding?.dy ?? 15),
                            )
                          ],
                        ),
                      DropdownButton(
                          items: [
                            for (LayoutType type in LayoutType.values)
                              DropdownMenuItem(child: Text(type.toString()))
                          ],
                          value: widget.layout.layoutType,
                          onChanged: ((value) {
                            setState(() {
                              widget.layout.layoutType =
                                  LayoutType.fromString(value);
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
                              widget.layout.filter =
                                  bool.fromEnvironment(value);
                              db.updateLayouts([widget.layout]);
                            });
                          })),
                    ],
                  )
                : Row(
                    children: [
                      for (int i = 0; i < widget.layout.numGroups; i++)
                        Column(
                          children: [
                            DragTarget(builder:
                                ((context, candidateData, rejectedData) {
                              // Build creator area based on layout
                              // Create $numGroups rows (actually listViews) for widgets to be placed
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  for (Widget widget in generateWidgets(
                                      widgetList[i], widget.layout)) {
                                    return widget;
                                  }
                                  return Container();
                                },
                              );
                            })),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      widget.layoutTypePadding?.dx ?? 15,
                                  vertical: widget.layoutTypePadding?.dy ?? 0),
                            )
                          ],
                        ),
                      DropdownButton(
                          items: [
                            for (LayoutType type in LayoutType.values)
                              DropdownMenuItem(child: Text(type.toString()))
                          ],
                          value: widget.layout.layoutType,
                          onChanged: ((value) {
                            setState(() {
                              widget.layout.layoutType =
                                  LayoutType.fromString(value);
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
                              widget.layout.filter =
                                  bool.fromEnvironment(value);
                              db.updateLayouts([widget.layout]);
                            });
                          })),
                    ],
                  )

        /// Decided that writing new widget data should probably
        /// be handled in the CreatorBase
        /*
        onAcceptWithDetails: (details) {
          // Write new widget data to db
          // If I could figure out a way to write widgetData here,
          // then I wouldn't need to worry about a creator_updater
        }
        // onMove: (details) {
        //   // A function for determining where the widgets CAN be moved
        //   // (based on layout)
        // },
        */
        );
  }
}
