import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/home_doctor_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';

class DoctorAllAppointmentList extends StatelessWidget {
  DoctorAllAppointmentList({super.key});
  final HomeDoctorController homeDoctorController =
      Get.find<HomeDoctorController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(title: "All Appointments")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: Column(
          children: [
            SizedBox(height: 12),
            Expanded(child: Obx(() {
              final appRef = homeDoctorController.allAppointments;
              return ListView.builder(
                itemCount: appRef.length,
                itemBuilder: (context, index) {
                  final app = appRef[index];
                  return DoctorCard(
                    userID: app.userID,
                    id: app.appointmentID,
                    name: app.name,
                    image: app.image,
                    date: app.date.toString(),
                    time: "${app.startTime} - ${app.endTime}",
                    isAppointment: true,
                  );
                },
              );
            }))
          ],
        ),
      ),
    );
  }
}
