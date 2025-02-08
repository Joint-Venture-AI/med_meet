import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/details_header.dart';
import 'package:med_meet_flutter/core/components/my_custom_appbar.dart';
import 'package:med_meet_flutter/core/components/patient_information_card.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class AppointmentDetailsView extends StatelessWidget {
  const AppointmentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // args is true when it comes from doctor screen and false when it comes from user
    final args = Get.arguments != null ? true : false;
    return Scaffold(
      appBar: customAppBar(title: "Appointment Details", hasNote: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            DetailsHeaeder(
              isAppointment: args,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border1),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Scheduled Appointment",
                        style: AppTypography.appbarTitle,
                      ),
                      if (args)
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.chatScreen);
                              },
                              child: SvgPicture.asset(
                                SVGAssets.chatOutlined,
                                color: Color(0xFF1E65FF),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.callScreen);
                              },
                              child: Icon(
                                Icons.videocam,
                                color: Color(0xFF1E65FF),
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Today, December 22, 2022",
                    style: AppTypography.bodyText1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "16:00 PM",
                    style: AppTypography.bodyText1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            PatientInformationCard(),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: Get.height * 0.15,
            ),
            CustomButton(
                onPressed: () {
                  if (!args) {
                    Get.toNamed(AppRoutes.reviewAppointment);
                  } else {
                    Get.toNamed(AppRoutes.createPrescription);
                  }
                },
                buttonTitle: args ? "Send Prescription" : "Complete")
          ],
        ),
      ),
    );
  }
}
