import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/modal/userdata.dart';
import 'package:restapi/utills/constant.dart';

class HomePageController extends GetxController
    with StateMixin<List<UserData>> {
  List<UserData> finalList = [];

  @override
  void onInit() {
    super.onInit();
    clientDataApi();
  }

  clientDataApi() async {
    try {
      change(finalList, status: RxStatus.loading());
      var client = http.Client();
      var url = Constant.apiUrl;
      var uri = Uri.parse(url);
      var response = await client.get(uri);
      List<dynamic> uList = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (int i = 0; i < uList.length; i++) {
          Map<String, dynamic> userMsp = uList[i];
          UserData userData = UserData.fromJson(userMsp);
          finalList.add(userData);
        }
        change(finalList, status: finalList.isNotEmpty ? RxStatus.success() : RxStatus.empty());
      }
    } catch (e) {
      print(e);
      change(finalList, status: RxStatus.error(e.toString()));
    }
  }
}
