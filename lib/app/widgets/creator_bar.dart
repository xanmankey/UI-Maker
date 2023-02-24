// A toolbar supporting various drag and drop flutter widgets
// to aid in program and gamemode creation

import 'package:ui_maker/app/utils/calculate_dimensions.dart';
import 'package:ui_maker/app/utils/generate_widget_settings.dart';
import 'package:ui_maker/app/widgets/creator/creator_field.dart';
import 'package:ui_maker/app/widgets/creator/creator_card.dart';
import 'package:ui_maker/app/widgets/creator/creator_dropdown.dart';
import 'package:ui_maker/app/widgets/creator/creator_checkbox.dart';
import 'package:ui_maker/app/widgets/creator/creator_image.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:flutter/material.dart';
import 'package:ui_maker/logging.dart';
import 'package:ui_maker/vars/widget_types.dart';

/// A toolbar widget that appears at the bottom of your screen for dragging
/// and dropping creator widgets. If you want to create a creator widget,
/// right now you can add it manually via the ```CreatorBar```, but I am
/// considering a folder-based workaround
///
/// ```
/// class CreatorBar extends StatefulWidget {
///   WidgetSettings widgetSetting;
///   Layout layout;
///   CreatorBar({super.key, required this.widgetSetting, required this.layout});
///
///   @override
///   State<CreatorBar> createState() => _CreatorBarState();
/// }
///
/// class _CreatorBarState extends State<CreatorBar> {
///   @override
///   Widget build(BuildContext context) {
///     bool visible = false;
///     IconData arrowIcon = Icons.arrow_drop_up;
///     List<Widget> items = [];
///     return Visibility(
///       visible: visible,
///       replacement: GestureDetector(
///         child: Icon(arrowIcon),
///         onTap: () => setState(() {
///           visible = !visible;
///           if (visible) {
///             Map<WidgetType, WidgetSettings> widgetSettings =
///                 createWidgetSettings(WidgetType.values);
///             items = [
///               CreatorCheckbox(
///                 widgetSetting: widgetSettings[WidgetType.checkbox]!,
///                 layout: widget.layout,
///               ),
///               CreatorCard(
///                 widgetSetting: widgetSettings[WidgetType.card]!,
///                 layout: widget.layout,
///               ),
///               CreatorField(
///                 widgetSetting: widgetSettings[WidgetType.numField]!,
///                 widgetType: WidgetType.numField,
///                 layout: widget.layout,
///               ),
///               CreatorDropdown(
///                 widgetSetting: widgetSettings[WidgetType.textField]!,
///                 layout: widget.layout,
///               ),
///               CreatorField(
///                 widgetSetting: widgetSettings[WidgetType.textField]!,
///                 widgetType: WidgetType.textField,
///                 layout: widget.layout,
///               ),
///               CreatorDropdown(
///                 widgetSetting: widgetSettings[WidgetType.dropdown]!,
///                 layout: widget.layout,
///               ),
///               CreatorImage(
///                 widgetSetting: widgetSettings[WidgetType.imageSelector]!,
///                 layout: widget.layout,
///               )
///             ];
///           }
///         }),
///       ),
///       child: ListView.separated(
///         scrollDirection: Axis.horizontal,
///         itemBuilder: (context, index) {
///           for (Widget widget in items) {
///             return widget;
///           }
///           throw Exception('No widgets were created for the creator bar');
///         },
///         itemCount: items.length,
///         separatorBuilder: (context, index) {
///           for (int i = 0; i < index; i++) {
///             return const Padding(
///                 padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10));
///           }
///           throw Exception('Padding failed to be created for the creator bar');
///         },
///       ),
///     );
///   }
/// }
/// ```
class CreatorBar extends StatefulWidget {
  Layout layout;
  // bool isOpen;
  Color borderColor;
  double borderWidth;
  CreatorBar({
    super.key,
    required this.layout,
    // this.isOpen = false,
    this.borderColor = Colors.blue,
    this.borderWidth = 3,
  });

  @override
  State<CreatorBar> createState() => _CreatorBarState();
}

class _CreatorBarState extends State<CreatorBar> {
  // bool isOpen = false;
  IconData arrowIcon = Icons.arrow_drop_up;
  Map<WidgetType, WidgetSettings> widgetSettings = generateWidgetSettings(
      [for (WidgetType type in WidgetType.values) type], null);
  List<Widget> items = [];
  late PersistentBottomSheetController bottomSheetController;

  @override
  void initState() {
    items = [
      CreatorCard(
        widgetSetting: widgetSettings[WidgetType.card]!,
        layout: widget.layout,
      ),
      CreatorCheckbox(
        widgetSetting: widgetSettings[WidgetType.checkbox]!,
        layout: widget.layout,
      ),
      CreatorDropdown(
        widgetSetting: widgetSettings[WidgetType.dropdown]!,
        layout: widget.layout,
      ),
      CreatorField(
        widgetSetting: widgetSettings[WidgetType.textField]!,
        widgetType: WidgetType.textField,
        layout: widget.layout,
      ),
      CreatorImage(
        widgetSetting: widgetSettings[WidgetType.imageSelector]!,
        layout: widget.layout,
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return (widget.isOpen)
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.borderColor,
          width: widget.borderWidth,
        ),
      ),
      child: BottomSheet(
        enableDrag: false,
        constraints: BoxConstraints(
            maxHeight:
                MediaQuery.of(context).size.height * creatorBarHeightRatio),
        builder: (context) {
          double height = MediaQuery.of(context).size.height;
          double width = MediaQuery.of(context).size.width;
          double spacing = (width / (WidgetType.values.length * 4));
          return Row(children: [
            for (Widget widget in items)
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.015,
                  horizontal: spacing,
                ),
                child: widget,
              ))
          ]);
        },
        onClosing: () {},
      ),
    );
  }
}
