import 'package:ui_maker/vars/widget_types.dart';

// These functions are for if you choose to use non-layout positioning
calculateHeight(WidgetType type, double initialHeight, bool isDropped) {
  double heightRatio = 0.07;
  if (isDropped) {
    heightRatio = 0.14;
  }
  switch (type) {
    case WidgetType.card:
      return (initialHeight * (heightRatio + 0.02));
    case WidgetType.dropdown:
      return (initialHeight *
          ((heightRatio > 0.01) ? heightRatio - 0.01 : heightRatio));
    case WidgetType.checkbox:
      return (initialHeight * (heightRatio));
    case WidgetType.textField:
      return (initialHeight *
          ((heightRatio > 0.09) ? heightRatio - 0.0 : heightRatio));
    case WidgetType.imageSelector:
      return (initialHeight * (heightRatio + 0.02));
  }
}

calculateWidth(WidgetType type, double initialWidth, bool isDropped) {
  double widthRatio = 0.07;
  if (isDropped) {
    widthRatio = 0.14;
  }
  switch (type) {
    case WidgetType.card:
      return (initialWidth * (widthRatio));
    case WidgetType.dropdown:
      return (initialWidth *
          ((widthRatio > 0.02) ? widthRatio - 0.02 : widthRatio));
    case WidgetType.checkbox:
      return (initialWidth * (widthRatio + 0.02));
    case WidgetType.textField:
      return (initialWidth * (widthRatio + 0.05));
    case WidgetType.imageSelector:
      return (initialWidth * (widthRatio + 0.02));
  }
}

/// Dimension Constants
const double creatorBarHeightRatio = 0.1;
