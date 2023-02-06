enum LayoutType {
  columns,
  rows,
  none;

  @override
  String toString() {
    switch (this) {
      case LayoutType.columns:
        return "columns";
      case LayoutType.rows:
        return "rows";
      case LayoutType.none:
        return "none";
      default:
        return "columns";
    }
  }

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
