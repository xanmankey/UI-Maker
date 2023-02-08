// A custom scaffold widget provided for creating a UI_Maker screen
import 'package:flutter/material.dart';
import 'package:ui_maker/app/widgets/creator_area.dart';
import 'package:ui_maker/app/widgets/creator_bar.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/app/utils/generate_layout.dart';

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
  CreatorScaffold(
      {super.key, required this.layoutName, this.layout, this.appBar});

  @override
  State<CreatorScaffold> createState() => _CreatorScaffoldState();
}

class _CreatorScaffoldState extends State<CreatorScaffold> {
  late Layout layout;

  @override
  void initState() {
    if (widget.layout != null) {
      layout = widget.layout!;
    } else {
      layout = generateLayout(widget.layoutName);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar ??
          AppBar(
            title: Text(widget.layoutName),
          ),
      body: CreatorArea(layout: layout),
      bottomNavigationBar: CreatorBar(
        layout: layout,
      ),
    );
  }
}
