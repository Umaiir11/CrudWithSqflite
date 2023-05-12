class ModAreaDB {
  String? Pr_PKGUID;
  int? Pr_SrNo;
  String? Pr_AreaID;
  String? Pr_Abbreviation;
  String? Pr_Descr;
  String? Pr_CB;
  DateTime? Pr_CDate;
  String? Pr_MB;
  DateTime? Pr_MDate;
  String? Pr_DB;
  DateTime? Pr_DDate;
  int? Pr_BranchID;
  int? Pr_Operation;

  Map<String, dynamic> FncAreaToJson() {
    final jsonMap = <String, dynamic>{};
    if (Pr_PKGUID != null) jsonMap["Pr_PKGUID"] = Pr_PKGUID!;
    if (Pr_SrNo != null) jsonMap["Pr_SrNo"] = Pr_SrNo!;
    if (Pr_AreaID != null) jsonMap["Pr_AreaID"] = Pr_AreaID!;
    if (Pr_Abbreviation != null) jsonMap["Pr_Abbreviation"] = Pr_Abbreviation!;
    if (Pr_Descr != null) jsonMap["Pr_Descr"] = Pr_Descr!;
    if (Pr_CB != null) jsonMap["Pr_CB"] = Pr_CB!;
    if (Pr_CDate != null) jsonMap["Pr_CDate"] = Pr_CDate!.toIso8601String();
    if (Pr_MB != null) jsonMap["Pr_MB"] = Pr_MB!;
    if (Pr_MDate != null) jsonMap["Pr_MDate"] = Pr_MDate!.toIso8601String();
    if (Pr_DB != null) jsonMap["Pr_DB"] = Pr_DB!;
    if (Pr_DDate != null) jsonMap["Pr_DDate"] = Pr_DDate!.toIso8601String();
    if (Pr_BranchID != null) jsonMap["Pr_BranchID"] = Pr_BranchID!;
    if (Pr_Operation != null) jsonMap["Pr_Operation"] = Pr_Operation!;
    return jsonMap;
  }
}
