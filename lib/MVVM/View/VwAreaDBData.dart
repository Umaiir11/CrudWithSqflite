import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../DAL/DALArea.dart';
import '../ViewModel/VmAreaData.dart';

class Vw_AreaDBData extends StatefulWidget {
  @override
  State<Vw_AreaDBData> createState() => _Vw_AreaDBDataState();
}

class _Vw_AreaDBDataState extends State<Vw_AreaDBData> {
  final VmAreaData l_VmHome = Get.find();
  final DALArea l_DAL = Get.put(DALArea());

  @override
  Widget build(BuildContext context) {
    final l_VmHome = Get.find<VmAreaData>();


    Widget _WidgetportraitMode(double PrHeight, PrWidth) {
      return Scaffold(



        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                String textField1Value = '';
                String textField2Value = '';
                return AlertDialog(
                  title: Text('Add Item'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: 'Enter Coloumn'),
                        onChanged: (value) {
                          textField1Value = value;
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Enter value for Coloumn'),
                        onChanged: (value) {
                          textField2Value = value;
                        },
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        await l_DAL.FncBatchUpdate(textField1Value, textField2Value,"autoid=1");
                        l_VmHome.DB_DataList =  await l_DAL.FncFetchUsers();
                        l_VmHome.OBSList.clear();
                        l_VmHome.OBSList.addAll( l_VmHome.DB_DataList);
                        Navigator.pop(context);
                      },
                      child: Text('Update'),
                    ),
                  ],
                );
              },
            );
          },
          backgroundColor: Colors.cyanAccent,
          mini: true,
          child: Icon(
            Icons.update,
            color: Colors.black,
          ),
        ),




        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('User List'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: l_VmHome.OBSList.length,
                  itemBuilder: (context, i) {
                    return Card(
                      color: Colors.grey[900],
                      child: ListTile(
                        title: Text(
                          l_VmHome.DB_DataList[i].Pr_PKGUID!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          l_VmHome.DB_DataList[i].Pr_Descr!,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.cyanAccent,
                          child: Text(
                            l_VmHome.DB_DataList[i].Pr_AreaID![0],
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
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
