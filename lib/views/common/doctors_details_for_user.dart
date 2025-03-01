import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/controller/home_user_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/details_header.dart';
import 'package:med_meet_flutter/core/components/review_card.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:med_meet_flutter/views/booking/book_schedule_screen.dart';

class DoctorsDetailsForUser extends StatelessWidget {
  DoctorsDetailsForUser({super.key, required this.doctorId});

  final String doctorId;
  final UserHomeController userHomeController = Get.find<UserHomeController>();

  @override
  Widget build(BuildContext context) {
    userHomeController.getSingleDoctor(doctorId);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(title: "Doctor Details")),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    return DetailsHeaeder(
                      image: userHomeController.singleDoctorData.value.image,
                      addressOrEmail: userHomeController
                          .singleDoctorData.value.clinicAddress,
                      name: userHomeController.singleDoctorData.value.name,
                      fee: userHomeController
                          .singleDoctorData.value.consultationFee
                          .toString(),
                      specialty: userHomeController
                          .singleDoctorData.value.specialist.name,
                    );
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceAround, // Distribute space evenly
                      children: [
                        _buildInfoColumn(
                          value: userHomeController
                              .singleDoctorData.value.experience
                              .toString(),
                          label: 'Years Exp..',
                        ),
                        const VerticalDivider(
                          // Add a vertical separator
                          color: Colors.grey,
                          thickness: 1,
                          width: 20, // Adjust width for spacing
                        ),
                        _buildInfoColumn(
                          value: userHomeController
                              .singleDoctorData.value.avgRating
                              .toString(),
                          label: 'Rating',
                        ),
                        const VerticalDivider(
                          // Add a vertical separator
                          color: Colors.grey,
                          thickness: 1,
                          width: 20, // Adjust width for spacing
                        ),
                        _buildInfoColumn(
                          value:
                              "${userHomeController.singleDoctorData.value.totalPatientsCount}+",
                          label: 'Patients',
                        ),
                      ],
                    );
                  }),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "About",
                    style: AppTypography.appbarTitle,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Obx(() {
                    return Text(
                      userHomeController.singleDoctorData.value.aboutDoctor,
                      style: AppTypography.bodyText1,
                    );
                  }),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "Reviews",
                    style: AppTypography.appbarTitle,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Obx(() {
                    return Column(
                      children:
                          userHomeController.singleDoctorData.value.reviews
                              .map((e) => ReviewCard(
                                    reviewModel: e,
                                  ))
                              .toList(),
                    );
                  }),
                  SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Padding(
                padding: EdgeInsets.all(24),
                child: CustomButton(
                    onPressed: () {
                      Get.to(() => BookScheduleScreenView(
                            doctorModel:
                                userHomeController.singleDoctorData.value,
                          ));
                    },
                    buttonTitle: "Book Appointment")),
          )
        ],
      ),
    );
  }

  Widget _buildInfoColumn({required String value, required String label}) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Minimize column size
      children: [
        Text(
          value,
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: Color(0xFF8A8A8A),
          ),
        ),
      ],
    );
  }
}
