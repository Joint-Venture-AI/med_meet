import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/profile_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_snack_bar.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  final Profilecontroller profilecontroller = Get.put(Profilecontroller());

  @override
  Widget build(BuildContext context) {
    final TextEditingController currentPasswordController =
        TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmNewPasswordController =
        TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          spacing: 16,
          children: [
            CustomAppBar(
              title: "Change Password",
              hasPadding: false,
            ),
            CustomTextInput(
                title: "Current Password",
                textController: currentPasswordController,
                hintText: "",
                isPassword: true),
            CustomTextInput(
              title: "New Password",
              hintText: "",
              isPassword: true,
              textController: newPasswordController,
            ),
            CustomTextInput(
              title: "Confirm New Password",
              hintText: "",
              textController: confirmNewPasswordController,
              isPassword: true,
            ),
            const Spacer(),
            SafeArea(
              child: CustomButton(
                onPressed: () {
                  if (currentPasswordController.text.isEmpty ||
                      newPasswordController.text.isEmpty ||
                      confirmNewPasswordController.text.isEmpty) {
                    showCustomSnackBar("All fields are required",
                        isError: true);
                    return;
                  }
                  if (newPasswordController.text !=
                      confirmNewPasswordController.text) {
                    showCustomSnackBar(
                        "New Password and Confirm Password does not match",
                        isError: true);
                    return;
                  }
                  profilecontroller.changePassword(
                    currentPasword: currentPasswordController.text,
                    newPassword: newPasswordController.text,
                    confirmNewPassword: confirmNewPasswordController.text,
                  );
                },
                buttonTitle: "Change Password",
              ),
            ),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}
