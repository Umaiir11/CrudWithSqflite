import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:localapp/MVVM/ViewModel/VmUserData.dart';


class Vw_DBData extends StatelessWidget {
  final VmUserData l_VmHome = Get.find();


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
                l_VmHome.DB_DataList[i].Pr_Fname!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                l_VmHome.DB_DataList[i].Pr_EmailID!,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.cyanAccent,
                child: Text(
                  l_VmHome.DB_DataList[i].Pr_Fname![0],
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
