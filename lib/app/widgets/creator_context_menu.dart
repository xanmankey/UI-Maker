// A context menu for right-clicking SettingsWidgets
import 'package:ui_maker/data/collections/widget.dart' as data;
import 'package:native_context_menu/native_context_menu.dart';
import 'package:flutter/material.dart';
import 'package:ui_maker/utils/sort_types.dart';

// I'll need to make specific menus for each widget
// But I CAN make a template to make that process easier

class SettingsContextMenu extends StatefulWidget {
  data.Widget setting;
  Widget settingsWidget;
  // Not sure if setState will propogate down to the settingsWidget
  // Function(void Function()) setState;

  SettingsContextMenu({
    super.key,
    required this.setting,
    required this.settingsWidget,
  });

  @override
  State<SettingsContextMenu> createState() => _SettingsContextMenuState();
}

class _SettingsContextMenuState extends State<SettingsContextMenu> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  Storage storage = Storage();

  @override
  void initState() {
    titleController.text = widget.setting.title;
    descriptionController.text = widget.setting.description ?? '';
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
                widget.setting.title = titleController.text;
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
                widget.setting.title = descriptionController.text;
              });
            }),
        NCM.MenuItem(
          title: "Disable/Enable",
          items: [
            NCM.MenuItem(
              title: "Enable",
              onSelected: () {
                setState(() {
                  widget.setting.enabled = true;
                });
              },
            ),
            NCM.MenuItem(
              title: "Disable",
              onSelected: () {
                setState(() {
                  widget.setting.enabled = false;
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
                        await storage.deleteSettings(
                            widget.setting.group ?? [widget.setting.id]);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  )),
            );
            setState(() {
              widget.setting.title = descriptionController.text;
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
                  widget.setting.inputType = InputTypes.button;
                });
              },
            ),
            NCM.MenuItem(
              title: InputTypes.trigger.toString(),
              onSelected: () {
                setState(() {
                  widget.setting.inputType = InputTypes.trigger;
                });
              },
            ),
            NCM.MenuItem(
              title: InputTypes.stick.toString(),
              onSelected: () {
                setState(() {
                  widget.setting.inputType = InputTypes.stick;
                });
              },
            ),
            NCM.MenuItem(
              title: 'none',
              onSelected: () {
                setState(() {
                  widget.setting.inputType = null;
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
                            widget.setting.group ?? [widget.setting.id]);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  )),
            );
            setState(() {
              widget.setting.title = descriptionController.text;
            });
          },
        ),
      ],
      child: widget.settingsWidget,
    );
  }
}
