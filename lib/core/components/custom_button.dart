import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
    this.width,
    this.height,
    this.isSecondary = false,
  });
  final VoidCallback onPressed;
  final String buttonTitle;
  final double? width;
  final double? height;
  final bool isSecondary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width * 0.9,
      height: height ?? 48.h,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  isSecondary ? Colors.transparent : AppColors.button1,
              shadowColor: Colors.transparent,
              side: BorderSide(
                color: Color(0xffDDDEE0),
              )),
          child: Text(
            buttonTitle,
            style: isSecondary
                ? AppTypography.bodyText3white.copyWith(
                    color: Color(0xff8A8A8A),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )
                : AppTypography.bodyText3white,
          )),
    );
  }
}
