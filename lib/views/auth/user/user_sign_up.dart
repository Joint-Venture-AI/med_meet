import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/controller/auth_doctor_controller.dart';
import 'package:med_meet_flutter/controller/auth_user_controller.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/components/auth_components/circular_checkbox.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class SignupUserView extends StatefulWidget {
  const SignupUserView({super.key});

  @override
  State<SignupUserView> createState() => _SignupUserViewState();
}

class _SignupUserViewState extends State<SignupUserView> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isChecked = false;

  AuthUserController authUserController = Get.put(AuthUserController());
  AuthDoctorsController authDoctorsController =
      Get.put(AuthDoctorsController());

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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: CircularCheckbox(isActive: isChecked),
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  CustomButton(
                      onPressed: () {
                        if (isChecked) {
                          authUserController.userSignUp(
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                              authUserController.selectedCountry.value);
                        }
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
