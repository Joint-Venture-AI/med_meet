import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:pinput/pinput.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key});
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
            'We’ve sent an OTP to your email \n example@gmail.com',
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
            onCompleted: (pin) => print(pin),
          ),
          SizedBox(
            height: 32,
          ),
          CustomButton(
              onPressed: () {
                if (args == OTPTYPE.forgetPass) {
                  Get.toNamed(AppRoutes.newPassword);
                }
                if (args == OTPTYPE.user) {
                  Get.offAllNamed(AppRoutes.signIn);
                } else if (args == OTPTYPE.doctor) {
                  Get.toNamed(AppRoutes.verifyProgressDoctor);
                }
              },
              buttonTitle: "Verify OTP")
        ],
      ),
    ));
  }

  SizedBox otpBox(context, int index) {
    return SizedBox(
      height: 54,
      width: 54,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: Theme.of(context).disabledColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
