import 'package:get/get.dart';
import 'package:restapi/route/nameroute.dart';
import 'package:restapi/screen/homescreen.dart';

class PageRoutes {
  static final pages = [

  GetPage(
  name:NameRoutes.homeScreen,
  page:()=>HomeScreen(),
  ),
  ] ;
}