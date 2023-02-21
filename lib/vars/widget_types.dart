import 'package:flutter/material.dart';
import 'package:ui_maker/app/widgets/creator/creator_card.dart';
import 'package:ui_maker/app/widgets/creator/creator_checkbox.dart';
import 'package:ui_maker/app/widgets/creator/creator_dropdown.dart';
import 'package:ui_maker/app/widgets/creator/creator_field.dart';
import 'package:ui_maker/app/widgets/creator/creator_image.dart';
import 'package:ui_maker/data/collections/widget_settings.dart';

enum WidgetType {
  card,
  dropdown,
  checkbox,
  textField,
  imageSelector;
  // get types => WidgetType.values;

  Type toWidgetType() {
    switch (this) {
      case card:
        return CreatorCard;
      case dropdown:
        return CreatorDropdown;
      case checkbox:
        return CreatorCheckbox;
      case textField:
        return CreatorField;
      case imageSelector:
        return CreatorImage;
    }
  }
}
