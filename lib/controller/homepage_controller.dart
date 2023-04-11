import 'package:get/get.dart';
import 'package:restapi/modal/userdata.dart';
import 'package:restapi/utills/constant.dart';
import 'package:dio/dio.dart';

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
      final dio = Dio();
      var url = Constant.apiUrl;
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        List<dynamic> uList = response.data;
        finalList = uList.map((userMsp) => UserData.fromJson(userMsp)).toList();
        // for (int i = 0; i < uList.length; i++) {
        //   Map<String, dynamic> userMsp = uList[i];
        //   UserData userData = UserData.fromJson(userMsp);
        //   finalList.add(userData);
        // }
        change(finalList,
            status:
                finalList.isNotEmpty ? RxStatus.success() : RxStatus.empty());
      }
    } catch (e) {
      print(e);
      change(finalList, status: RxStatus.error(e.toString()));
    }
  }
}
