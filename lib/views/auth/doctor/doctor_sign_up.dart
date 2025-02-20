import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/controller/auth_controllers/Api/doctor_auth.dart';
import 'package:med_meet_flutter/controller/auth_controllers/Ui/select_coountry_controller.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/components/auth_components/circular_checkbox.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:med_meet_flutter/controller/auth_controllers/Ui/check_box_controller.dart';

class SingupDoctorView extends StatelessWidget {
  const SingupDoctorView({super.key});
  @override
  Widget build(BuildContext context) {
    final CheckBoxController checkBoxController = CheckBoxController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController doctorIdController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    SelectCountryController selectCountryController =
        Get.find<SelectCountryController>();
    DoctorAuthServiceController doctorAuthServiceController =
        Get.put(DoctorAuthServiceController());
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
                    title: "Doctor's ID Number",
                    hintText: "Doctor's ID number",
                    textController: doctorIdController,
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
                          checkBoxController
                              .toggleCheckbox(!checkBoxController.isChecked);
                        },
                        child: CircularCheckbox(
                            isActive: checkBoxController.isChecked),
                      )),
                  SizedBox(
                    height: 34,
                  ),
                  Obx(
                    () => CustomButton(
                        onPressed: () async {
                          if (checkBoxController.isChecked) {
                            await doctorAuthServiceController.doctorSignUp(
                                nameController.text,
                                emailController.text,
                                doctorIdController.text,
                                passwordController.text,
                                selectCountryController.country);
                          } else {
                            Get.snackbar("Terms and Condtion",
                                "You must agree with our terms and conditions beofre continue");
                          }
                          // Get.toNamed(AppRoutes.doctorDetails, arguments: true);
                        },
                        isLoading: doctorAuthServiceController.isLoading,
                        buttonTitle: "Sign Up"),
                  ),
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
                            Get.toNamed(AppRoutes.doctorSignIn);
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
