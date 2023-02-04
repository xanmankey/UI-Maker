import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ui_maker/app/widgets/utility/creator_base.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';
import 'package:ui_maker/data/utility/widget_settings_keys.dart';

/// A button widget that uses the file_picker pub dev package
/// to display an image from selection. Defaults to Icons.image.
///
/// ```
/// class CreatorImage extends StatefulWidget {
///   WidgetSettings widgetSetting;
///   Layout layout;
///   CreatorImage({super.key, required this.widgetSetting, required this.layout});
///
///   @override
///   State<CreatorImage> createState() => _CreatorImageState();
/// }
///
/// class _CreatorImageState extends State<CreatorImage> {
///   File? image;
///   @override
///   Widget build(BuildContext context) {
///     return CreatorBase(
///       widgetSetting: widget.widgetSetting,
///       widgetType: widget.widgetSetting.widgetType,
///       layout: widget.layout,
///       creatorWidget: ElevatedButton(
///           onPressed: () async {
///             FilePickerResult? result = await FilePicker.platform.pickFiles();
///             if (result != null) {
///               setState(() {
///                 image = File(result.files.single.path!);
///                 widget.widgetSetting.mapValues
///                     .addAll({WidgetSettingsKeys.imagePath.name: result});
///               });
///             }
///           },
///           child:
///               (image != null) ? Image.file(image!) : const Icon(Icons.image)),
///     );
///   }
/// }
/// ```
class CreatorImage extends StatefulWidget {
  WidgetSettings widgetSetting;
  Layout layout;
  CreatorImage({super.key, required this.widgetSetting, required this.layout});

  @override
  State<CreatorImage> createState() => _CreatorImageState();
}

class _CreatorImageState extends State<CreatorImage> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return CreatorBase(
      widgetSetting: widget.widgetSetting,
      widgetType: widget.widgetSetting.widgetType,
      layout: widget.layout,
      creatorWidget: ElevatedButton(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null) {
              setState(() {
                image = File(result.files.single.path!);
                widget.widgetSetting.mapValues
                    .addAll({WidgetSettingsKeys.imagePath.name: result});
              });
            }
          },
          child:
              (image != null) ? Image.file(image!) : const Icon(Icons.image)),
    );
  }
}
