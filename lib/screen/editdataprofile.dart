import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi/common.dart';
import 'package:restapi/controller/editdataprofile_controller.dart';

class EditDataProfile extends GetView<EditDataProfileController> {
  const EditDataProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text("Edit Data"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Common.textForm(),
            Common.textForm(),
            Common.textForm(),
            Common.textForm(),
            Common.button(text: "Edit ",color: Colors.red,textcolor: Colors.white),
          ],
        ),
      ),
    );
  }
}
