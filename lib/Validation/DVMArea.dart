import 'package:localapp/MVVM/Model/DB/ModAreaUserDB.dart';
import 'package:tuple/tuple.dart';

import '../MVVM/Model/DB/ModUserDB.dart';

class DVMArea {
  static Tuple2<List<String>?, List<String>?> Fnc_Validate(TBU_Area lModAreaDB) {
    List<String>? lErrorMsgs = [];
    List<String>? lFieldNames = [];

    if (lModAreaDB.Pr_AreaID?.isEmpty ?? true) {
      lErrorMsgs.add('Please enter your area id.');
      lFieldNames.add('Pr_AreaID');
    }
    if (lModAreaDB.Pr_Descr?.isEmpty ?? true) {
      lErrorMsgs.add('Please enter your desc.');
      lFieldNames.add('Pr_Descr');
    }


    // Add more field validation here as needed

    if (lErrorMsgs.isNotEmpty || lFieldNames.isNotEmpty) {
      return Tuple2(lErrorMsgs, lFieldNames);
    }

    return const Tuple2(null, null);
  }
}
