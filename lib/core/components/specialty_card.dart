import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

GestureDetector buildSpecialist({title, assetPath}) {
  return GestureDetector(
    onTap: () {
      Get.toNamed(AppRoutes.specialtyListUser);
    },
    child: Column(
      children: [
        Container(
          height: 56.h,
          width: 56.w,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: AppColors.background1, shape: BoxShape.circle),
          child: SvgPicture.asset(assetPath),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: AppTypography.bodyText1Black,
        )
      ],
    ),
  );
}
