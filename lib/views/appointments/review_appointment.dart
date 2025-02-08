import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/components/my_custom_appbar.dart';
import 'package:med_meet_flutter/core/constants/image_assets.dart';

class ReviewAppointmentView extends StatelessWidget {
  const ReviewAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController reviewController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: "Review"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(
          children: [
            SizedBox(
              height: 24.h,
            ),
            CircleAvatar(
              radius: 80.r,
              child: Image(image: AssetImage(ImageAssets.doctorImage2)),
            ),
            SizedBox(
              height: 16.h,
            ),
            FractionallySizedBox(
              widthFactor: 0.7,
              child: Text(
                "How was your experience with Dr. Drake Boeson?",
                style: GoogleFonts.roboto(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            StarRating(size: 42, rating: 3.5),
            SizedBox(
              height: 20.h,
            ),
            Divider(),
            SizedBox(
              height: 24.h,
            ),
            CustomTextInput(
              textController: reviewController,
              hintText: "Your review here",
              maxLines: 6,
            ),
            SizedBox(
              height: Get.height * 0.2,
            ),
            CustomButton(onPressed: () {}, buttonTitle: "Submit Review")
          ],
        ),
      ),
    );
  }
}
