import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/appointment_controller.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';

class UserAppointmentScreenView extends StatelessWidget {
  UserAppointmentScreenView({super.key});

  final AppointmentController appointmentController =
      Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointments"),
        centerTitle: true,
        backgroundColor: AppColors.scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Obx(() {
          final ref = appointmentController.userAppointmentList;
          return ref.isEmpty
              ? Center(
                  child: Text("No Appointments"),
                )
              : ListView.builder(
                  itemCount: ref.length,
                  itemBuilder: (context, index) => DoctorCard(
                    userID: ref[index].userID,
                    status: ref[index].status,
                    id: appointmentController
                        .userAppointmentList[index].appointmentID,
                    name: ref[index].name,
                    image: ref[index].image,
                    specialist: appointmentController
                        .userAppointmentList[index].specialist,
                    time: "${ref[index].startTime} - ${ref[index].endTime}",
                    date: ref[index].date.toString(),
                  ),
                );
        }),
      ),
    );
  }
}
