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
          return ListView.builder(
            itemCount: userHomeController.allSpecialistDoctors.length,
            itemBuilder: (context, index) => DoctorCard(
              id: userHomeController.allSpecialistDoctors[index].id,
              image: userHomeController.allSpecialistDoctors[index].image,
              name: userHomeController.allSpecialistDoctors[index].name,
              avarageRating: userHomeController
                  .allSpecialistDoctors[index].avgRating
                  .toString(),
              clinic: userHomeController.allSpecialistDoctors[index].clinic,
              fee: userHomeController
                  .allSpecialistDoctors[index].consultationFee
                  .toString(),
              specialist: userHomeController
                  .allSpecialistDoctors[index].specialist.name,
            ),
          );
        }),
      ),
    );
  }
}
