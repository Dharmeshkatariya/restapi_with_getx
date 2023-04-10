import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi/route/nameroute.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  splashScreen() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      Get.toNamed(NameRoutes.homeScreen);
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    splashScreen();
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: const Center(
          child: Text(
            "Splash screen",
            style: TextStyle(color: Colors.white60),
          ),
        ),
      ),
    );
  }
}
