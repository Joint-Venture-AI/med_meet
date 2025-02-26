import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/controller/user/auth_user_controller.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:pinput/pinput.dart';

class UserVerifyOtpView extends StatelessWidget {
  UserVerifyOtpView({super.key, required this.email, this.isForgotPass = true});
  final String email;
  final bool isForgotPass;

  final AuthUserController authUserController = Get.put(AuthUserController());
  final TextEditingController otpController = TextEditingController();
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            keyboardType: TextInputType.number,
            defaultPinTheme: defaultPinTheme,
            length: 6,
            onCompleted: (pin) {
              otpController.text = pin;
            },
          ),
          SizedBox(
            height: 32,
          ),
          CustomButton(
              onPressed: () {
                authUserController.userVerifyEmail(email, otpController.text,
                    isforgetPass: isForgotPass);
              },
              buttonTitle: "Verify OTP")
        ],
      ),
    ));
  }
}
