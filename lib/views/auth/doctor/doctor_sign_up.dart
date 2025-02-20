import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/components/auth_components/circular_checkbox.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class SingupDoctorView extends StatelessWidget {
   SingupDoctorView({super.key});

  final _country = "".obs;

  String get country => _country.value;

  void setCountry(String opt) {
    _country.value = opt;
  }
   final _isChecked = false.obs; //
   // Make isChecked observable

   bool get isChecked => _isChecked.value;

   void toggleCheckbox(bool newValue) {
     _isChecked.value = newValue;
   }
   final TextEditingController nameController = TextEditingController();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController doctorIdController = TextEditingController();
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

                              toggleCheckbox(!isChecked);
                        },
                        child: CircularCheckbox(
                            isActive: isChecked),
                      )),
                  SizedBox(
                    height: 34,
                  ),
                  Obx(
                    () => CustomButton(
                        onPressed: () async {
                          if (isChecked) {

                          } else {
                            Get.snackbar("Terms and Condtion",
                                "You must agree with our terms and conditions beofre continue");
                          }
                          // Get.toNamed(AppRoutes.doctorDetails, arguments: true);
                        },
                        isLoading: false,
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
