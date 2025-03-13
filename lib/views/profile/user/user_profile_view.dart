import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/controller/home_user_controller.dart';
import 'package:med_meet_flutter/controller/profile_controller.dart';
import 'package:med_meet_flutter/core/components/cached_network_image.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/helpers/pref_helper.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';
import 'package:med_meet_flutter/models/options.dart';

class UserProfileView extends StatelessWidget {
  UserProfileView({super.key});

  final Profilecontroller profilecontroller = Get.put(Profilecontroller());
  final UserHomeController userHomeController = Get.find<UserHomeController>();
  final CommonController commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    var options = [
      Options(
        name: "Personal Information",
        icon: "assets/svg/personal_information.svg",
        link: AppRoutes.userPersonalInformation,
      ),
      Options(
        name: "Prescriptions",
        icon: "assets/svg/medical_records.svg",
        link: AppRoutes.prescriptionList,
      ),
      Options(
        name: "Medical Records",
        icon: "assets/svg/medical_records.svg",
        link: AppRoutes.medicalRecords,
      ),
      Options(
        name: "Settings",
        icon: "assets/svg/settings.svg",
        link: AppRoutes.settings,
      ),
      Options(name: "Logout", icon: "assets/svg/logout.svg"),
    ];

    return RefreshIndicator(
      onRefresh: () async {
        userHomeController.fetchUserData();
      },
      child: SingleChildScrollView(
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
                      color: Color(0xff90A4AE),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 24,
                      ),
                      child: Image.asset(
                        "assets/images/profile_bg.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomAppBar(
                          title: "Profile",
                          isDark: false,
                          hasLeading: false,
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        Obx(() {
                          final image = userHomeController.userData.value.image;
                          return ClipOval(child: cachedImage(url: image));
                        }),
                        const SizedBox(
                          height: 16,
                        ),
                        Obx(() {
                          final name = userHomeController.userData.value.name;
                          return Text(
                            name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.5,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 0.5,
                    color: Color(0xffDDDEE0),
                  ),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 24,
                      color: Colors.black.withAlpha(13),
                    )
                  ],
                ),
                child: Column(
                  spacing: 16,
                  children: [
                    ...options.map(
                      (e) {
                        var isLastElement =
                            (options.indexOf(e) == options.length - 1);

                        return GestureDetector(
                          onTap: () async {
                            if (e.name == "Medical Records") {
                              final userID = await PrefsHelper.getString(
                                  PrefsKey.accountID);
                              commonController.getAllMedicalRecords(userID);
                            }
                            if (e.name == "Prescriptions") {
                              await profilecontroller.getAllPrescription();
                            }
                            if (e.link != null) {
                              Get.toNamed(e.link!);
                            } else if (e.name == "Logout") {
                              showModalBottomSheet(
                                context: Get.context!,
                                backgroundColor: Colors.white,
                                builder: (context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: 8),
                                      Container(
                                        height: 3,
                                        width: 40,
                                        color: Color(0xffE8E8E8),
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        "Logout",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Color(0xffEE1D23),
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Divider(
                                        color: Color(0xffDDDEE0),
                                      ),
                                      SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                        ),
                                        child: Text(
                                          "Are you sure you want to log out?",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff545454),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 24),
                                      Row(
                                        children: [
                                          const SizedBox(width: 24),
                                          Expanded(
                                            child: CustomButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              buttonTitle: "Cancel",
                                              height: 48,
                                              isSecondary: true,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: CustomButton(
                                              onPressed: () {
                                                profilecontroller.logOut();
                                              },
                                              buttonTitle: "Yes, Logout",
                                              height: 48,
                                            ),
                                          ),
                                          const SizedBox(width: 24),
                                        ],
                                      ),
                                      SizedBox(height: 40),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: isLastElement
                                    ? BorderSide.none
                                    : BorderSide(
                                        width: 0.5,
                                        color: Color(
                                          0xffDDDEE0,
                                        ),
                                      ),
                              ),
                            ),
                            child: Row(
                              children: [
                                if (e.icon != null)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: svgViewer(
                                        asset: e.icon!, height: 18, width: 18),
                                  ),
                                Text(
                                  e.name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
