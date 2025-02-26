import 'package:get/get.dart';
import 'package:med_meet_flutter/core/helpers/pref_helper.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_constants.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2), () async {
      // getting the access token
      final accessToken = await PrefsHelper.getString(AppConstants.bearerToken);
      if (accessToken == "") {
        // Token deos not exists, navigate to the home screen
        Get.offAllNamed(AppRoutes.selectCountryScreen);
      } else {
        // it has token meaning it also has role
        final role = await PrefsHelper.getString(PrefsKey.role);
        if (role == "USER") {
          // if logged in as user
          return Get.offAllNamed(AppRoutes.userApp);
        } else {
          // if logged in as doctor
          return Get.offAllNamed(AppRoutes.doctorApp);
        }
      }
    });
  }
}
