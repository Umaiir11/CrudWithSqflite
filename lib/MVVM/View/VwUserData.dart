import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localapp/MVVM/Model/DB/ModUserDB.dart';
import 'package:localapp/MVVM/ViewModel/VmUserData.dart';
import 'package:tuple/tuple.dart';

import '../../ClassModules/DBHelperClass.dart';
import '../../DAL/DAL.dart';
import '../../Validation/DVMUser.dart';
import 'VwDBData.dart';

class VwUserData extends StatefulWidget {
  const VwUserData({Key? key}) : super(key: key);

  @override
  State<VwUserData> createState() => _VwUserDataState();
}

class _VwUserDataState extends State<VwUserData> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final VmUserData l_VmUserData = Get.put(VmUserData());
  final DALUsers l_DAL = Get.put(DALUsers());
  final DBHelper l_DBHelper = Get.put(DBHelper());
  ModUserDB l_ModUserDB = ModUserDB();

  final TextEditingController l_Pr_FnameController = TextEditingController();
  final TextEditingController l_Pr_LnameController = TextEditingController();
  final TextEditingController l_Pr_EmailIDController = TextEditingController();
  final TextEditingController l_Pr_CompanyIDController = TextEditingController();
  final TextEditingController l_Pr_AddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    l_Pr_FnameController.text = l_VmUserData.Pr_txtFname_Text;
    l_Pr_LnameController.text = l_VmUserData.Pr_txtLname_Text;
    l_Pr_EmailIDController.text = l_VmUserData.Pr_txtEmailID_Text;
    l_Pr_CompanyIDController.text = l_VmUserData.Pr_txtCompanyID_Text;
    l_Pr_AddressController.text = l_VmUserData.Pr_txtAddress_Text;
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
                              hintText: ' First name',
                              hintStyle: const TextStyle(color: Colors.black38),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                            ),
                            validator: (value) {
                              l_ModUserDB.Pr_Fname = value ?? '';
                              Tuple2<List<String>?, List<String>?> errors = DVMUser.Fnc_Validate(l_ModUserDB);
                              if (errors.item2 != null && errors.item2!.contains('Pr_Fname')) {
                                return errors
                                    .item1![errors.item2!.indexOf('Pr_Fname')]; // Return the error message for Pr_FullName
                              }

                              return null;
                            },
                            onChanged: (value) {
                              l_VmUserData.Pr_txtFname_Text = value;
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
                              //obscureText: !l_VmLogin.Pr_boolSecurePassword_wid.value,
                              // controller: passswordController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: 'Last name',
                                hintStyle: const TextStyle(color: Colors.black38),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                                //suffixIcon: togglepassword(),
                              ),
                              validator: (value) {
                                l_ModUserDB.Pr_Lname = value ?? '';
                                Tuple2<List<String>?, List<String>?> errors = DVMUser.Fnc_Validate(l_ModUserDB);
                                if (errors.item2 != null && errors.item2!.contains('Pr_Lname')) {
                                  return errors
                                      .item1![errors.item2!.indexOf('Pr_Lname')]; // Return the error message for Pr_FullName
                                }

                                return null;
                              },
                              onChanged: (value) {
                                l_VmUserData.Pr_txtLname_Text = value;
                              })),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.02),
                    child: Center(
                      child: SizedBox(
                          width: PrWidth * .890,
                          child: TextFormField(
                              //obscureText: !l_VmLogin.Pr_boolSecurePassword_wid.value,
                              // controller: passswordController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: 'Email ID',
                                hintStyle: const TextStyle(color: Colors.black38),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                                //suffixIcon: togglepassword(),
                              ),
                              validator: (value) {
                                l_ModUserDB.Pr_EmailID = value ?? '';
                                Tuple2<List<String>?, List<String>?> errors = DVMUser.Fnc_Validate(l_ModUserDB);
                                if (errors.item2 != null && errors.item2!.contains('Pr_EmailID')) {
                                  return errors
                                      .item1![errors.item2!.indexOf('Pr_EmailID')]; // Return the error message for Pr_EmailID
                                }

                                return null;
                              },
                              onChanged: (value) {
                                l_VmUserData.Pr_txtEmailID_Text = value;
                              })),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.02),
                    child: Center(
                      child: SizedBox(
                          width: PrWidth * .890,
                          child: TextFormField(
                              //obscureText: !l_VmLogin.Pr_boolSecurePassword_wid.value,
                              // controller: passswordController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: 'Company ID',
                                hintStyle: const TextStyle(color: Colors.black38),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                                //suffixIcon: togglepassword(),
                              ),
                              validator: (value) {
                                l_ModUserDB.Pr_CompanyID = value ?? '';
                                Tuple2<List<String>?, List<String>?> errors = DVMUser.Fnc_Validate(l_ModUserDB);
                                if (errors.item2 != null && errors.item2!.contains('Pr_CompanyID')) {
                                  return errors
                                      .item1![errors.item2!.indexOf('Pr_CompanyID')]; // Return the error message for Pr_EmailID
                                }

                                return null;
                              },
                              onChanged: (value) {
                                l_VmUserData.Pr_txtCompanyID_Text = value;
                              })),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: PrHeight * 0.02),
                    child: Center(
                      child: SizedBox(
                          width: PrWidth * .890,
                          child: TextFormField(
                              //obscureText: !l_VmLogin.Pr_boolSecurePassword_wid.value,
                              // controller: passswordController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: 'Address',
                                hintStyle: const TextStyle(color: Colors.black38),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                                //suffixIcon: togglepassword(),
                              ),
                              validator: (value) {
                                l_ModUserDB.Pr_Address = value ?? '';
                                Tuple2<List<String>?, List<String>?> errors = DVMUser.Fnc_Validate(l_ModUserDB);
                                if (errors.item2 != null && errors.item2!.contains('Pr_Address')) {
                                  return errors
                                      .item1![errors.item2!.indexOf('Pr_Address')]; // Return the error message for Pr_EmailID
                                }

                                return null;
                              },
                              onChanged: (value) {
                                l_VmUserData.Pr_txtAddress_Text = value;
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


                                l_VmUserData.lModUserDBList.clear();

                                l_VmUserData.DB_DataList.clear(); // Clear the list before adding new data
                                l_VmUserData.FncFillModel();

                                if (l_VmUserData.lModUserDBList.isNotEmpty) {
                                  await l_DBHelper.FncCreateDataBase();
                                  await l_DAL.FncBatchInsert();
                                  l_VmUserData.DB_DataList = await l_DAL.FncFetchUsers();
                                  if(l_VmUserData.DB_DataList != null){
                                    Get.to(() => Vw_DBData());                                  }
                                  else{
                                    print("Fail");
                                  }

                                  print("Done");
                                } else {
                                  print("QueryFailed");
                                }
                              } else {
                                l_VmUserData.l_autoValidate.value = true;
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