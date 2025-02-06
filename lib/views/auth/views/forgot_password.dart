import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Forgot Password",
              style: AppTypography.headerText1,
            ),
            SizedBox(
              height: 12,
            ),
            Text('Don’t worry! Enter your email to reset your password',
                style: AppTypography.bodyText1),
            SizedBox(
              height: 56,
            ),
            SizedBox(
              height: 52.h,
            ),
            CustomTextInput(title: "Email", hintText: "example@gmail.com"),
            SizedBox(
              height: 32.h,
            ),
            CustomButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.verifOtp,
                      arguments: OTPTYPE.forgetPass);
                },
                buttonTitle: "Send Reset"),
          ],
        ),
      ),
    );
  }
}
