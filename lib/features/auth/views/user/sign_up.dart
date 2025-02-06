import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/features/auth/auth_components/circular_checkbox.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:med_meet_flutter/features/auth/controllers/check_box_controller.dart';

class SignupUserView extends StatelessWidget {
  const SignupUserView({super.key});
  @override
  Widget build(BuildContext context) {
    final CheckBoxController checkBoxController = CheckBoxController();
    return Scaffold(
        extendBody: true,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create Account",
                      style: AppTypography.headerText1,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text('Join us to start your health journey',
                        style: AppTypography.bodyText1),
                    SizedBox(
                      height: 56,
                    ),
                    CustomTextInput(
                      title: "Name",
                      hintText: "Enter Name",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextInput(
                      title: "Email",
                      hintText: "example@gmail.com",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextInput(
                      title: "Password",
                      hintText: "password",
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(() => GestureDetector(
                          onTap: () {
                            checkBoxController
                                .toggleCheckbox(!checkBoxController.isChecked);
                          },
                          child: CircularCheckbox(
                              isActive: checkBoxController.isChecked),
                        )),
                    SizedBox(
                      height: 34,
                    ),
                    CustomButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.verifOtp,
                              arguments: OTPTYPE.user);
                        },
                        buttonTitle: "Sign Up"),
                    SizedBox(
                      height: 56,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: AppTypography.bodyText2,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.signIn);
                            },
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xFF333333)),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
