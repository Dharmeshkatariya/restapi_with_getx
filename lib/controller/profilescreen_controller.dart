import 'dart:convert';

import 'package:get/get.dart';
import 'package:restapi/modal/userdata.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utills/constant.dart';

class ProfileScreenController extends GetxController
    with StateMixin<List<UserData>> {
  List<UserData> userList = [];

  @override
  void onInit() {
    // TODO: implement onInit

    userApi();
    super.onInit();
  }

  late UserData userData;

  userApi() async {
    try {
      change(userList, status: RxStatus.loading());
      String id = "";
      if (Get.arguments != null) {
        id = Get.arguments['id'];
        print(id);
      }
      final dio = Dio();

      var url = "${Constant.apiUrl}?id=$id";
      var response = await dio.get(url);
      List<dynamic> uList = response.data;

      if (response.statusCode == 200) {
        // userList = uList.map((userMsp) => UserData.fromJson(userMsp)).toList();
        for (int i = 0; i < uList.length; i++) {
          Map<String, dynamic> userMsp = uList[i];
          userData = UserData.fromJson(userMsp);
          userList.add(userData);
        }
        var shareP = await SharedPreferences.getInstance();
        shareP.setString("name", userData.name);
        shareP.setString("id", userData.id);
        shareP.setString("price", userData.data.price);
        shareP.setString("color", userData.data.color);
        shareP.setString("capacity", userData.data.capacity);

        change(userList,
            status:
                userList.isNotEmpty ? RxStatus.success() : RxStatus.empty());
      }
    } catch (e) {
      change(userList, status: RxStatus.empty());
      print(e);
    }
  }
}
