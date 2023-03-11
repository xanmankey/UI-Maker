import 'package:flutter/material.dart';
import 'package:ui_maker/ui_maker.dart';

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
