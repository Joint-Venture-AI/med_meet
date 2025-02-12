import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
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
  final TextEditingController dobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

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
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/profile_pic.jfif",
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: 120,
                                ),
                                if (isEditing)
                                  Container(
                                    height: 120,
                                    width: 120,
                                    color: Colors.black
                                        .withAlpha((255 * 0.30).toInt()),
                                  ),
                                if (isEditing)
                                  svgViewer(
                                    asset: "assets/svg/camera.svg",
                                    height: 32,
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            isEditing
                                ? "Change your profile picture"
                                : "Andrew Ainsley",
                            style: TextStyle(
                              fontSize: isEditing ? 14 : 18,
                              fontWeight: FontWeight.w400,
                              color:
                                  isEditing ? Color(0xff333333) : Colors.white,
                            ),
                          ),
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
                child: Column(
                  spacing: 16,
                  children: [
                    CustomTextInput(
                      renderTitle: false,
                      hintText: "Andrew Ainsley",
                      // isEnabled: isEditing,
                      textController: nameController,
                      icon: Icons.person,
                    ),
                    CustomTextInput(
                      renderTitle: false,
                      hintText: "andres.do@gmail.com",
                      icon: Icons.mail_rounded,
                      textController: emailController,
                    ),
                    CustomTextInput(
                      renderTitle: false,
                      hintText: "+8848585661",
                      icon: Icons.call_rounded,
                      textController: TextEditingController(),
                    ),
                    CustomTextInput(
                      renderTitle: false,
                      hintText: "10 Jan 2001",
                      icon: Icons.cake_rounded,
                      textController: dobController,
                    ),
                    CustomTextInput(
                      renderTitle: false,
                      hintText:
                          "2713 |Westheimer Rd, |Santa Ana, Illionis 526548",
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
                            textController: emailController,
                          ),
                        ),
                      ),
                    if (isEditing)
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: CustomButton(
                          onPressed: () {
                            setState(() {
                              isEditing = !isEditing;
                            });
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
