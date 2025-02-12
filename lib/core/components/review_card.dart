import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
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
                      height: 48,
                      width: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Charolette Hanlin",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff333333)
                    ),
                  )
                ],
              ),
              Container(
                height: 32,
                width: 60,
                // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border1),
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      "5",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        height: 0.5
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
            style: TextStyle(
              color: Color(0xFF545454),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "6 days ago",
            style: TextStyle(
              color: Color(0xff545454),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
