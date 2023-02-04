import 'package:flutter/material.dart';
import 'package:ui_maker/app/widgets/utility/creator_base.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/data/utility/widget_settings_keys.dart';
import 'package:ui_maker/app/widgets/utility/dropdown_item_creator.dart';

// TODO: POTENTIAL ISSUES:
// FutureBuilder with dropdown

/// A dropdown widget that can be dragged in the UI by the user
/// to create a custom UI. Useful for more dynamic selections and input,
/// while still maintaining clean(ish) UI.
/// The dropdown widget has its own dialog in the ```DropdownItemCreator```
///
/// ```
/// class CreatorDropdown extends StatefulWidget {
///   WidgetSettings widgetSetting;
///   Layout layout;
///   CreatorDropdown({
///     super.key,
///     required this.widgetSetting,
///     required this.layout,
///   });
///
///   @override
///   State<CreatorDropdown> createState() => _CreatorDropdownState();
/// }
///
/// class _CreatorDropdownState extends State<CreatorDropdown> {
///   late DropdownMenuTypes dropdownInputType = DropdownMenuTypes.string;
///   @override
///   Widget build(BuildContext context) {
///     return CreatorBase(
///         widgetSetting: widget.widgetSetting,
///         widgetType: widget.widgetSetting.widgetType,
///         layout: widget.layout,
///         creatorWidget: (widget.widgetSetting.mapValues
///                 .containsKey(WidgetSettingsKeys.items.name))
///             ? DropdownButton(
///                 items: valueToItem(widget
///                     .widgetSetting.mapValues[WidgetSettingsKeys.items.name]),
///                 // value: widget.widgetSetting.enabled,
///                 dropdownColor: Color(widget.widgetSetting.color),
///                 hint: Text(widget.widgetSetting.description ?? ''),
///                 onChanged: (widget.widgetSetting.enabled)
///                     ? (value) {
///                         setState(() {
///                           widget.widgetSetting.mapValues
///                               .addAll({widget.widgetSetting.title: value});
///                         });
///                       }
///                     : null)
///             : FutureBuilder(
///                 future: getItems(context),
///                 builder: ((context, snapshot) {
///                   return DropdownButton(
///                       items: snapshot.data,
///                       // value: widget.widgetSetting.enabled,
///                       dropdownColor: Color(widget.widgetSetting.color),
///                       hint: Text(widget.widgetSetting.description ?? ''),
///                       onChanged: (widget.widgetSetting.enabled)
///                           ? (value) {
///                               setState(() {
///                                 widget.widgetSetting.mapValues.addAll(
///                                     {widget.widgetSetting.title: value});
///                               });
///                             }
///                           : null);
///                 })));
///   }
/// }
/// ```
class CreatorDropdown extends StatefulWidget {
  WidgetSettings widgetSetting;
  Layout layout;
  CreatorDropdown({
    super.key,
    required this.widgetSetting,
    required this.layout,
  });

  @override
  State<CreatorDropdown> createState() => _CreatorDropdownState();
}

class _CreatorDropdownState extends State<CreatorDropdown> {
  late DropdownMenuTypes dropdownInputType = DropdownMenuTypes.string;
  @override
  Widget build(BuildContext context) {
    return CreatorBase(
        widgetSetting: widget.widgetSetting,
        widgetType: widget.widgetSetting.widgetType,
        layout: widget.layout,
        creatorWidget: (widget.widgetSetting.mapValues
                .containsKey(WidgetSettingsKeys.items.name))
            ? DropdownButton(
                items: valueToItem(widget
                    .widgetSetting.mapValues[WidgetSettingsKeys.items.name]),
                // value: widget.widgetSetting.enabled,
                dropdownColor: Color(widget.widgetSetting.color),
                hint: Text(widget.widgetSetting.description ?? ''),
                onChanged: (widget.widgetSetting.enabled)
                    ? (value) {
                        setState(() {
                          widget.widgetSetting.mapValues
                              .addAll({widget.widgetSetting.title: value});
                        });
                      }
                    : null)
            : FutureBuilder(
                future: getItems(context),
                builder: ((context, snapshot) {
                  return DropdownButton(
                      items: snapshot.data,
                      // value: widget.widgetSetting.enabled,
                      dropdownColor: Color(widget.widgetSetting.color),
                      hint: Text(widget.widgetSetting.description ?? ''),
                      onChanged: (widget.widgetSetting.enabled)
                          ? (value) {
                              setState(() {
                                widget.widgetSetting.mapValues.addAll(
                                    {widget.widgetSetting.title: value});
                              });
                            }
                          : null);
                })));
  }
}

/// A function for returning the DropdownMenuItems from the ```DropdownItemCreator```
/// dialog
///
/// ```
/// Future<List<DropdownMenuItem<String>>?> getItems(BuildContext context) async {
///   await showDialog(
///       context: context, builder: (context) => const DropdownItemCreator());
/// }
/// ```
Future<List<DropdownMenuItem<String>>?> getItems(BuildContext context) async {
  await showDialog(
      context: context, builder: (context) => const DropdownItemCreator());
}
