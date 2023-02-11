enum MenuOptions {
  title,
  description,
  color,
  enabledState,
  delete;

  int toId() {
    switch (this) {
      case title:
        return 1;
      case description:
        return 2;
      case color:
        return 3;
      case enabledState:
        return 4;
      case delete:
        return 5;
    }
  }
}
