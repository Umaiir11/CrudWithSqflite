import 'package:get/get.dart';

import '../MVVM/Model/DB/ModAreaUserDB.dart';

class CRUDUsers extends GetxController {
  Future<String?> FncInsertion(List<Map<String, dynamic>> json) async {
    String? l_InsertionQuery;
    for (Map<String, dynamic> l_map in json) {

      TBU_Area l_ModelInstance = TBU_Area();
      String lTBU_Area = l_ModelInstance.runtimeType.toString();

      // Build the SQL query based on the property names and values
      String columns = l_map.keys.map((key) => key.replaceAll("Pr_", "")).join(",");
      String values = l_map.values.map((value) => "\"$value\"").join(",");
      l_InsertionQuery = "INSERT INTO $lTBU_Area ($columns) VALUES ($values)";
    }
    return l_InsertionQuery;
  }

  Future<String?> FncUpdate(String l_WhereClause, String l_ColumnName, String l_ColumnValue) async {

    TBU_Area modelInstance = TBU_Area();
    String lTBU_Area = modelInstance.runtimeType.toString();

    // Build the SQL query based on the property names and values
    String updateValue = "${l_ColumnName.replaceAll("Pr_", "")}=\"$l_ColumnValue\"";
    String l_UpdateQuery = "UPDATE $lTBU_Area SET $updateValue WHERE $l_WhereClause";
    return l_UpdateQuery;
  }
}

