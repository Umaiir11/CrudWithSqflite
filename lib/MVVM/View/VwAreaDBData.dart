import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:localapp/MVVM/ViewModel/VmAreaData.dart';
import 'package:localapp/MVVM/ViewModel/VmUserData.dart';


class Vw_AreaDBData extends StatelessWidget {
  final VmAreaData l_VmHome = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: l_VmHome.DB_DataList.length,
        itemBuilder: (context, i) {
          return Card(
            color: Colors.grey[900],
            child: ListTile(
              title: Text(
                l_VmHome.DB_DataList[i].Pr_AreaID!,
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
      ),

    );
  }
}
