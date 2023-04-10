import 'package:get/get.dart';
import 'package:restapi/binding/addpost_binding.dart';
import 'package:restapi/binding/editdataprofile_binding.dart';
import 'package:restapi/binding/homepage_binding.dart';
import 'package:restapi/binding/profilescreen_binding.dart';
import 'package:restapi/route/nameroute.dart';
import 'package:restapi/screen/addpostscreen.dart';
import 'package:restapi/screen/editdataprofile.dart';
import 'package:restapi/screen/homescreen.dart';
import '../screen/profilescreen.dart';


class PageRoutes {
  static final pages = [
    GetPage(
      name: NameRoutes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: NameRoutes.profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: NameRoutes.addPostScreen,
      page: () => const AddPostScreen(),
      binding: AddPostBinding(),
    ),
    GetPage(
      name: NameRoutes.editDataScreen,
      page: () => const EditDataProfile(),
      binding: EditDataProfileBinding(),
    ),
  ];
}
