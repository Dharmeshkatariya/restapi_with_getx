import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restapi/modal/userdata.dart';
import 'package:restapi/utills/constant.dart';

import 'package:dio/dio.dart';

class AddPostController extends GetxController {
  final mobileNameController = TextEditingController();
  final priceController = TextEditingController();
  final colorController = TextEditingController();
  final yearController = TextEditingController();
  final modalTypeController = TextEditingController();
  RxBool isLoading = true.obs;

  RxBool isEdit = false.obs;

  @override
  void onInit() {
    super.onInit();
    addDataApi();
    _setValue();
  }

  addDataApi() async {
    try {
      final dio = Dio();
      var url = Constant.apiUrl;
      Map<String, dynamic> data12 = {
        "name": mobileNameController.text.trim(),
        "data": {
          "year": yearController.text.trim(),
          "price": priceController.text.trim(),
          "CPU model": modalTypeController.text.trim(),
          "color": colorController.text.trim(),
        }
      };
      var response = await dio.post(url, data: data12);
      print(response.data);
      isLoading.value = false;
      if (response.statusCode == 200) {
        print('');
      }
    } catch (e) {
      print(e);
    }
  }

  updateDataApi() async {
    try {
      final dio = Dio();
      UserData userData = Get.arguments['userData'];
      String id = userData.id;
      var url = "${Constant.apiUrl}/$id";
      Map<String, dynamic> data1 = {
        "name": "Apple MacBook Pro 16",
        "data": {
          "year": 2019,
          "price": 2049.99,
          "CPU model": "Intel Core i9",
          "Hard disk size": "1 TB",
          "color": "silver"
        }
      };
      var response = await dio.put(url, data: data1);
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
        modalTypeController.text = userData.data.capacity;
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
    modalTypeController.dispose();
    super.dispose();
  }
}
