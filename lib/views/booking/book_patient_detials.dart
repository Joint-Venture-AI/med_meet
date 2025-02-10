import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_drop_down.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/components/my_custom_appbar.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';

class BookPatientDetialsView extends StatelessWidget {
  const BookPatientDetialsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();
    final TextEditingController problemController = TextEditingController();
    return Scaffold(
      appBar: customAppBar(title: "Patient Details"),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            CustomTextInput(
              hintText: "Jonah Smaith",
              textController: nameController,
              title: "Name",
            ),
            SizedBox(
              height: 10,
            ),
            CustomDropDown(title: "Gender", dropDownItems: ["Male", "Female"]),
            SizedBox(
              height: 10,
            ),
            CustomTextInput(
              hintText: "age",
              textController: ageController,
              title: "Age",
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextInput(
              hintText: "Write your problem.........",
              textController: problemController,
              title: "Write your problem",
              maxLines: 6,
            ),
            Spacer(),
            CustomButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.bookCardDetails);
                },
                buttonTitle: "Continue")
          ],
        ),
      ),
    );
  }
}
