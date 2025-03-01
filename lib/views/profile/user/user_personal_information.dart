import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_meet_flutter/controller/home_user_controller.dart';
import 'package:med_meet_flutter/controller/profile_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

class UserPersonalInformation extends StatefulWidget {
  const UserPersonalInformation({super.key});

  @override
  State<UserPersonalInformation> createState() =>
      _UserPersonalInformationState();
}

class _UserPersonalInformationState extends State<UserPersonalInformation> {
  bool isEditing = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final UserHomeController userHomeController = Get.find<UserHomeController>();
  final Profilecontroller profilecontroller = Get.put(Profilecontroller());

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
                          ClipOval(
                            child: Obx(() {
                              final user = userHomeController.userData.value;
                              final image =
                                  profilecontroller.displayPicture.value;
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.network(
                                    imageUrl(user.image),
                                    fit: BoxFit.cover,
                                    height: 120,
                                    width: 120,
                                  ),
                                  if (isEditing && image.isNotEmpty)
                                    Image.file(
                                      File(image),
                                      fit: BoxFit.cover,
                                      height: 120,
                                      width: 120,
                                    ),
                                  if (isEditing)
                                    GestureDetector(
                                      onTap: profilecontroller.pickImage,
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
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Obx(() {
                            final name = userHomeController.userData.value.name;
                            return Text(
                              isEditing ? "Change your profile picture" : name,
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
                  final user = userHomeController.userData.value;
                  return Column(
                    spacing: 16,
                    children: [
                      CustomTextInput(
                        renderTitle: false,
                        hintText: user.name,
                        // isEnabled: isEditing,
                        textController: nameController,
                        icon: Icons.person,
                      ),
                      CustomTextInput(
                        renderTitle: false,
                        hintText: user.email,
                        icon: Icons.mail_rounded,
                        textController: emailController,
                      ),
                      CustomTextInput(
                        renderTitle: false,
                        hintText: DateFormat("dd-MM-yyyy").format(user.dob),
                        icon: Icons.cake_rounded,
                        textController: dobController,
                      ),
                      CustomTextInput(
                        renderTitle: false,
                        hintText: user.address,
                        icon: Icons.location_on_rounded,
                        maxLines: 3,
                        textController: addressController,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                        onPressed: () async {
                          setState(() {
                            isEditing = !isEditing;
                          });
                          if (!isEditing) {
                           await profilecontroller.updateProfile(
                              name: nameController.text,
                              email: emailController.text,
                              dob: dobController.text,
                              address: addressController.text,
                            );
                          }
                        },
                        buttonTitle:
                            isEditing ? "Update Profile" : "Edit Profile",
                        isSecondary: !isEditing,
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
