import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';

class WhoAreYouScreen extends StatelessWidget {
  const WhoAreYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Who are you?",
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "Please select your role to continue",
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF545454),
              ),
            ),
            SizedBox(
              height: 46.h,
            ),
            CustomButton(
              onPressed: () {
                Get.toNamed(AppRoutes.selectCountryScreen);
              },
              buttonTitle: "User",
              isSecondary: true,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomButton(
              onPressed: () {
                Get.toNamed(AppRoutes.doctorSignIn);
              },
              buttonTitle: "Doctor",
              isSecondary: true,
            ),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    );
  }
}
