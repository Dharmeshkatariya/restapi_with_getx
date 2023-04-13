import 'package:get/get.dart';
import 'package:restapi/modal/userdata.dart';
import '../api/rest_client.dart';

class HomePageController extends GetxController
    with StateMixin<List<UserData>> {
  List<UserData> finalList = [];

  @override
  void onInit() {
    super.onInit();
    clientDataApi();
  }

  final _restClient = RestClient();

  clientDataApi() async {
    try {
      change(finalList, status: RxStatus.loading());
      var response = await _restClient.get(path: '');
      if (response.statusCode == 200) {
        List<dynamic> uList = response.data;
        finalList = uList.map((userMsp) => UserData.fromJson(userMsp)).toList();
        // simple use by the for loop
        // for (int i = 0; i < uList.length; i++) {
        //   Map<String, dynamic> userMsp = uList[i];
        //   UserData userData = UserData.fromJson(userMsp);
        //   finalList.add(userData);
        // }
        change(finalList, status: finalList.isNotEmpty ? RxStatus.success() : RxStatus.empty());
      }
    } catch (e) {
      print(e);
      change(finalList, status: RxStatus.error(e.toString()));
    }
  }
}
