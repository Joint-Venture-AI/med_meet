import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:med_meet_flutter/models/single_doctor_model.dart';

class DetailsHeaeder extends StatelessWidget {
  const DetailsHeaeder({
    super.key,
    this.isAppointment = false,
    this.doctorModel,
    required this.name,
    required this.image,
    required this.addressOrEmail,
    this.fee,
    this.specialty,
    this.isDoctorToDoctor = false,
  });

  final bool isAppointment;
  final SingleDoctorModel? doctorModel;
  final String name;
  final String image;
  final String addressOrEmail;
  final String? fee;
  final String? specialty;
  final bool isDoctorToDoctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border1),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isAppointment) SizedBox(),
          if (!isAppointment)
            SizedBox(
              width: 30.w,
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 46.r,
                backgroundImage:
                    NetworkImage("${ApiConstants.baseAssetUrl}$image"),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                name,
                style: AppTypography.doctorNameStyle,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(specialty!, style: AppTypography.bodyText1),
              SizedBox(
                height: 8.h,
              ),
              Text(addressOrEmail, style: AppTypography.bodyText1),
            ],
          ),
          if (!isAppointment && !isDoctorToDoctor)
            Text("\$$fee", style: AppTypography.priceStyle),
          if (isAppointment) SizedBox(),
          if (isDoctorToDoctor)
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.chatScreen),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border1),
                    shape: BoxShape.circle),
                child: Center(
                  child: SvgPicture.asset(
                    SVGAssets.chatOutlined,
                    color: Color(0xFF1E65FF),
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
