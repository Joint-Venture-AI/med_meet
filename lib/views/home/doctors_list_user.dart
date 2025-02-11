import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
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
                    textController: searchController,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return DoctorCard(
                          isDoctorToDoctor: args,
                        );
                      },
                    ),
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
