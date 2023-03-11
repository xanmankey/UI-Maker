// A custom scaffold widget provided for creating a UI_Maker screen
import 'package:flutter/material.dart';
import 'package:ui_maker/app/widgets/creator_area.dart';
import 'package:ui_maker/app/widgets/creator_bar.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/app/utils/generate_layout.dart';
import 'package:ui_maker/data/isar_db.dart';
import 'package:ui_maker/logging.dart';

/// A convenience widget for creating a UI_Maker screen
///
/// ```
/// class CreatorScaffold extends StatefulWidget {
///   String layoutName;
///   CreatorScaffold({super.key, required this.layoutName});
///
///   @override
///   State<CreatorScaffold> createState() => _CreatorScaffoldState();
/// }
///
/// class _CreatorScaffoldState extends State<CreatorScaffold> {
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       body: CreatorArea(layout: generateLayout(widget.layoutName)),
///       bottomNavigationBar: Container(),
///     );
///   }
/// }
/// ```

class CreatorScaffold extends StatefulWidget {
  String layoutName;
  // In case you want to have some widgets load be default
  Layout? layout;
  AppBar? appBar;
  CreatorScaffold({
    super.key,
    required this.layoutName,
    this.layout,
    this.appBar,
  });

  @override
  State<CreatorScaffold> createState() => _CreatorScaffoldState();
}

class _CreatorScaffoldState extends State<CreatorScaffold> {
  Layout? layout;
  bool isOpen = false;
  IconData arrowIcon = Icons.arrow_drop_up;
  Future<List<Layout>>? layoutFuture;
  late PersistentBottomSheetController bottomSheetController;

  @override
  void initState() {
    if (widget.layout != null) {
      layout = widget.layout!;
    } else {
      layoutFuture = db.getLayouts([
        {
          "filter": {"layoutName": widget.layoutName}
        }
      ]);
      // If the layout widget with that layoutName already exists,
      // load it just in case
      layoutFuture!.then(
        (value) {
          logger.info("layoutFuture: ${value.toString()}");
          if (value.isNotEmpty) {
            layout = value.first;
          }
          logger.info(layout);
        },
      );
    }
    // if (layout == null) {
    //   logger.warning("layout is null");
    //   layout = generateLayout(widget.layoutName);
    //   db.updateLayouts([layout!]);
    // }
    super.initState();
  }

//   @override
//   Widget build(BuildContext context) {
//     // Else, generate a layout
//     return Scaffold(
//       appBar: widget.appBar ??
//           AppBar(
//             title: Text(widget.layoutName),
//           ),
//       body: CreatorArea(layout: layout!),
//       persistentFooterButtons: [
//         Builder(builder: (context) {
//           return Center(
//             child: GestureDetector(
//               child: Icon(arrowIcon),
//               onTap: () => setState(() {
//                 isOpen = !isOpen;
//                 // logger.info(isOpen.toString());
//                 if (isOpen) {
//                   arrowIcon = Icons.arrow_drop_down;
//                   bottomSheetController = showBottomSheet(
//                     context: context,
//                     builder: (context) => CreatorBar(layout: layout!),
//                   );
//                 } else {
//                   arrowIcon = Icons.arrow_drop_up;
//                   bottomSheetController.close();
//                 }
//               }),
//             ),
//           );
//         }),
//       ],
//     );
//   }
// }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Layout>>(
      future: layoutFuture,
      builder: (BuildContext context, AsyncSnapshot<List<Layout>> snapshot) {
        if (snapshot.hasData) {
          final layouts = snapshot.data!;
          if (layouts.isNotEmpty) {
            layout = layouts.first;
          }
          if (layout == null) {
            layout = generateLayout(widget.layoutName);
            db.updateLayouts([layout!]);
          }
          return Scaffold(
            appBar: widget.appBar ??
                AppBar(
                  title: Text(widget.layoutName),
                ),
            body: CreatorArea(layout: layout!),
            persistentFooterButtons: [
              Builder(builder: (context) {
                return Center(
                  child: GestureDetector(
                    child: Icon(arrowIcon),
                    onTap: () => setState(() {
                      isOpen = !isOpen;
                      if (isOpen) {
                        arrowIcon = Icons.arrow_drop_down;
                        bottomSheetController = showBottomSheet(
                          context: context,
                          builder: (context) => CreatorBar(layout: layout!),
                        );
                      } else {
                        arrowIcon = Icons.arrow_drop_up;
                        bottomSheetController.close();
                      }
                    }),
                  ),
                );
              }),
            ],
          );
        } else if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
