import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_meet_flutter/core/constants/image_assets.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class DetailsHeaeder extends StatelessWidget {
  const DetailsHeaeder({
    super.key,
    this.isAppointment = false,
  });

  final bool isAppointment;

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
          SizedBox(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 46.r,
                backgroundImage: AssetImage(isAppointment
                    ? ImageAssets.userImage1
                    : ImageAssets.doctorImage1),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                isAppointment ? "Alex Wilson" : "Dr. Ananya Sharma",
                style: AppTypography.doctorNameStyle,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(isAppointment ? "Patient" : "Dentist",
                  style: AppTypography.bodyText1),
              SizedBox(
                height: 8.h,
              ),
              Text(
                  isAppointment
                      ? "example@gmail.com"
                      : "Christ Hospital in London, UK",
                  style: AppTypography.bodyText1),
            ],
          ),
          if (!isAppointment) Text("\$40", style: AppTypography.priceStyle),
          if (isAppointment) SizedBox(),
        ],
      ),
    );
  }
}
