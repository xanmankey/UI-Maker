enum LayoutType {
  columns,
  rows,
  none;

  static LayoutType fromString(String string) {
    switch (string) {
      case "rows":
        return LayoutType.rows;
      case "columns":
        return LayoutType.columns;
      case "none":
        return LayoutType.none;
      default:
        return LayoutType.columns;
    }
  }
}
