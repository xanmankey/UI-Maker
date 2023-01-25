import 'package:isar/isar.dart';
import 'package:ui_maker/data/collections/layout.dart';
import 'package:ui_maker/data/collections/widget.dart';

class DB {
  late Future<Isar> isarDB;

  DB() {
    isarDB = openDB();
  }

  Future<Isar> openDB() async {
    late Isar isarDB;
    if (Isar.instanceNames.isEmpty) {
      isarDB = await Isar.open(
        [
          WidgetSchema,
          LayoutSchema,
        ],
        name: "db",
      );
    }
    return isarDB;
  }
}

/// Instantiation of the DB class
DB db = DB();
