import 'package:flutter/material.dart';
import 'package:ui_maker/ui_maker.dart';

// CURRENT WORRIES
// - I incorrectly handled working w/ the db on the backend (e.g. I don't
// write data in generative functions)
// - I should start using EXAMPLES of the code as documentation
// (the copy and pasting of the entire thing was just for me; or maybe
// I should combine the two)
// - NOTHING'S BEEN TESTED

void main() {
  runApp(const UIMaker());
}

class UIMaker extends StatelessWidget {
  const UIMaker({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CreatorScaffold(layoutName: "MyUIMaker"),
    );
  }
}
