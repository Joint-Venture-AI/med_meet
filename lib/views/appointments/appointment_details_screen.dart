import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_meet_flutter/controller/appointment_controller.dart';
import 'package:med_meet_flutter/controller/home_doctor_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/details_header.dart';
import 'package:med_meet_flutter/core/components/patient_information_card.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:med_meet_flutter/views/appointments/review_appointment.dart';

class AppointmentDetailsView extends StatelessWidget {
  AppointmentDetailsView({super.key, required this.appointmentID});

  final String appointmentID;
  final AppointmentController appointmentController =
      Get.put(AppointmentController());
  final HomeDoctorController homeDoctorController =
      Get.put(HomeDoctorController());

  @override
  Widget build(BuildContext context) {
    // args is false when it comes from user screen and true when it comes from doctor
    final args = Get.arguments ?? false;
    // Fetching the appointment details with appointmendID

    appointmentController.getAppointmentDetails(appointmentID);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: "Appointment Details",
          tailing: args
              ? GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.notesScreen);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.background1,
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 3),
                        child: SvgPicture.asset(SVGAssets.noteIcon)),
                  ),
                )
              : null,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    final appointRef =
                        appointmentController.appointmentDetails.value;
                    if (args) {
                      return DetailsHeaeder(
                        isAppointment: args,
                        name: appointRef.user.name,
                        image: appointRef.user.image,
                        addressOrEmail: appointRef.user.phoneNumber,
                        fee: appointRef.doctor.consultationFee.toString(),
                        specialty: "patient",
                      );
                    } else {
                      return DetailsHeaeder(
                        isAppointment: args,
                        name: appointRef.doctor.name,
                        image: appointRef.doctor.image,
                        addressOrEmail: appointRef.doctor.clinicAddress,
                        fee: appointRef.doctor.consultationFee.toString(),
                        specialty: appointRef.doctor.specialist,
                      );
                    }
                  }),
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
                                  // TODO: get id for user from the api and implement the button
                                  // Obx(() {
                                  //   final appointRef = appointmentController
                                  //       .appointmentDetails.value;

                                  //   return callButton();
                                  // })
                                ],
                              )
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          DateFormat('dd MMMM yyyy').format(DateTime.parse(
                              appointmentController
                                  .appointmentDetails.value.date
                                  .toString())),
                          style: AppTypography.bodyText1,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          appointmentController
                              .appointmentDetails.value.startTime,
                          style: AppTypography.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Obx(() {
                    return PatientInformationCard(
                      firstName: appointmentController
                          .appointmentDetails.value.patientDetails.fullName,
                      age: appointmentController
                          .appointmentDetails.value.patientDetails.age
                          .toString(),
                      gender: appointmentController
                          .appointmentDetails.value.patientDetails.gender,
                      problem: appointmentController.appointmentDetails.value
                          .patientDetails.problemDescription,
                    );
                  }),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                ],
              ),
            ),
            Obx(
              () {
                final details = appointmentController.appointmentDetails.value;
                if (args) {
                  // When doctor
                  return details.status == 'Completed'
                      ? Container()
                      : CustomButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.createPrescription);
                          },
                          buttonTitle: "Send Prescription");
                } else {
                  // When user
                  return (details.status == 'Completed')
                      ? details.review.review == "No review"
                          ? CustomButton(
                              onPressed: () {
                                Get.to(() => ReviewAppointmentView(
                                    appointmentId: details.id));
                              },
                              buttonTitle: "Send Review")
                          : Container()
                      : CustomButton(
                          onPressed: () {
                            appointmentController.updateAppointmentStatus();
                          },
                          buttonTitle: "Complete Appoinment");
                }
              },
            ),
            SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}

// appointmentController.appointmentDetails.value.status ==
//                             "Complete" &&
//                         args
//                     ? Container()
//                     : Container(
//                         child: appointmentController.appointmentDetails.value
//                                         .review.review ==
//                                     "No review" &&
//                                 !args
//                             ? Container()
//                             : CustomButton(
//                                 onPressed: () {
//                                   if (!args) {
//                                     Get.to(() => ReviewAppointmentView(
//                                         appointmentId: appointmentID));
//                                   } else {
//                                     Get.toNamed(AppRoutes.createPrescription);
//                                   }
//                                 },
//                                 buttonTitle: args
//                                     ? "Send Prescription"
//                                     : appointmentController.appointmentDetails
//                                                 .value.status ==
//                                             "Completed"
//                                         ? "Send Review"
//                                         : "Completed"),
//  );
