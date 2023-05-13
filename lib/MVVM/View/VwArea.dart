import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localapp/DAL/DALArea.dart';
import 'package:localapp/MVVM/Model/DB/ModAreaUserDB.dart';
import 'package:localapp/Validation/DVMArea.dart';
import 'package:tuple/tuple.dart';

import '../../ClassModules/DBHelperClass.dart';
import '../ViewModel/VmAreaData.dart';
import 'VwAreaDBData.dart';

class VwAreaData extends StatefulWidget {
  const VwAreaData({Key? key}) : super(key: key);

  @override
  State<VwAreaData> createState() => _VwAreaDataState();
}

class _VwAreaDataState extends State<VwAreaData> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final VmAreaData l_VmAreaData = Get.put(VmAreaData());
  final DALArea l_DAL = Get.put(DALArea());
  final DBHelper l_DBHelper = Get.put(DBHelper());
  TBU_Area l_ModAreaDB = TBU_Area();

  final TextEditingController l_Pr_FnameController = TextEditingController();
  final TextEditingController l_Pr_LnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    l_Pr_FnameController.text = l_VmAreaData.Pr_txtareaid_Text;
    l_Pr_LnameController.text = l_VmAreaData.Pr_txtLdescription_Text;

    Widget _WidgetportraitMode(double PrHeight, PrWidth) {
      return Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
            height: PrHeight,
            width: PrWidth,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFFFFFFFF),
                  Color(0xFFFFFFFF),
                  Color(0xFFFFFFFF),
                ],
                stops: [0.1, 0.5, 0.7, 0.9],
              ),
            ),
            //color: Colors.black,
            padding: const EdgeInsets.all(16.0),
            // we use child container property and used most important property column that accepts multiple widgets

            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: PrHeight * 0.25,
                      right: PrWidth * 0.25,
                    ),
                    child: Text(
                      "Please enter your information",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.black26,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.010),
                    child: Center(
                      child: SizedBox(
                        width: PrWidth * .890,
                        child: TextFormField(
                            //controller: EmailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[100],
                              hintText: ' Area ID',
                              hintStyle: const TextStyle(color: Colors.black38),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                            ),
                            validator: (value) {
                              l_ModAreaDB.Pr_AreaID = value ?? '';
                              Tuple2<List<String>?, List<String>?> errors = DVMArea.Fnc_Validate(l_ModAreaDB);
                              if (errors.item2 != null && errors.item2!.contains('Pr_AreaID')) {
                                return errors.item1![errors.item2!.indexOf('Pr_AreaID')];
                              }

                              return null;
                            },
                            onChanged: (value) {
                              l_VmAreaData.Pr_txtareaid_Text = value;
                            }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.02),
                    child: Center(
                      child: SizedBox(
                          width: PrWidth * .890,
                          child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: 'Desc',
                                hintStyle: const TextStyle(color: Colors.black38),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                              ),
                              validator: (value) {
                                l_ModAreaDB.Pr_Descr = value ?? '';
                                Tuple2<List<String>?, List<String>?> errors = DVMArea.Fnc_Validate(l_ModAreaDB);
                                if (errors.item2 != null && errors.item2!.contains('Pr_Descr')) {
                                  return errors.item1![errors.item2!.indexOf('Pr_Descr')];
                                }

                                return null;
                              },
                              onChanged: (value) {
                                l_VmAreaData.Pr_txtLdescription_Text = value;
                              })),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.01),
                    child: Center(
                      child: SizedBox(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5), // <-- Radius
                                ),
                                backgroundColor: Colors.cyan),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                l_VmAreaData.lModAreaDBList.clear();
                                l_VmAreaData.OBSList.clear();
                                l_VmAreaData.DB_DataList.clear(); // Clear the list before adding new data
                                l_VmAreaData.FncFillModel();

                                l_Pr_FnameController.clear();
                                l_Pr_LnameController.clear();

                                if (l_VmAreaData.lModAreaDBList.isNotEmpty) {
                                  await l_DBHelper.FncCreateDataBase();
                                  await l_DAL.FncBatchInsert();

                                  l_VmAreaData.DB_DataList = await l_DAL.FncFetchUsers();

                                  if (l_VmAreaData.DB_DataList != null) {
                                    l_VmAreaData.OBSList.addAll(l_VmAreaData.DB_DataList);
                                    Get.to(() => Vw_AreaDBData());
                                  } else {
                                    print("Fail");
                                  }

                                  print("Done");
                                } else {
                                  print("QueryFailed");
                                }
                              } else {
                                l_VmAreaData.l_autoValidate.value = true;
                              }
                            },
                            child: Text(
                              "Add",
                              style: GoogleFonts.ubuntu(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      //fontWeight: FontWeight.w600,
                                      letterSpacing: .5)),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        //when tap anywhere on screen keyboard dismiss
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              //Get device's screen height and width.
              double height = constraints.maxHeight;
              double width = constraints.maxWidth;

              if (width >= 300 && width < 500) {
                return _WidgetportraitMode(height, width);
              } else {
                return _WidgetportraitMode(height, width);
              }
            },
          );
        },
      ),
    );
  }
}
