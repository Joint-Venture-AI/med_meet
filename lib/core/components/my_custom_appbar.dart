import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:med_meet_flutter/core/utils/app_colors.dart";
import "package:med_meet_flutter/core/utils/app_typography.dart";

AppBar customAppBar({title = ""}) {
  return AppBar(
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
              border: Border.all(color: AppColor.border1),
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
  );
}
