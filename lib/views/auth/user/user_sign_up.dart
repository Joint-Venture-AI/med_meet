import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/components/auth_components/circular_checkbox.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';


class SignupUserView extends StatelessWidget {
   SignupUserView({super.key});

  final _isChecked = false.obs; //
  // Make isChecked observable

  bool get isChecked => _isChecked.value;

  void toggleCheckbox(bool newValue) {
    _isChecked.value = newValue;
  }

   final TextEditingController nameController = TextEditingController();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: SingleChildScrollView(
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
                    textController: nameController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextInput(
                    title: "Email",
                    hintText: "example@gmail.com",
                    textController: emailController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextInput(
                    title: "Password",
                    hintText: "password",
                    isPassword: true,
                    textController: passwordController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() => GestureDetector(
                        onTap: () {

                              toggleCheckbox(!isChecked);
                        },
                        child: CircularCheckbox(
                            isActive: isChecked),
                      )),
                  SizedBox(
                    height: 34,
                  ),
                  CustomButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.userVerifOtp,
                            arguments: OTPTYPE.userSignUp);
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
                            Get.toNamed(AppRoutes.userSignIn);
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
        ));
  }
}
