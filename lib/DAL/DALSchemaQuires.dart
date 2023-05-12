import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class DALSchemaQuries extends GetxController {
  Future<void> FncSchemaQuries(String dbPath, List<String> queries) async {
    final Database db = await openDatabase(dbPath);
    final Batch batch = db.batch();
    queries.forEach((query) {
      batch.execute(query);
    });
    await batch.commit();
    await db.close();
  }
}
