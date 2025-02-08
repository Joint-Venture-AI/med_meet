import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final args = Get.arguments ?? false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
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
    );
  }
}
