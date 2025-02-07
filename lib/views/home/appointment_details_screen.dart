import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/details_header.dart';
import 'package:med_meet_flutter/core/components/my_custom_appbar.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class AppointmentDetailsView extends StatelessWidget {
  const AppointmentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    return Scaffold(
      appBar: customAppBar(title: "Appointment Details"),
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
                        Icon(
                          Icons.videocam,
                          color: Color(0xFF07D11F),
                        ),
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
                  Text(
                    "Patient Information",
                    style: AppTypography.appbarTitle,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "First Name",
                            style: AppTypography.bodyText1,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Gender",
                            style: AppTypography.bodyText1,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Age",
                            style: AppTypography.bodyText1,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Problem",
                            style: AppTypography.bodyText1,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            ":",
                            style: AppTypography.bodyText1,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            ":",
                            style: AppTypography.bodyText1,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            ":",
                            style: AppTypography.bodyText1,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            ":",
                            style: AppTypography.bodyText1,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Andrew Ainsley",
                              style: AppTypography.bodyText1,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Male",
                              style: AppTypography.bodyText1,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "27",
                              style: AppTypography.bodyText1,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
                              style: AppTypography.bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            if (args)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border1),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF07D11F),
                          ),
                          child: Icon(
                            Icons.videocam,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        SizedBox(
                          width: 185,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Online Consultation",
                                style: AppTypography.doctorNameStyle,
                              ),
                              Text(
                                "Video call & messages with doctor",
                                style: AppTypography.bodyText1Black,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text("\$40", style: AppTypography.priceStyle),
                  ],
                ),
              ),
            if (!args)
              SizedBox(
                height: Get.height * 0.15,
              ),
            if (!args)
              CustomButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.reviewAppointment)
                  }, buttonTitle: "Complete Appointment")
          ],
        ),
      ),
    );
  }
}
