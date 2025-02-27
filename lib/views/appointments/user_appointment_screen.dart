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
        child: Obx(
          () => appointmentController.userAppointmentList.isEmpty
              ? Center(
                  child: Text("No Appointments"),
                )
              : ListView.builder(
                  itemCount: appointmentController.userAppointmentList.length,
                  itemBuilder: (context, index) => DoctorCard(
                    status:
                        appointmentController.userAppointmentList[index].status,
                    id: appointmentController.userAppointmentList[index].id,
                    name: appointmentController.userAppointmentList[index].name,
                    image:
                        appointmentController.userAppointmentList[index].image,
                    specialist: appointmentController
                        .userAppointmentList[index].specialist,
                    time:
                        "${appointmentController.userAppointmentList[index].startTime} - ${appointmentController.userAppointmentList[index].endTime}",
                    date: appointmentController.userAppointmentList[index].date
                        .toString(),
                  ),
                ),
        ),
      ),
    );
  }
}
