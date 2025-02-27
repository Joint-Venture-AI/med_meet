import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/home_user_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';

class DoctorsListView extends StatelessWidget {
  DoctorsListView({super.key});
  final UserHomeController userHomeController = Get.find<UserHomeController>();

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? false;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            CustomAppBar(
              title: "Doctors",
              hasPadding: false,
            ),
            Expanded(
              child: Column(
                children: [
                  CustomTextInput(
                    title: "Search",
                    hintText: "Search",
                    icon: Icons.search,
                    renderTitle: false,
                    textController: userHomeController.searchController,
                    onChange: (val) {
                      userHomeController.filterDoctors(val);
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: Obx(() {
                      return ListView.builder(
                        itemCount: userHomeController.filteredDoctors.length,
                        itemBuilder: (context, index) {
                          return DoctorCard(
                            isDoctorToDoctor: args,
                            id: userHomeController.filteredDoctors[index].id,
                            image:
                                userHomeController.filteredDoctors[index].image,
                            name:
                                userHomeController.filteredDoctors[index].name,
                            avarageRating: userHomeController
                                .filteredDoctors[index].avgRating
                                .toString(),
                            clinic: userHomeController
                                .filteredDoctors[index].clinic,
                            fee: userHomeController
                                .filteredDoctors[index].consultationFee
                                .toString(),
                            specialist: userHomeController
                                .filteredDoctors[index].specialist.name,
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
