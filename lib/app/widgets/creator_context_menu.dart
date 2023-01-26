// A context menu for right-clicking WidgetType
import 'package:isar/isar.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/data/isar_db.dart';
import 'package:native_context_menu/native_context_menu.dart' as NCM;
import 'package:flutter/material.dart';
import 'package:ui_maker/utils/sort_types.dart';

// I'll need to make specific menus for each widget
// But I CAN make a template to make that process easier

class CreatorContextMenu extends StatefulWidget {
  WidgetSettings widgetSetting;
  Widget creatorWidget;
  // Not sure if setState will propogate down to the settingsWidget
  // Function(void Function()) setState;

  CreatorContextMenu({
    super.key,
    required this.widgetSetting,
    required this.creatorWidget,
  });

  @override
  State<CreatorContextMenu> createState() => _CreatorContextMenuState();
}

class _CreatorContextMenuState extends State<CreatorContextMenu> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  late Isar isarDB;

  @override
  void initState() async {
    titleController.text = widget.widgetSetting.title;
    descriptionController.text = widget.widgetSetting.description ?? '';
    isarDB = await db.isarDB;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NCM.ContextMenuRegion(
      menuItems: [
        NCM.MenuItem(
            title: "Title",
            onSelected: () async {
              await showDialog(
                context: context,
                builder: ((context) => AlertDialog(
                      title: TextField(controller: titleController),
                    )),
              );
              setState(() {
                widget.widgetSetting.title = titleController.text;
              });
            }),
        NCM.MenuItem(
            title: "Description",
            onSelected: () async {
              await showDialog(
                context: context,
                builder: ((context) => AlertDialog(
                      title: TextField(controller: descriptionController),
                    )),
              );
              setState(() {
                widget.widgetSetting.title = descriptionController.text;
              });
            }),
        NCM.MenuItem(
          title: "Disable/Enable",
          items: [
            NCM.MenuItem(
              title: "Enable",
              onSelected: () {
                setState(() {
                  widget.widgetSetting.enabled = true;
                });
              },
            ),
            NCM.MenuItem(
              title: "Disable",
              onSelected: () {
                setState(() {
                  widget.widgetSetting.enabled = false;
                });
              },
            ),
          ],
        ),
        NCM.MenuItem(
          title: "Delete",
          onSelected: () async {
            await showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    title: const Text(
                        "Are you sure you want to delete this setting?"),
                    content: IconButton(
                      onPressed: () async {
                        await db.deleteSettings(widget.widgetSetting.group ??
                            [widget.widgetSetting.id]);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  )),
            );
            setState(() {
              widget.widgetSetting.title = descriptionController.text;
            });
          },
        ),
        NCM.MenuItem(
          title: "Input type",
          items: [
            NCM.MenuItem(
              title: InputTypes.button.toString(),
              onSelected: () {
                setState(() {
                  widget.widgetSetting.inputType = InputTypes.button;
                });
              },
            ),
            NCM.MenuItem(
              title: InputTypes.trigger.toString(),
              onSelected: () {
                setState(() {
                  widget.widgetSetting.inputType = InputTypes.trigger;
                });
              },
            ),
            NCM.MenuItem(
              title: InputTypes.stick.toString(),
              onSelected: () {
                setState(() {
                  widget.widgetSetting.inputType = InputTypes.stick;
                });
              },
            ),
            NCM.MenuItem(
              title: 'none',
              onSelected: () {
                setState(() {
                  widget.widgetSetting.inputType = null;
                });
              },
            ),
          ],
          onSelected: () async {
            await showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    title: const Text(
                        "Are you sure you want to delete this setting?"),
                    content: IconButton(
                      onPressed: () async {
                        await storage.deleteSettings(
                            widget.widgetSetting.group ??
                                [widget.widgetSetting.id]);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  )),
            );
            setState(() {
              widget.widgetSetting.title = descriptionController.text;
            });
          },
        ),
      ],
      child: widget.creatorWidget,
    );
  }
}
