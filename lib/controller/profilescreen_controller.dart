import 'package:get/get.dart';
import 'package:restapi/modal/userdata.dart';
import 'package:dio/dio.dart';

import '../utills/constant.dart';

class ProfileScreenController extends GetxController
    with StateMixin<UserData> {

  UserData? userData;

  @override
  void onInit() {
    // TODO: implement onInit

    userApi();
    super.onInit();
  }
  String? id ;
  userApi() async {
    try {
      change(userData, status: RxStatus.loading());

      if (Get.arguments != null) {
        id = Get.arguments['id'];
      }
      final dio = Dio();

      var url = "${Constant.baseURL}/$id";
      var response = await dio.get(url);
      var uMap = response.data;

      if (response.statusCode == 200) {
        // userList = uList.map((userMsp) => UserData.fromJson(userMsp)).toList();
        UserData userData = UserData.fromJson(uMap);
        userData = UserData.fromJson(uMap);
        change(userData,
            status:
            userData != null ? RxStatus.success() : RxStatus.empty());
      }
    } catch (e) {
      change(userData, status: RxStatus.empty());
      print(e);
    }
  }
  deleteApi() async {
    try {
      final dio = Dio();
      var url = "${Constant.baseURL}/$id";
      var response = await dio.deleteUri(Uri.parse(url));
      if (response.statusCode == 200) {

      }
    } catch (e) {
      print(e);
    }
  }
}
