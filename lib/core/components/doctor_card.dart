import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/constants/image_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.doctorDetailsUser);
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 12),
          width: double.infinity,
          height: 112.h,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.border1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      ImageAssets.doctorImage1,
                      height: 90.h,
                      width: 81.w,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dr. Ananya Sharma",
                          style: AppTypography.appbarTitle),
                      Row(
                        children: [
                          Text(
                            "Dentist",
                            style: AppTypography.bodyText1,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("|"),
                          SizedBox(
                            width: 8,
                          ),
                          Text("City Hostpital",
                              style: AppTypography.bodyText3),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amberAccent,
                          ),
                          Text(
                            "4.5",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Text(
                      "\$5.22",
                      style: AppTypography.priceStyle,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
