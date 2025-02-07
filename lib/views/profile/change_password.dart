import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
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
                hintText: "hintText",
                isPassword: true),
            CustomTextInput(
                title: "New Password", hintText: "hintText", isPassword: true),
            CustomTextInput(
              title: "Confirm New Password",
              hintText: "hintText",
              isPassword: true,
            ),
            const Spacer(),
            SafeArea(
              child: CustomButton(
                  onPressed: () {}, buttonTitle: "Change Password"),
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
