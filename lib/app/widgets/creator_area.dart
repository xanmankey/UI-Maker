import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:ui_maker/app/utils/calculate_dimensions.dart';
import 'package:ui_maker/app/utils/generate_widgets.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/data/isar_db.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/logging.dart';
import 'package:ui_maker/vars/layout_types.dart';
import 'package:ui_maker/vars/widget_types.dart';

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
  Color borderColor;
  double borderWidth;
  CreatorArea({
    super.key,
    required this.layout,
    this.layoutTypePadding,
    this.borderColor = Colors.black,
    this.borderWidth = 5,
  });

  @override
  State<CreatorArea> createState() => _CreatorAreaState();
}

class _CreatorAreaState extends State<CreatorArea> {
  late Future<List<List<WidgetSettings>>> widgetListFuture;
  List<Future<List<WidgetSettings>>> futureList = [];
  late List<List<WidgetSettings>> widgets;
  bool isLoading = true;

  // Create x number of drag target widgets depending
  // on the layoutType for sorting and snapping purposes.
  @override
  Widget build(BuildContext context) {
    for (int i = 1; i < widget.layout.numGroups; i++) {
      futureList.add(db.getWidgetSettings([
        {
          "filter": {"listviewNum": widget.layout.numGroups},
          "sort": {"listviewIndex": Sort.asc},
        },
      ]));
    }
    widgetListFuture = Future.wait(futureList);
    widgetListFuture.then((value) {
      setState(() {
        widgets = value;
        isLoading = false;
      });
    });
    return (isLoading)
        ? Column(children: const [CircularProgressIndicator()])
        : (widget.layout.layoutType == LayoutType.none)
            ? Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: widget.borderColor, width: widget.borderWidth),
                    ),
                    child: DragTarget(
                      builder: ((context, candidateData, rejectedData) {
                        return Column(
                          children: [
                            for (List<WidgetSettings> widgetSettings in widgets)
                              for (Widget widget in generateWidgets(
                                widgetSettings,
                                widget.layout,
                                positioned: true,
                              ))
                                widget
                          ],
                        );
                      }),
                      onAccept: (Map<String, Object> object) {
                        logger.info("dropping widget");
                        debugPrint("dropping widget");
                        setState(() {
                          db.updateWidgetSettings(
                              [object["widgetSetting"] as WidgetSettings]);
                          widget.layout.widgets
                              .add(object["widgetSetting"] as WidgetSettings);
                          db.updateLayouts([object["layout"] as Layout]);
                        });
                      },
                      onWillAccept: (data) {
                        return checkDragData(data);
                      },
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height *
                        creatorBarHeightRatio,
                    right: 0,
                    child: Column(
                      children: [
                        DropdownButton(
                            items: [
                              for (LayoutType type in LayoutType.values)
                                DropdownMenuItem(
                                    value: type, child: Text(type.toString()))
                            ],
                            value: widget.layout.layoutType,
                            onChanged: ((value) {
                              setState(() {
                                widget.layout.layoutType = value!;
                                db.updateLayouts([widget.layout]);
                              });
                            })),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        ),
                        DropdownButton(
                            items: const [
                              DropdownMenuItem(
                                  value: true, child: Text("True")),
                              DropdownMenuItem(
                                  value: false, child: Text("False"))
                            ],
                            value: widget.layout.filter,
                            onChanged: ((value) {
                              setState(() {
                                widget.layout.filter = value!;
                                db.updateLayouts([widget.layout]);
                              });
                            })),
                      ],
                    ),
                  ),
                ],
              )
            : (widget.layout.layoutType == LayoutType.rows)
                ? Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.borderColor,
                            width: widget.borderWidth,
                          ),
                        ),
                        child: Column(children: [
                          for (int i = 0; i < widget.layout.numGroups; i++)
                            Expanded(
                              child: DragTarget(
                                builder:
                                    ((context, candidateData, rejectedData) {
                                  List<Widget> widgetList = [];
                                  for (List<WidgetSettings> widgetSettings
                                      in widgets) {
                                    widgetList.addAll(generateWidgets(
                                      widgetSettings,
                                      widget.layout,
                                    ));
                                    widgetList.add(Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                widget.layoutTypePadding?.dx ??
                                                    0,
                                            vertical:
                                                widget.layoutTypePadding?.dy ??
                                                    15)));
                                  }
                                  return Row(
                                    children: [
                                      for (Widget widget in widgetList) widget,
                                    ],
                                  );
                                }),
                                onAccept: (Map<String, Object> object) {
                                  logger.info("dropping widget");
                                  debugPrint("dropping widget");
                                  setState(() {
                                    db.updateWidgetSettings([
                                      object["widgetSetting"] as WidgetSettings
                                    ]);
                                    widget.layout.widgets.add(
                                        object["widgetSetting"]
                                            as WidgetSettings);
                                    db.updateLayouts(
                                        [object["layout"] as Layout]);
                                  });
                                },
                                onWillAccept: (data) {
                                  return checkDragData(data);
                                },
                              ),
                            ),
                        ]),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height *
                            creatorBarHeightRatio,
                        right: 0,
                        child: Column(
                          children: [
                            DropdownButton(
                                items: [
                                  for (LayoutType type in LayoutType.values)
                                    DropdownMenuItem(
                                        value: type,
                                        child: Text(type.toString()))
                                ],
                                value: widget.layout.layoutType,
                                onChanged: ((value) {
                                  setState(() {
                                    widget.layout.layoutType = value!;
                                    db.updateLayouts([widget.layout]);
                                  });
                                })),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 0),
                            ),
                            DropdownButton(
                              items: const [
                                DropdownMenuItem(
                                    value: true, child: Text("True")),
                                DropdownMenuItem(
                                    value: false, child: Text("False"))
                              ],
                              value: widget.layout.filter,
                              onChanged: ((value) {
                                setState(() {
                                  widget.layout.filter = value!;
                                  db.updateLayouts([widget.layout]);
                                });
                              }),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.borderColor,
                            width: widget.borderWidth,
                          ),
                        ),
                        child: Row(
                          children: [
                            for (int i = 0; i < widget.layout.numGroups; i++)
                              Expanded(
                                child: DragTarget(
                                  builder:
                                      ((context, candidateData, rejectedData) {
                                    List<Widget> widgetList = [];
                                    for (List<WidgetSettings> widgetSettings
                                        in widgets) {
                                      widgetList.addAll(generateWidgets(
                                        widgetSettings,
                                        widget.layout,
                                      ));
                                      widgetList.add(Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: widget
                                                      .layoutTypePadding?.dx ??
                                                  15,
                                              vertical: widget
                                                      .layoutTypePadding?.dy ??
                                                  0)));
                                    }
                                    return Column(
                                      children: [
                                        for (Widget widget in widgetList)
                                          widget,
                                      ],
                                    );
                                  }),
                                  onAccept: (Map<String, Object> object) {
                                    logger.info("dropping widget");
                                    debugPrint("dropping widget");
                                    setState(() {
                                      db.updateWidgetSettings([
                                        object["widgetSetting"]
                                            as WidgetSettings
                                      ]);
                                      widget.layout.widgets.add(
                                          object["widgetSetting"]
                                              as WidgetSettings);
                                      db.updateLayouts(
                                          [object["layout"] as Layout]);
                                    });
                                  },
                                  onWillAccept: (data) {
                                    return checkDragData(data);
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height *
                            creatorBarHeightRatio *
                            1.5,
                        right: 0,
                        child: Row(
                          children: [
                            DropdownButton(
                                items: [
                                  for (LayoutType type in LayoutType.values)
                                    DropdownMenuItem(
                                        value: type,
                                        child: Text(type.toString()))
                                ],
                                value: widget.layout.layoutType,
                                onChanged: ((value) {
                                  setState(() {
                                    widget.layout.layoutType = value!;
                                    db.updateLayouts([widget.layout]);
                                  });
                                })),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                            ),
                            DropdownButton(
                                items: const [
                                  DropdownMenuItem(
                                      value: true, child: Text("True")),
                                  DropdownMenuItem(
                                      value: false, child: Text("False"))
                                ],
                                value: widget.layout.filter,
                                onChanged: ((value) {
                                  setState(() {
                                    widget.layout.filter = value!;
                                    db.updateLayouts([widget.layout]);
                                  });
                                })),
                          ],
                        ),
                      )
                    ],
                  );
  }
}

bool checkDragData(Object? data) {
  logger.info("checking dragged data");
  debugPrint("checking dragged data");
  if (data is Map<String, Object>) {
    if (data.containsKey("widgetSetting") && data.containsKey("layout")) {
      return true;
    }
  }
  return false;
}
