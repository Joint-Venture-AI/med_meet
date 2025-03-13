import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_meet_flutter/core/components/cached_network_image.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';
import 'package:med_meet_flutter/models/single_doctor_model.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.reviewModel});

  final ReviewModel reviewModel;

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
                  // Reviewer Image
                  ClipOval(
                      child: cachedImage(url: reviewModel.image, size: 32)),
                  SizedBox(
                    width: 16,
                  ),
                  // Reviewer Name
                  Text(
                    reviewModel.name,
                    style: TextStyle(fontSize: 18, color: Color(0xff333333)),
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
                      reviewModel.rating.toString(),
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          height: 0.5),
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
            reviewModel.review,
            style: TextStyle(
              color: Color(0xFF545454),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            getTimeAgo(reviewModel.createdAt.toString()),
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
