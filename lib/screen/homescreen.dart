import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi/controller/homepage_controller.dart';
import 'package:restapi/modal/userdata.dart';
import 'package:restapi/route/nameroute.dart';
import 'package:restapi/screen/emptyview.dart';

class HomeScreen extends GetView<HomePageController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
        ],
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text("Mobile List "),
      ),
      body: controller.obx(
        (state) => Container(
          color: Colors.grey.shade50,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: controller.finalList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _listData(index);
                    }),
              ),
            ],
          ),
        ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: const  EmptyView(),

      ),
    );
  }

  Widget _listData(int index) {
    UserData userData = controller.finalList[index];
    return GestureDetector(
      onTap: (){
        Get.toNamed(NameRoutes.profileScreen);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/icon/apple.jpg",
                  height: 50,
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _commonText(text: userData.id),
                    _commonText(text: userData.name),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _commonText({required String text}) {
    return Text(
      text,
      overflow: TextOverflow.clip,
      maxLines: 1,
      softWrap: true,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
    );
  }
}
