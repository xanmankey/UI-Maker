import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:ui_maker/ui_maker.dart';

// Now what in the world do I want main.dart to look like?
// Also, because I'm using a database solution how do I not screw up my publication
// of the library based on my example data?

// TODO: I would love a scaffold (although that wouldn't account for dialogs;
// I'd need to isolate that code so it can be reused) that AUTOMATICALLY creates
// a layout with

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
    return CreatorScaffold(layoutName: "MyUIMaker");
  }
}
