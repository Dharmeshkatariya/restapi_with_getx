import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
  _setValue(){

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
