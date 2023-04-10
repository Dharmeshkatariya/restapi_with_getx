import 'package:get/get.dart';
import 'package:restapi/controller/homepage_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
     // Get.lazyPut<HomePageController>(() => HomePageController());
    Get.put(HomePageController());

    // TODO: implement dependencies
  }
}
