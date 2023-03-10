/// An enumerator with constants used as keys for specific widget data
/// in the widget_settings mapValues map. The main purpose is to provide
/// a method for consistency for accessing and writing map values
/// in the UI frontend and database backend respectfully.
///
/// ```
/// enum WidgetSettingsKeys {
///   // Dropdown widget items
///   items,
///   // The path to an image
///   imagePath,
///   // A custom text field validator
///   validator,
///   // An extra text value, e.g. if you have a text field with a value
///   // that isn't a title or description
///   fieldText;
///
///   WidgetSettingsKeys? fromString(String setting) {
///     switch (setting) {
///       case "items":
///         return WidgetSettingsKeys.items;
///       case "imagePath":
///         return WidgetSettingsKeys.imagePath;
///       case "validator":
///         return WidgetSettingsKeys.validator;
///       case "fieldText":
///         return WidgetSettingsKeys.fieldText;
///       default:
///         return null;
///     }
///   }
/// }
/// ```
enum WidgetSettingsKeys {
  // Dropdown widget items
  items,
  // Dropdown widget current item
  currentItem,
  // The path to an image
  imagePath,
  // A custom text field validator
  validator,
  // The value of a text field
  fieldText,
  // The input allowed in a text field (numbers or text)
  isNumKeyboardType,
  // The value of a checkbox
  checkboxState;

  WidgetSettingsKeys? fromString(String setting) {
    switch (setting) {
      case "items":
        return WidgetSettingsKeys.items;
      case "currentItem":
        return WidgetSettingsKeys.currentItem;
      case "imagePath":
        return WidgetSettingsKeys.imagePath;
      case "validator":
        return WidgetSettingsKeys.validator;
      case "fieldText":
        return WidgetSettingsKeys.fieldText;
      case "isNumKeyboardType":
        return WidgetSettingsKeys.isNumKeyboardType;
      case "checkboxState":
        return WidgetSettingsKeys.checkboxState;
      default:
        return null;
    }
  }
}
