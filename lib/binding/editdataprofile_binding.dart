import 'package:get/get.dart';
import 'package:restapi/controller/editdataprofile_controller.dart';

class EditDataProfileBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => EditDataProfileController());
    // TODO: implement dependencies
  }
}
