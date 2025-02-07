import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/images/review_girl.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(
                    "Charolette Hanlin",
                    style: AppTypography.appbarTitle,
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border1),
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Row(
                  children: [
                    svgViewer(
                      asset: "assets/svg/reviews.svg",
                      height: 12,
                      width: 12,
                      color: Color(0xffFFB701),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "Dr. Jenny is very professional in her work and responsive. I have consulted and my problem is solved. 😍😍",
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF545454),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text("6 days ago", style: AppTypography.timeStyle),
        ],
      ),
    );
  }
}
