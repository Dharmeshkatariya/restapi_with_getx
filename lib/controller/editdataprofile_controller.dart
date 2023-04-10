import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditDataProfileController extends GetxController {
  final mobileNameController = TextEditingController();
  final priceController = TextEditingController();
  final colorController = TextEditingController();
  final capacityController = TextEditingController();
  final idController = TextEditingController();



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
