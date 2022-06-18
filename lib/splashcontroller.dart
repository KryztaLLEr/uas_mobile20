import 'dart:async';

import 'package:get/get.dart';
import 'package:uas_2009106069_jorghiinzaghitanson/landingpage.dart';

class SplashControl extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splash();
  }

  splash() {
    return Timer(
      const Duration(seconds: 5),
      () {
        Get.off(const LandingPage());
      },
    );
  }
}
