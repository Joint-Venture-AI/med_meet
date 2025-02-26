import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/doctor/auth_doctor_controller.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class DoctorNewPass extends StatelessWidget {
  DoctorNewPass({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
              "New Password",
              style: AppTypography.headerText1,
            ),
            SizedBox(
              height: 12,
            ),
            Text('Create a strong password to secure your account',
                style: AppTypography.bodyText1),
            SizedBox(
              height: 56,
            ),
            CustomTextInput(
              title: "Password",
              hintText: "Password",
              textController: passwordController,
              isPassword: true,
            ),
            SizedBox(
              height: 32,
            ),
            CustomTextInput(
              title: "Confirm Password",
              hintText: "Confirm Password",
              textController: confirmPasswordController,
              isPassword: true,
            ),
            SizedBox(
              height: 32,
            ),
            CustomButton(
                onPressed: () {
                  authDoctorsController.forgetPass(
                      passwordController.text, confirmPasswordController.text);
                },
                buttonTitle: "Create New Password")
          ],
        ),
      ),
    );
  }
}
