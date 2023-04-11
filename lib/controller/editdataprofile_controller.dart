import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditDataProfileController extends GetxController {
  final mobileNameController = TextEditingController();
  final priceController = TextEditingController();
  final colorController = TextEditingController();
  final capacityController = TextEditingController();
  final idController = TextEditingController();

  // emailController.text = updateEmail.value;
  @override
  void onInit() {
    // TODO: implement onInit
    _setValue();
    super.onInit();
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
    capacityController.text = "$capacity";
    idController.text = "$id";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    mobileNameController.dispose();
    priceController.dispose();
    capacityController.dispose();
    colorController.dispose();
    idController.dispose();
    super.dispose();
  }
}
