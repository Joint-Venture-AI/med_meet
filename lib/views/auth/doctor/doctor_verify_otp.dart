import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/controller/auth_doctor_controller.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:pinput/pinput.dart';

class DoctorVerifyOtp extends StatelessWidget {
  DoctorVerifyOtp({super.key, required this.email, this.isSignUp = true});
  final String email;
  final bool isSignUp;
  final TextEditingController otpController = TextEditingController();
  final AuthDoctorsController authDoctorsController =
      Get.put(AuthDoctorsController());
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: GoogleFonts.roboto(
          fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFDDDEE0)),
        borderRadius: BorderRadius.circular(100),
      ),
    );

    final args = Get.arguments;

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create Account",
            style: AppTypography.headerText1,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'We’ve sent an OTP to your email \n $email',
            style: AppTypography.bodyText1,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 56,
          ),
          Pinput(
            closeKeyboardWhenCompleted: true,
            length: 6,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            keyboardType: TextInputType.number,
            defaultPinTheme: defaultPinTheme,
            onCompleted: (pin) => otpController.text = pin,
          ),
          SizedBox(
            height: 32,
          ),
          CustomButton(
              onPressed: () {
                authDoctorsController.verifyDoctorOtp(email, otpController.text,
                    isSignup: isSignUp);
              },
              buttonTitle: "Verify OTP")
        ],
      ),
    ));
  }
}
