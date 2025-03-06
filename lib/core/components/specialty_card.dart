import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/cached_network_image.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:med_meet_flutter/views/home/user/specialty_list_user.dart';

GestureDetector buildSpecialist({title, assetPath, specialtyID}) {
  return GestureDetector(
    onTap: () {
      Get.to(() => SpecialtyListUserView(
            specialtyID: specialtyID,
            specialty: title,
          ));
    },
    child: Column(
      children: [
        Container(
          height: 56.h,
          width: 56.w,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: AppColors.background1, shape: BoxShape.circle),
          child: cachedImage(url: assetPath, size: 42),
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
