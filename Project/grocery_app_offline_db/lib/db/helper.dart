import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


const tblGroceryItem = 'grocery_item';
const colId = 'id';
const colName = 'name';
const colQuantity = 'quantity';
const colCategory  = 'category';

Future<Database> initializeDatabase() async {
  final databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'grocery.db');
  
  
  return openDatabase(
      path,
    version: 1,
    onCreate: (db, version) {
        db.execute(
          "CREATE TABLE $tblGroceryItem ($colId INTEGER PRIMARY KEY AUTOINCREMENT, "
              "$colName TEXT, $colQuantity INTEGER, $colCategory TEXT)",
        );
    }
  );
}