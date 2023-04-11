import 'dart:convert';

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

  @override
  void onInit() {
    super.onInit();
    clientDataApi();
    // _setValue();
  }

  clientDataApi() async {
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

  @override
  void dispose() {
    // TODO: implement dispose
    mobileNameController.dispose();
    priceController.dispose();
    colorController.dispose();
    modalTypeController.dispose();
    super.dispose();
  }

  _setValue() async {
    var shareP = await SharedPreferences.getInstance();
    var name = shareP.getString("name");
    var id = shareP.getString("id");
    var price = shareP.getString("price");
    var color = shareP.getString("color");
    var capacity = shareP.getString("capacity");

    mobileNameController.text = "$name";
    priceController.text = "$price";
    colorController.text = "$color";
    modalTypeController.text = "$id";
  }
}
