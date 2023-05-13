import 'package:get/get.dart';
import 'package:localapp/MVVM/Model/DB/ModAreaUserDB.dart';
import 'package:uuid/uuid.dart';

class VmAreaData extends GetxController {
  List<ModAreaDB> DB_DataList = [];
  RxList OBSList = <ModAreaDB>[].obs;
  RxBool l_autoValidate = false.obs;

  RxString l_PrAreaID = ''.obs;

  String get Pr_txtareaid_Text {
    return l_PrAreaID.value;
  }

  set Pr_txtareaid_Text(String value) {
    l_PrAreaID.value = value;
  }

  RxString l_Pr_Desc = ''.obs;

  String get Pr_txtLdescription_Text {
    return l_Pr_Desc.value;
  }

  set Pr_txtLdescription_Text(String value) {
    l_Pr_Desc.value = value;
  }

  List<ModAreaDB> lModAreaDBList = [];
  static List<Map<String, dynamic>> l_map = [];

  FncFillModel() {
    String uuid = const Uuid().v4();
    DateTime l_DateTime = DateTime.parse("2022-08-13T13:49:44");
    ModAreaDB l_ModAreaDB = ModAreaDB();
    l_ModAreaDB.Pr_PKGUID = uuid;
    l_ModAreaDB.Pr_AreaID = Pr_txtareaid_Text;
    l_ModAreaDB.Pr_Descr = Pr_txtLdescription_Text;
    l_ModAreaDB.Pr_SrNo = 1;
    l_ModAreaDB.Pr_Abbreviation = "xyz";
    l_ModAreaDB.Pr_CB = "xyz";
    l_ModAreaDB.Pr_CDate = l_DateTime;
    l_ModAreaDB.Pr_MB = "xyz";
    l_ModAreaDB.Pr_MDate = l_DateTime;
    l_ModAreaDB.Pr_DB = "xyz";
    l_ModAreaDB.Pr_DDate = l_DateTime;
    l_ModAreaDB.Pr_BranchID = 1;
    l_ModAreaDB.Pr_Operation = 1;
    lModAreaDBList.add(l_ModAreaDB);

    for (ModAreaDB item in lModAreaDBList) {
      l_map.add(item.FncAreaToJson());
    }
  }

  List<Map<String, dynamic>>? FncGetAreaMapList() {
    if (l_map.isNotEmpty) {
      return l_map;
    } else {
      return null;
    }
  }

  FncClearData() {
    DB_DataList.clear();
    OBSList.clear();
    lModAreaDBList.clear();
    l_map.clear();
    l_Pr_Desc.value = '';
    l_PrAreaID.value = '';
  }
}
