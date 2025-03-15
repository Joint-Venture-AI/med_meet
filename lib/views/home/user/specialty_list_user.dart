import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/home_user_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';

class SpecialtyListUserView extends StatelessWidget {
  SpecialtyListUserView(
      {super.key, required this.specialtyID, required this.specialty});
  final String specialtyID;
  final String specialty;
  final UserHomeController userHomeController = Get.find<UserHomeController>();

  @override
  Widget build(BuildContext context) {
    userHomeController.getSpecialistDoctor(specialtyID);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(title: specialty)),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Obx(() {
          final ref = userHomeController.allSpecialistDoctors;
          return ref.isEmpty
              ? Center(
                  child: Text("No Doctors Yet"),
                )
              : ListView.builder(
                  itemCount: ref.length,
                  itemBuilder: (context, index) => DoctorCard(
                    id: ref[index].id,
                    image: ref[index].image,
                    name: ref[index].name,
                    avarageRating: ref[index].avgRating.toString(),
                    clinic: ref[index].clinic,
                    fee: ref[index].consultationFee.toString(),
                    specialist: ref[index].specialist.name,
                  ),
                );
        }),
      ),
    );
  }
}
