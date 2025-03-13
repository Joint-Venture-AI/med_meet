import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_drop_down.dart';
import 'package:med_meet_flutter/core/components/custom_snack_bar.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';
import 'package:med_meet_flutter/models/patient_details_model.dart';

class BookPatientDetialsView extends StatefulWidget {
  const BookPatientDetialsView({super.key});

  @override
  State<BookPatientDetialsView> createState() => _BookPatientDetialsViewState();
}

class _BookPatientDetialsViewState extends State<BookPatientDetialsView> {
  List<File> images = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController problemController = TextEditingController();
  CommonController commonController = Get.put(CommonController());
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    ageController.dispose();
    problemController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(title: "Patient Details")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextInput(
                      hintText: "Jonah Smaith......",
                      textController: nameController,
                      title: "Name",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => CustomDropDown(
                        title: "Gender",
                        dropDownItems: commonController.genders,
                        initialValue: commonController.selectedGender.value,
                        onChange: (String? newVal) {
                          commonController.setSelectedGender(newVal!);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextInput(
                      title: "Age",
                      hintText: "age...",
                      textController: ageController,
                      isPhone: true,
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
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Image Attachment (Optional)",
                        style: AppTypography.bodyText1Black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    uploadImageSection(),
                    SizedBox(
                      height: 14,
                    ),
                    CustomButton(
                      onPressed: () {
                        if (nameController.text.isEmpty ||
                            ageController.text.isEmpty ||
                            problemController.text.isEmpty) {
                          // when all fields are not filled
                          showCustomSnackBar("All fields are required");
                        } else {
                          // To make sure all fields are filled
                          commonController.patientDetails.value =
                              PatientDetailsModel(
                            name: nameController.text,
                            age: int.parse(ageController.text),
                            gender: commonController.selectedGender.value,
                            dob: ageController.text,
                            problem: problemController.text,
                            images: images,
                          );
                          Get.toNamed(AppRoutes.bookCardDetails);
                        }
                      },
                      buttonTitle: "Continue",
                    ),
                    SizedBox(
                      height: 14,
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

  DottedBorder uploadImageSection() {
    return DottedBorder(
      color: Color(0xff545454),
      dashPattern: [8],
      borderType: BorderType.RRect,
      radius: Radius.circular(8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: images.isEmpty
            ? GestureDetector(
                onTap: () {
                  ImagePicker().pickMultiImage().then((value) {
                    for (var e in value) {
                      setState(() {
                        images.add(File(e.path));
                      });
                    }
                  });
                },
                behavior: HitTestBehavior.translucent,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      svgViewer(
                        asset: "assets/svg/add_image.svg",
                        height: 20,
                        width: 20,
                        color: Color(0xff545454),
                      ),
                      Text(
                        "Upload images",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff333333)),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: images.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return GestureDetector(
                      onTap: () {
                        ImagePicker().pickMultiImage().then((value) {
                          for (var e in value) {
                            setState(() {
                              images.add(File(e.path));
                            });
                          }
                        });
                      },
                      child: DottedBorder(
                        dashPattern: [6],
                        color: Color(
                          0xffB0B0B0,
                        ),
                        borderType: BorderType.RRect,
                        radius: Radius.circular(8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffF4F6F7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8,
                              children: [
                                svgViewer(
                                  asset: "assets/svg/add_image.svg",
                                  height: 20,
                                  width: 20,
                                  color: Color(0xff545454),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ImagePicker().pickMultiImage().then((value) {
                              setState(() {
                                for (var e in value) {
                                  images.add(File(e.path));
                                }
                              });
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.border1,
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: FileImage(
                                  images[index - 1],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -5,
                          right: -2,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                images.removeAt(index - 1);
                              });
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(200),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.close_rounded,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
      ),
    );
  }
}
