import 'package:flutter/material.dart';

/// A flutter widget that can be instanced to create a creator widget.
/// All creator widgets share a few properties:
/// - They are all wrapped inside the CreatorContextMenu
/// - They all contain a database which is loaded during initState()
/// - They all take a widgetSetting instance as input (if one is not passed,
/// a default one is created) to represent widget values and information
class CreatorBase extends StatefulWidget {
  const CreatorBase({super.key});

  @override
  State<CreatorBase> createState() => _CreatorBaseState();
}

class _CreatorBaseState extends State<CreatorBase> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
