import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class VerifyProgressDoctorView extends StatelessWidget {
  const VerifyProgressDoctorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Get.width,
                    ),
                    SvgPicture.asset(SVGAssets.hourGlass),
                    SizedBox(
                      height: 48.h,
                    ),
                    Text(
                      "Your Account is Under Review",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                        "Your account is currently under review by the admin. The process may take between 3 to 7 days. You'll receive a notification once your account is approved.",
                        textAlign: TextAlign.center,
                        style: AppTypography.bodyText1Black),
                  ],
                ),
                CustomButton(
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.signIn);
                    },
                    buttonTitle: "Back to Sign In")
              ],
            )));
  }
}
