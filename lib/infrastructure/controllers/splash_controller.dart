import 'dart:io';

import 'package:flutter_health/ui/home_page.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    setSplashTimer();
    activityPermissionCheck();
    super.onInit();
  }

  @override
  void onClose() {}

  void setSplashTimer() async {
    int nSplashTimer = 250;

    Future.delayed(Duration(milliseconds: nSplashTimer), () async {
      Get.to(const HomePage());
    });
  }

  activityPermissionCheck() async {
    if (Platform.isAndroid) {
      final permissionStatus = Permission.activityRecognition.request();
      if (await permissionStatus.isDenied ||
      await permissionStatus.isPermanentlyDenied) {
        Get.snackbar('Health App',
            'activityRecognition permission required to fetch your steps count');
        activityPermissionCheck();
      }
    }
  }
}
