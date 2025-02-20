import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_drop_down.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/components/date_input.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

class BookPatientDetialsView extends StatefulWidget {
  const BookPatientDetialsView({super.key});

  @override
  State<BookPatientDetialsView> createState() => _BookPatientDetialsViewState();
}

class _BookPatientDetialsViewState extends State<BookPatientDetialsView> {
  List<File> images = [];

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();
    final TextEditingController problemController = TextEditingController();
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
                      hintText: "Jonah Smaith",
                      textController: nameController,
                      title: "Name",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomDropDown(
                        title: "Gender", dropDownItems: ["Male", "Female"]),
                    SizedBox(
                      height: 10,
                    ),
                    DateInput(
                      dateController: ageController,
                      icon: Icons.calendar_month,
                      hintText: "DD/MM/YY",
                      title: "Birth Date",
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
                        "Upload your symptomps",
                        style: AppTypography.bodyText1Black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DottedBorder(
                      color: AppColors.border1,
                      dashPattern: [8, 8],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 8,
                                    children: [
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      svgViewer(
                                        asset: "assets/svg/add_image.svg",
                                        color: Color(0xff1E65FF),
                                      ),
                                      Text(
                                        "Upload images",
                                        style: AppTypography.bodyText1Black,
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
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
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
                                        ImagePicker()
                                            .pickMultiImage()
                                            .then((value) {
                                          for (var e in value) {
                                            setState(() {
                                              images.add(File(e.path));
                                            });
                                          }
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffe3e3e3),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Colors.grey.withAlpha(
                                              127,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            spacing: 8,
                                            children: [
                                              svgViewer(
                                                asset:
                                                    "assets/svg/add_image.svg",
                                                height: 16,
                                                width: 16,
                                                color: Color(0xff545454),
                                              ),
                                            ],
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
                                            ImagePicker()
                                                .pickMultiImage()
                                                .then((value) {
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
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                                          right: -5,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                images.removeAt(index - 1);
                                              });
                                            },
                                            child: Container(
                                              height: 24,
                                              width: 24,
                                              decoration: BoxDecoration(
                                                color:
                                                    Colors.black.withAlpha(200),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.close_rounded,
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
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    CustomButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.bookCardDetails);
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
}
