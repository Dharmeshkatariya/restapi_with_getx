import 'package:get/get.dart';
import 'package:restapi/controller/profilescreen_controller.dart';

class ProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileScreenController>(() => ProfileScreenController());
    // TODO: implement dependencies
  }
}
