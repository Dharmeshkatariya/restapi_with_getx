import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi/route/nameroute.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  splashScreen() {
    Timer.periodic(const Duration(seconds: 4), (timer) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icon/restapi.png",
              fit: BoxFit.cover,

            ),
            const SizedBox(height: 20,),
            const Text(
              "Restful Api ",
              style: TextStyle(
                  color: Colors.white60,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
