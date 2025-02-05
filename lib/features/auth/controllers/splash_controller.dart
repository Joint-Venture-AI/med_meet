import 'package:get/get.dart';
import 'package:med_meet_flutter/core/routes/app_routes.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2),
        () => Get.offAllNamed(AppRoutes.selectCountryScreen));
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void increment() => count.value++;
}
