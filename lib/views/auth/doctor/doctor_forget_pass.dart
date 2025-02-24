import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/auth_doctor_controller.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class DoctorForgetPass extends StatelessWidget {
  DoctorForgetPass({super.key});
  final emailController = TextEditingController();
  final AuthDoctorsController authDoctorsController =
      Get.find<AuthDoctorsController>();
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
            CustomTextInput(
              title: "Email",
              hintText: "example@gmail.com",
              textController: emailController,
            ),
            SizedBox(
              height: 32.h,
            ),
            CustomButton(
                onPressed: () async {
                  await authDoctorsController.sendOTP(emailController.text);
                },
                buttonTitle: "Send Reset"),
          ],
        ),
      ),
    );
  }
}
