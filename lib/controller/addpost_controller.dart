import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restapi/utills/constant.dart';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPostController extends GetxController {
  final mobileNameController = TextEditingController();
  final priceController = TextEditingController();
  final colorController = TextEditingController();
  final yearController = TextEditingController();
  final modalTypeController = TextEditingController();
  RxBool isLoading = true.obs;
  RxBool isUpdate = false.obs;

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
      var url = Constant.apiUrl;
      var response = await dio.put(url);
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  _setValue() async {
    if (isUpdate.value == true) {
      updateDataApi();
    }

    mobileNameController.text = mobileNameController.text.trim();
    priceController.text = priceController.text.trim();
    colorController.text = colorController.text.trim();
    modalTypeController.text = modalTypeController.text.trim();
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
