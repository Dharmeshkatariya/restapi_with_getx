import 'dart:convert';

import 'package:get/get.dart';
import 'package:restapi/modal/userdata.dart';
import 'package:restapi/utills/constant.dart';
import 'package:http/http.dart' as http;

class ProfileScreenController extends GetxController
    with StateMixin<List<UserData>> {
  List<UserData> userList = [];

  @override
  void onInit() {
    // TODO: implement onInit

    userApi();
    super.onInit();
  }

  userApi() async {
    try {
      change(userList, status: RxStatus.loading());
      String id = "";
      if (Get.arguments != null) {
        id = Get.arguments['id'];
        print(id);
      }

      var client = http.Client();
      var url = "${Constant.apiUrl}?id=$id";
      var uri = Uri.parse(url);
      var response = await client.get(uri);
      List<dynamic> uList = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (int i = 0; i < uList.length; i++) {
          Map<String, dynamic> userMsp = uList[i];
          UserData userData = UserData.fromJson(userMsp);
          userList.add(userData);
        }
        change(userList, status: userList.isNotEmpty ? RxStatus.success() : RxStatus.empty());
      }
    } catch (e) {
      change(userList, status: RxStatus.empty());
      print(e);
    }
  }
}
