import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:med_meet_flutter/core/constants/svg_assets.dart";
import "package:med_meet_flutter/core/helpers/route.dart";
import "package:med_meet_flutter/core/utils/app_colors.dart";
import "package:med_meet_flutter/core/utils/app_typography.dart";

AppBar customAppBar({title = "", hasNote = false, hasPdfDownload = false}) {
  return AppBar(
    forceMaterialTransparency: true,
    backgroundColor: AppColors.scaffoldBackgroundColor,
    leading: GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Center(
        child: Container(
          height: 40,
          width: 40,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.border1),
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
              padding: EdgeInsets.only(left: 2),
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
              )),
        ),
      ),
    ),
    title: Text(
      title,
      style: AppTypography.appbarTitle,
    ),
    centerTitle: true,
    actions: [
      if (hasNote)
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.notesScreen);
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.background1,
            ),
            padding: EdgeInsets.all(12),
            child: SvgPicture.asset(SVGAssets.noteIcon),
          ),
        ),
      if (hasPdfDownload)
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.background1,
            ),
            padding: EdgeInsets.all(12),
            child: Icon(Icons.download_outlined),
          ),
        )
    ],
  );
}
