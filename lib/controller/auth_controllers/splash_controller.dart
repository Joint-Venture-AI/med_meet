import 'package:get/get.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2),
        () => Get.offAllNamed(AppRoutes.selectCountryScreen));
  }
}
