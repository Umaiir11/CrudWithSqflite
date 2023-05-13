import 'package:get/get.dart';
import 'package:localapp/CrudQuries/CRUDUsers.dart';
import 'package:localapp/MVVM/ViewModel/VmAreaData.dart';
import 'package:localapp/MVVM/ViewModel/VmUserData.dart';
import 'package:sqflite/sqflite.dart';

import '../ClassModules/DBHelperClass.dart';
import '../MVVM/Model/DB/ModAreaUserDB.dart';

class DALArea extends GetxController {


  Future<void> FncBatchInsert() async {
    final Database? l_Database = await DBHelper().FncGetDatabase();
    if (l_Database== null) return;
    print(l_Database);
    Batch batch = l_Database.batch();
    final List<Map<String, dynamic>>? l_map = await VmAreaData().FncGetAreaMapList();
    List<Map<String, dynamic>>? json = l_map;

    for (Map<String, dynamic> l_map in json!) {
      String? l_InsertionQuery = await CRUDUsers().FncInsertion(json);
      if (l_InsertionQuery != null) {
        batch.execute(l_InsertionQuery);
      }
    }
    try {
      await batch.commit();
    } catch (e) {
      print('An error occurred while executing the batch: $e');
    }
  }


  Future<void> FncBatchUpdate(String l_ColumnName, String l_ColumnValue, String l_WhereClause) async {
    final Database? l_Database = await DBHelper().FncGetDatabase();
    if (l_Database == null) return;

    Batch batch = l_Database.batch();

    String? l_UpdateQuery = await CRUDUsers().FncUpdate( l_WhereClause, l_ColumnName, l_ColumnValue);
      if (l_UpdateQuery != null) {
        batch.execute(l_UpdateQuery);
    }
    try {
      await batch.commit();
    } catch (e) {
      print('An error occurred while executing the batch: $e');
    }
  }



  Future<List<TBU_Area>> FncFetchUsers() async {
    final Database? l_Database = await DBHelper().FncGetDatabase();
    if (l_Database == null) return [];
    List<Map<String, dynamic>> result = await l_Database!.query('TBU_Area');
    List<TBU_Area> l_ListModArea = [];

    for (Map<String, dynamic> row in result) {
      TBU_Area l_ModAreaDB = TBU_Area();

      l_ModAreaDB.Pr_PKGUID = row['PKGUID'];
      l_ModAreaDB.Pr_AreaID = row['AreaID'];
      l_ModAreaDB.Pr_Descr = row['Descr'];
      l_ModAreaDB.Pr_SrNo = row['SrNo'];
      l_ModAreaDB.Pr_Abbreviation = row['Abbreviation'];
      l_ModAreaDB.Pr_CB = row['CB'];
      l_ModAreaDB.Pr_CDate = DateTime.parse(row['CDate']);
      l_ModAreaDB.Pr_MB =  row['MB'];
      l_ModAreaDB.Pr_MDate = DateTime.parse(row['MDate']);
      l_ModAreaDB.Pr_DB = row['DB'];
      l_ModAreaDB.Pr_DDate = DateTime.parse(row['DDate']);
      l_ModAreaDB.Pr_BranchID = row['BranchID'];
      l_ModAreaDB.Pr_Operation = row['Operation'];


      l_ListModArea.add(l_ModAreaDB);
    }
    return l_ListModArea;
  }
}
