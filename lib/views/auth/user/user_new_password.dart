import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/auth_user_controller.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class UserNewPassView extends StatelessWidget {
  const UserNewPassView({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    final AuthUserController authUserController = Get.put(AuthUserController());
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
                  authUserController.userResetpassword(
                      passwordController.text, confirmPasswordController.text);
                },
                buttonTitle: "Create New Password")
          ],
        ),
      ),
    );
  }
}
