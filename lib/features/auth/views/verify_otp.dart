import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/routes/app_routes.dart';
import 'package:med_meet_flutter/core/routes/otp_routes.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key});
  @override
  Widget build(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              otpBox(context, 0),
              otpBox(context, 1),
              otpBox(context, 2),
              otpBox(context, 3),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          CustomButton(
              onPressed: () {
                if (args == OtpRoutes.forgotPass) {
                  Get.toNamed(AppRoutes.newPassword);
                }
                if (args == OtpRoutes.user) {
                  Get.offAllNamed(AppRoutes.signIn);
                } else if (args == OtpRoutes.doctor) {
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
      width: 76,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Theme.of(context).disabledColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
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
