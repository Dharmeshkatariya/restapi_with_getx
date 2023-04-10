import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi/route/pageroutes.dart';
import 'package:restapi/screen/splash%20screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: PageRoutes.pages,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  SplashScreen(),
    );
  }
}

