import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_drop_down.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

class AddMedicalRecords extends StatelessWidget {
  const AddMedicalRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: "Medical Records"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextInput(
                      title: "Name",
                      hintText: "Andrew Ainsley",
                      textController: TextEditingController(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextInput(
                      title: "Age",
                      hintText: "Andrew Ainsley",
                      textController: TextEditingController(),
                    ),
                    CustomDropDown(
                      title: "Gender",
                      dropDownItems: [
                        "Male",
                        "Female",
                      ],
                    ),
                    CustomTextInput(
                      title: "Write Medical History",
                      hintText: "Write here...",
                      textController: TextEditingController(),
                      maxLines: 6,
                    ),
                    CustomTextInput(
                      title: "Add Prescription",
                      hintText: "Upload files",
                      textController: TextEditingController(),
                      endIconButton: svgViewer(
                        asset: "assets/svg/file.svg",
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      onPressed: () {
                        Get.back();
                      },
                      buttonTitle: "Submit",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
