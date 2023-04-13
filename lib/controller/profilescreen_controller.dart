import 'package:get/get.dart';
import 'package:restapi/api/rest_client.dart';
import 'package:restapi/modal/userdata.dart';

class ProfileScreenController extends GetxController with StateMixin<UserData> {
  UserData? userData;

  @override
  void onInit() {
    // TODO: implement onInit
    userApi();
    super.onInit();
  }

  String? id;
  final _restClient = RestClient();

  userApi() async {
    try {
      change(userData, status: RxStatus.loading());
      if (Get.arguments != null) {
        id = Get.arguments['id'];
      }
      var response = await _restClient.get(path: '/$id');
      var uMap = response.data;
      if (response.statusCode == 200) {
        userData = UserData.fromJson(uMap);
        userData = UserData.fromJson(uMap);
        change(userData,
            status: userData == null ? RxStatus.empty() : RxStatus.success());
      }
    } catch (e) {
      change(userData, status: RxStatus.error());
      print(e);
    }
  }

  deleteApi() async {
    try {
      var response = await _restClient.delete(path: '/$id');
      if (response.statusCode == 200) {}
    } catch (e) {
      print(e);
    }
  }
}
