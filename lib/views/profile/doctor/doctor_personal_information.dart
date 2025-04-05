import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_meet_flutter/controller/home_doctor_controller.dart';
import 'package:med_meet_flutter/controller/profile_controller.dart';
import 'package:med_meet_flutter/core/components/cached_network_image.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/components/date_input.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

class DoctorPersonalInformation extends StatefulWidget {
  const DoctorPersonalInformation({super.key});

  @override
  State<DoctorPersonalInformation> createState() =>
      _DoctorPersonalInformationState();
}

class _DoctorPersonalInformationState extends State<DoctorPersonalInformation> {
  bool isEditing = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // Getx Controllers
  final Profilecontroller profileController = Get.put(Profilecontroller());
  final HomeDoctorController homeDoctorController =
      Get.put(HomeDoctorController());

  @override
  void initState() {
    final data = homeDoctorController.doctorData.value;

    nameController.text = data.name;
    emailController.text = data.email;
    if (data.dob == "Unknown") {
      dobController.text = "Unknown";
    } else {
      dobController.text =
          DateFormat("dd-MM-yyyy").format(DateTime.parse(data.dob));
    }

    addressController.text = data.clinicAddress;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    dobController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(16),
                      ),
                      color: isEditing ? Colors.transparent : Color(0xff90A4AE),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 24,
                      ),
                      child: Image.asset(
                        "assets/images/profile_bg.png",
                        color: isEditing ? Colors.transparent : null,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomAppBar(
                            title: "Profile",
                            isDark: isEditing,
                          ),
                          const SizedBox(
                            height: 36,
                          ),
                          Obx(() {
                            final doctorRef =
                                homeDoctorController.doctorData.value;
                            return ClipOval(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  cachedImage(url: doctorRef.image, size: 120),
                                  if (isEditing)
                                    if (profileController
                                            .displayPicture.value !=
                                        "")
                                      Image.file(
                                        File(profileController
                                            .displayPicture.value),
                                        fit: BoxFit.cover,
                                        height: 120,
                                        width: 120,
                                      ),
                                  if (isEditing)
                                    GestureDetector(
                                      onTap: profileController.pickImage,
                                      child: Container(
                                        height: 120,
                                        width: 120,
                                        color: Colors.black
                                            .withAlpha((255 * 0.30).toInt()),
                                      ),
                                    ),
                                  if (isEditing)
                                    svgViewer(
                                      asset: "assets/svg/camera.svg",
                                      height: 32,
                                    ),
                                ],
                              ),
                            );
                          }),
                          const SizedBox(
                            height: 16,
                          ),
                          Obx(() {
                            return Text(
                              isEditing
                                  ? "Change your profile picture"
                                  : homeDoctorController.doctorData.value.name,
                              style: TextStyle(
                                fontSize: isEditing ? 14 : 18,
                                fontWeight: FontWeight.w400,
                                color: isEditing
                                    ? Color(0xff333333)
                                    : Colors.white,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Obx(() {
                  final data = homeDoctorController.doctorData.value;
                  return Column(
                    spacing: 16,
                    children: [
                      CustomTextInput(
                        renderTitle: false,
                        hintText: data.name,
                        isEnabled: isEditing,
                        textController: nameController,
                        icon: Icons.person,
                      ),
                      CustomTextInput(
                        renderTitle: false,
                        hintText: data.phoneNumber,
                        isEnabled: isEditing,
                        icon: Icons.call_rounded,
                        textController: phoneController,
                      ),
                      DateInput(
                          dateController: dobController,
                          isEnabled: isEditing,
                          icon: Icons.cake,
                          iconStart: true,
                          isLargeIcon: true,
                          hintText: data.dob),
                      CustomTextInput(
                        renderTitle: false,
                        hintText: data.clinicAddress,
                        isEnabled: isEditing,
                        icon: Icons.location_on_rounded,
                        maxLines: 2,
                        multiLine: true,
                        textController: addressController,
                      ),
                      if (!isEditing)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isEditing = true;
                            });
                          },
                          behavior: HitTestBehavior.translucent,
                          child: AbsorbPointer(
                            child: CustomTextInput(
                              renderTitle: false,
                              hintText: "Edit Profile",
                              icon: Icons.edit,
                              textController: TextEditingController(),
                            ),
                          ),
                        ),
                      if (isEditing)
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: CustomButton(
                            onPressed: () async {
                              setState(() {
                                isEditing = !isEditing;
                              });

                              await profileController.updateProfile(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                dob: dobController.text,
                                address: addressController.text,
                              );
                            },
                            buttonTitle:
                                isEditing ? "Update Profile" : "Edit Profile",
                            isSecondary: !isEditing,
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
