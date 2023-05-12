import 'dart:io';

import 'package:get/get.dart';
import 'package:localapp/DAL/DAL.dart';
import 'package:localapp/DAL/DALSchemaQuires.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../MVVM/Model/DB/ModUserDB.dart';
import '../SchemaQuries/TBU_USer.dart';

class DBHelper extends GetxController {
    Database? l_Database;

    Future<Database?> FncGetDatabase() async {
      if (l_Database == null) {
        await FncCreateDataBase();
      }
      return l_Database;
    }

  Future<void> FncCreateDataBase() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final dbDirectory = Directory('${appDirectory.path}/AIsoneSys');
    await dbDirectory.create(recursive: true);
    final dbPath = path.join(dbDirectory.path, 'DB1.db');

    final databaseExists = await databaseFactory.databaseExists(dbPath);
    if (databaseExists) {
      l_Database = await openDatabase(dbPath);

    } else {
      l_Database = await openDatabase(
        dbPath,
        version: 1,//Get verio number how?
        onCreate: (db, version) async {
          // The database is created with version 1 if it does not exist.
          // You can add any initialization logic for the database here.
        },
      );
      // Execute the batch of queries on the newly created database connection.
      await DALSchemaQuries().FncSchemaQuries(dbPath, TBU_User().G_Queries);
    }
  }






}
