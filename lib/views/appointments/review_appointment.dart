import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/controller/appointment_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/constants/image_assets.dart';

class ReviewAppointmentView extends StatelessWidget {
  ReviewAppointmentView({super.key, required this.appointmentId});
  final String appointmentId;
  final AppointmentController appointmentController =
      Get.find<AppointmentController>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController reviewController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(title: "Review")),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Expanded(
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
                    // star rating
                    Obx(() {
                      return StarRating(
                          size: 42,
                          allowHalfRating: true,
                          rating:
                              appointmentController.userAppointmentrating.value,
                          onRatingChanged: (rating) => appointmentController
                              .userAppointmentrating.value = rating);
                    }),
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
                  ],
                ),
              ),
              CustomButton(
                  onPressed: () {
                    appointmentController.postReviewToAppointment(
                        appointmentID: appointmentId,
                        ratting: appointmentController.userAppointmentrating,
                        review: reviewController.text);
                  },
                  buttonTitle: "Submit Review"),
              SizedBox(
                height: 24,
              )
            ],
          )),
    );
  }
}
