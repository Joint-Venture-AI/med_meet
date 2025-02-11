// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:med_meet_flutter/core/constants/image_assets.dart';
import 'package:med_meet_flutter/controller/auth_controllers/splash_controller.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    final SplashController splashController = Get.put(SplashController());
    return Scaffold(
      backgroundColor: Color(0xFF63ACFF),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Center(
              child: Image.asset(ImageAssets.doctorSplash),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: Get.height / 2,
                width: Get.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter, // Start at the top
                    end: Alignment.bottomCenter, // End at the bottom
                    colors: [
                      Color.fromRGBO(255, 255, 255,
                          0.05), // Top color: Transparent (0% opacity)
                      Color.fromRGBO(255, 255, 255, 0.26),
                      Color.fromRGBO(
                          255, 255, 255, 0.62), // White at 32% (80% opacity)
                      Color.fromRGBO(255, 255, 255,
                          1.0), // White at 64% and 100% (100% opacity)
                      Color.fromRGBO(
                          255, 255, 255, 1.0), // White at 100% (100% opacity)
                    ],
                    stops: [
                      0.0, // 0% - Transparent
                      0.16,
                      0.32, // 32% - White with 80% opacity
                      0.58, // 64% - White with 100% opacity
                      1.0, // 100% - White with 100% opacity
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: Get.width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        "Consult Doctors Anytime, Anywhere!",
                        style: AppTypography.splashStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              color: Color(0xFF8A8A8A), shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              color: Color(0xFF8A8A8A), shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              color: Color(0xFF8A8A8A), shape: BoxShape.circle),
                        ),
                        SizedBox(
                          height: 59.h,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
