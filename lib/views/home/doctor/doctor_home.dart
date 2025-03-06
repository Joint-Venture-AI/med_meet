import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/controller/home_doctor_controller.dart';
import 'package:med_meet_flutter/controller/zego_cloud_controller.dart';
import 'package:med_meet_flutter/core/components/cached_network_image.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';
import 'package:med_meet_flutter/core/components/section_header.dart';

import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class DoctorHomeView extends StatelessWidget {
  DoctorHomeView({super.key});
  final CommonController commonController = Get.put(CommonController());
  final HomeDoctorController homeDoctorController =
      Get.put(HomeDoctorController());

  final ZegoCloudController zegoCloudController =
      Get.put(ZegoCloudController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Obx(() {
              final scoreRef = homeDoctorController.doctorScore.value;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeAppointmentCounter(
                    count: scoreRef.upcoming.toString(),
                    type: "Upcomming",
                  ),
                  HomeAppointmentCounter(
                    count: scoreRef.completed.toString(),
                    type: "Completed",
                  ),
                  HomeAppointmentCounter(
                    count: scoreRef.total.toString(),
                    type: "total",
                  ),
                ],
              );
            }),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView(
                children: [
                  SectionHeader(
                      title: "Recent Appointments",
                      onTap: () {
                        Get.toNamed(AppRoutes.doctorAllApointmentLists);
                      }),
                  SizedBox(
                    height: 12,
                  ),
                  Obx(() {
                    final upcomingRef =
                        homeDoctorController.upcomingAppointments;
                    return upcomingRef.isEmpty
                        ? Center(
                            child: Text("No Appointments Yet"),
                          )
                        : Column(
                            children: upcomingRef.take(2).map((e) {
                            return DoctorCard(
                              isAppointment: true,
                              id: e.appointmentID,
                              userID: e.userID,
                              name: e.name,
                              image: e.image,
                              specialist: e.specialist,
                              date: e.date.toString(),
                              time: "${e.startTime} - ${e.endTime}",
                            );
                          }).toList());
                  }),

                  SizedBox(
                    height: 12,
                  ),
                  SectionHeader(
                      title: "Doctor's",
                      onTap: () {
                        Get.toNamed(AppRoutes.doctorListUser, arguments: true);
                      }),
                  SizedBox(
                    height: 12,
                  ),

                  Obx(() {
                    return homeDoctorController.allDoctors.isEmpty
                        ? Center(
                            child: Text("No doctors found"),
                          )
                        : Column(
                            children: homeDoctorController.allDoctors
                                .map(
                                  (doc) => DoctorCard(
                                    id: doc.id,
                                    name: doc.name,
                                    image: doc.image,
                                    isDoctorToDoctor: true,
                                    avarageRating: doc.avgRating.toString(),
                                    specialist: doc.specialist.name,
                                    clinic: doc.clinic,
                                  ),
                                )
                                .toList(),
                          );
                  })
                  // DoctorCard(
                  //   isDoctorToDoctor: true,
                  // ),
                  // DoctorCard(
                  //   isDoctorToDoctor: true,
                  // ),
                  // DoctorCard(
                  //   isDoctorToDoctor: true,
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  PreferredSize buildCustomAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(() {
                        return cachedImage(
                          url: homeDoctorController.doctorData.value.image,
                          size: 50,
                          borderRadius: 100,
                        );
                      }),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Morning",
                            style: AppTypography.bodyText1,
                          ),
                          Obx(() {
                            return Text(
                              homeDoctorController.doctorData.value.name,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.black),
                            );
                          })
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.notifications);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.border1),
                          shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.notifications,
                          color: AppColors.iconColor1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}

class HomeAppointmentCounter extends StatelessWidget {
  const HomeAppointmentCounter({
    super.key,
    required this.count,
    required this.type,
  });

  final String count;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: 110.w,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withAlpha(50),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1))
        ],
      ),
      child: Column(
        children: [
          Text(
            count,
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: Color(0xFF1E65FF),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            type,
            style: AppTypography.bodyText1,
          ),
        ],
      ),
    );
  }
}
