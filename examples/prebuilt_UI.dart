import 'package:flutter/material.dart';
import 'package:ui_maker/ui_maker.dart';
import '../test/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UIMaker(),
    );
  }
}

class UIMaker extends StatefulWidget {
  UIMaker({super.key});

  @override
  State<UIMaker> createState() => _UIMakerState();
}

class _UIMakerState extends State<UIMaker> {
  @override
  Widget build(BuildContext context) {
    return CreatorScaffold(
      layoutName: "MyUIMaker",
      layout: Layout()
        ..layoutName = "MyUIMaker"
        ..widgets.addAll([
          for (WidgetSettings setting in TestUtils.widgetSettings.values)
            setting
        ])
        ..numGroups = 1
        ..width =
            MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width
        ..height = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .height,
    );
  }
}
