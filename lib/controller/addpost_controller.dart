import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restapi/modal/userdata.dart';

import '../api/rest_client.dart';

class AddPostController extends GetxController {
  final mobileNameController = TextEditingController();
  final priceController = TextEditingController();
  final colorController = TextEditingController();
  final capacityController = TextEditingController();
  RxBool isLoading = true.obs;
  RxBool isEdit = false.obs;

  @override
  void onInit() {
    super.onInit();
    addDataApi();
    _setValue();
  }

  final _restClient = RestClient();

  addDataApi() async {
    try {
      Map<String, dynamic> data12 = {
        "name": mobileNameController.text.trim(),
        "data": {
          "year": DateTime.now().microsecond,
          "price": priceController.text.trim(),
          "CPU model": capacityController.text.trim(),
          "color": colorController.text.trim(),
        }
      };
      var response = await _restClient.post(path: '', data: data12);
      isLoading.value = false;
      if (response.statusCode == 200) {}
    } catch (e) {
      print(e);
    }
  }

  updateDataApi() async {
    try {
      UserData userData = Get.arguments['userData'];
      String id = userData.id;
      Map<String, dynamic> data = {
        "name": mobileNameController.text.trim(),
        "data": {
          "year": DateTime.now().microsecond,
          "price": priceController.text.trim(),
          "CPU model": capacityController.text.trim(),
          "color": colorController.text.trim(),
        }
      };
      var response = await _restClient.update(path: '/$id', data: data);
      Get.snackbar("success", "post update");
    } catch (e) {
      print(e);
    }
  }

  _setValue() async {
    if (Get.arguments != null) {
      isEdit.value = Get.arguments['isEdit'];
      if (isEdit.isTrue) {
        UserData userData = Get.arguments['userData'];
        mobileNameController.text = userData.name;
        priceController.text = userData.data.price;
        colorController.text = userData.data.color;
        capacityController.text = userData.data.capacity;
      }
    }
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    mobileNameController.dispose();
    priceController.dispose();
    colorController.dispose();
    capacityController.dispose();
    super.dispose();
  }
}
