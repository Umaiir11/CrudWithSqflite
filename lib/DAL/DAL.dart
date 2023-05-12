import 'package:get/get.dart';
import 'package:localapp/CrudQuries/CRUDUsers.dart';
import 'package:localapp/MVVM/ViewModel/VmUserData.dart';
import 'package:sqflite/sqflite.dart';

import '../ClassModules/DBHelperClass.dart';
import '../MVVM/Model/DB/ModUserDB.dart';

class DALUsers extends GetxController {


  Future<void> FncBatchInsert() async {



    final Database? l_Database = await DBHelper().FncGetDatabase();
    if (l_Database== null) return;
    print(l_Database);

    Batch batch = l_Database.batch();

    final List<Map<String, dynamic>>? l_map = await VmUserData().FncGetUserMapList();

    List<Map<String, dynamic>>? json = l_map;// your list of objects

    for (Map<String, dynamic> l_map in json!) {
      String? l_InsertionQuery = await CRUDUsers().FncInsertion(json);
      if (l_InsertionQuery != null) {
        // Execute the query in the batch
        batch.execute(l_InsertionQuery);
      }
    }

    try {
      await batch.commit();
    } catch (e) {
      print('An error occurred while executing the batch: $e');
    }
  }


  Future<List<ModUserDB>> FncFetchUsers() async {

    final Database? l_Database = await DBHelper().FncGetDatabase();

    if (l_Database == null) return [];

    List<Map<String, dynamic>> result = await l_Database!.query('TBU_Users');

    List<ModUserDB> users = [];
    for (Map<String, dynamic> row in result) {
      ModUserDB user = ModUserDB();
      user.Pr_Fname = row['Fname'];
      user.Pr_Lname = row['Lname'];
      user.Pr_EmailID = row['EmailID'];
      user.Pr_CompanyID = row['CompanyID'];
      user.Pr_Address = row['Address'];
      users.add(user);
    }

    return users;
  }
}
