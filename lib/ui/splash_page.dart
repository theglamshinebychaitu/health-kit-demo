import 'package:flutter/material.dart';
import 'package:flutter_health/infrastructure/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return const Scaffold(
        body: Center(
          child: SizedBox(
            height: 250,
            width: 250,
            child: Icon(Icons.health_and_safety, size: 100,),
          ),
        ));
  }
}
