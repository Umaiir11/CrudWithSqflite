import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CRUDUsers extends GetxController {
  Future<String?> FncInsertion(List<Map<String, dynamic>> json) async {
    String? l_InsertionQuery;
    for (Map<String, dynamic> l_map in json) {
      // Build the SQL query based on the property names and values
      String columns = l_map.keys.map((key) => key.startsWith("Pr_") ? key.substring(3) : key).join(",");
      String values = l_map.values.map((value) => "\"$value\"").join(",");
      l_InsertionQuery = "INSERT INTO TBU_Users ($columns) VALUES ($values)";
    }
    return l_InsertionQuery;
  }
}
