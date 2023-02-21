import 'package:flutter/material.dart';
import 'package:ui_maker/app/widgets/utility/creator_base.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/data/utils/widget_settings_keys.dart';
import 'package:ui_maker/app/widgets/utility/dropdown_item_creator.dart';

// TODO: POTENTIAL ISSUES:
// FutureBuilder with dropdown
// CreatorDropdown() builds using futureBuilder and immediately
// shows dialog on layout load

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

// ALL of the creator widgets need to be reworked slightly to just be empty
// draggable widgets when in the creator bar; perhaps even I should
// just use images instead, and if a certain image is dropped,
// place a creator widget there?
class CreatorDropdown extends StatefulWidget {
  WidgetSettings widgetSetting;
  Layout layout;
  CreatorDropdown({
    super.key,
    required this.widgetSetting,
    required this.layout,
  });

  @override
  State<CreatorDropdown> createState() => CreatorDropdownState();
}

@visibleForTesting
class CreatorDropdownState extends State<CreatorDropdown> {
  late DropdownMenuTypes dropdownInputType = DropdownMenuTypes.string;
  List<DropdownMenuItem<String>>? items;
  int? testDropdownValue = 1;

  @override
  void initState() {
    if (widget.widgetSetting.mapValues
        .containsKey(WidgetSettingsKeys.items.name)) {
      items = valueToItem(
          widget.widgetSetting.mapValues[WidgetSettingsKeys.items.name]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.widgetSetting.hasDropped)
        ? CreatorBase(
            widgetSetting: widget.widgetSetting,
            widgetType: widget.widgetSetting.widgetType,
            layout: widget.layout,
            context: true,
            creatorWidget: (widget.widgetSetting.mapValues
                    .containsKey(WidgetSettingsKeys.items.name))
                ? DropdownButton(
                    items: items,
                    value: (widget.widgetSetting.mapValues
                            .containsKey(WidgetSettingsKeys.currentItem.name))
                        ? widget.widgetSetting
                            .mapValues[WidgetSettingsKeys.currentItem.name]
                        : items!.first.value,
                    dropdownColor: Color(widget.widgetSetting.color),
                    hint: Text(widget.widgetSetting.description ?? ''),
                    onChanged: (widget.widgetSetting.enabled)
                        ? (value) {
                            setState(() {
                              widget.widgetSetting.mapValues.addAll(
                                  {WidgetSettingsKeys.currentItem.name: value});
                            });
                          }
                        : null,
                  )
                : FutureBuilder(
                    future: getItems(context),
                    builder: ((context, snapshot) {
                      return DropdownButton(
                          items: snapshot.data,
                          value: (widget.widgetSetting.mapValues.containsKey(
                                  WidgetSettingsKeys.currentItem.name))
                              ? widget.widgetSetting.mapValues[
                                  WidgetSettingsKeys.currentItem.name]
                              : (snapshot.hasData)
                                  ? snapshot.data!.first.value
                                  : null,
                          dropdownColor: Color(widget.widgetSetting.color),
                          hint: Text(widget.widgetSetting.description ?? ''),
                          onChanged: (widget.widgetSetting.enabled)
                              ? (value) {
                                  setState(() {
                                    widget.widgetSetting.mapValues.addAll({
                                      WidgetSettingsKeys.currentItem.name: value
                                    });
                                  });
                                }
                              : null);
                    })))
        : CreatorBase(
            widgetSetting: widget.widgetSetting,
            widgetType: widget.widgetSetting.widgetType,
            layout: widget.layout,
            context: false,
            // I'm not sure why this is required here but won't work in the creator base
            creatorWidget: DropdownButton(
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("1"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("2"),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text("3"),
                ),
              ],
              value: testDropdownValue ?? 1,
              hint: Text(widget.widgetSetting.description ?? ''),
              onChanged: (value) {
                setState(() {
                  testDropdownValue = value;
                });
              },
            ),
          );
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
