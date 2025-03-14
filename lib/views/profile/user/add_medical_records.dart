import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/controller/profile_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_drop_down.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class AddMedicalRecords extends StatelessWidget {
  AddMedicalRecords({super.key});

  final CommonController commonController = Get.put(CommonController());
  final Profilecontroller profilecontroller = Get.put(Profilecontroller());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController historyController = TextEditingController();

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
                      hintText: "Enter your name...",
                      textController: nameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextInput(
                      title: "Age",
                      hintText: "Enter your age...",
                      isPhone: true,
                      textController: ageController,
                    ),
                    Obx(() {
                      return CustomDropDown(
                        title: "Gender",
                        dropDownItems: commonController.genders,
                        initialValue: commonController.selectedGender.value,
                        onChange: (String? newVal) {
                          commonController.setSelectedGender(newVal!);
                        },
                      );
                    }),
                    CustomTextInput(
                      title: "Write Medical History",
                      hintText: "Write here...",
                      textController: historyController,
                      maxLines: 6,
                    ),
                    // Custom file picker ui
                    SizedBox(
                      height: 16.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Prescription",
                          style: AppTypography.bodyText1Black,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Obx(() {
                          final fileName =
                              commonController.pickedFileName.value;
                          return GestureDetector(
                            onTap: commonController.pickFile,
                            child: Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.border1),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    fileName == "" ? "Upload Files" : fileName,
                                    style: AppTypography.bodyText1Black,
                                  ),
                                  Transform.rotate(
                                      angle: -45, child: Icon(Icons.attachment))
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                    const Spacer(),
                    CustomButton(
                      onPressed: () {
                        final filePath = commonController.pickedFilePath.value;
                        profilecontroller.createMedicalRecord(
                            name: nameController.text,
                            age: int.parse(ageController.text),
                            gender: commonController.selectedGender.value,
                            historty: historyController.text,
                            filePath: filePath);
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
