import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

import '../../../core/helpers/route.dart';

class DoctorSignIn extends StatelessWidget {
  const DoctorSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign In",
                  style: AppTypography.headerText1,
                ),
                SizedBox(
                  height: 12,
                ),
                Text('Sign in to continue your health journey',
                    style: AppTypography.bodyText1),
                SizedBox(
                  height: 56,
                ),
                CustomTextInput(
                  title: "Email/Doctor ID",
                  hintText: "example@gmail.com",
                  textController: emailController,
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextInput(
                  title: "Password",
                  hintText: "password",
                  textController: passwordController,
                  isPassword: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.doctorForgetpass);
                        },
                        child: Text(
                          "Forgot Password",
                          style: AppTypography.bodyText2,
                        ))
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                CustomButton(
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.doctorApp);
                    },
                    buttonTitle: "Sign In"),
                SizedBox(
                  height: 56.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: AppTypography.bodyText2,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.signUpDoctor);
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xFF333333)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          ),
        ));
  }
}
