import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi/modal/userdata.dart';
import 'package:restapi/route/nameroute.dart';
import 'package:restapi/screen/emptyview.dart';
import '../controller/profilescreen_controller.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.toNamed(NameRoutes.addPostScreen);
            },
            label: const Text("Add")),
        appBar: AppBar(
          actions: [
            GestureDetector(
                onTap: () {
                  Get.toNamed(NameRoutes.editDataScreen);
                },
                child: const Icon(Icons.more_vert)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          ],
          centerTitle: true,
          backgroundColor: Colors.red,
          title: const Text("ProfileScreen"),
        ),
        body: controller.obx(
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
          onEmpty: const EmptyView(),
          (state) => Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                const Text(
                  "Full Information",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: controller.userList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _list(index);
                        })),
              ],
            ),
          ),
        ));
  }

  Widget _list(int index) {
    UserData userData = controller.userList[index];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue.shade100,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icon/apple.jpg',
            height: 70,
            width: 70,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _text(text: userData.id),
              _text(text: userData.name),
              _text(text: userData.data.price),
              _text(text: userData.data.capacity),
              _text(text: userData.data.color),
            ],
          )
        ],
      ),
    );
  }

  Widget _text({required String text}) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
    );
  }
}
