import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';
import 'package:med_meet_flutter/models/options.dart';

class DoctorProfileView extends StatelessWidget {
  const DoctorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var options = [
      Options(
        name: "Personal Information",
        icon: "assets/svg/personal_information.svg",
        link: AppRoutes.personalInformation,
      ),
      Options(
        name: "Doctor Details",
        icon: "assets/svg/medical_records.svg",
        link: AppRoutes.doctorDetailsProfile,
      ),
      Options(name: "Schedule", icon: "assets/svg/schedule.svg"),
      Options(
        name: "Earnings",
        icon: "assets/svg/earnings.svg",
        link: AppRoutes.doctorEarnings,
      ),
      Options(
        name: "Reviews",
        icon: "assets/svg/reviews.svg",
        link: AppRoutes.doctorReviewsProfile,
      ),
      Options(
        name: "Settings",
        icon: "assets/svg/settings.svg",
        link: AppRoutes.settings,
      ),
      Options(name: "Logout", icon: "assets/svg/logout.svg"),
    ];

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Color(0xfff2f5f7),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Stack(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SafeArea(
                          child: SizedBox(
                            height: 64,
                            child: Center(
                              child: Text(
                                "Profile",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        ClipOval(
                          child: Image.asset(
                            "assets/images/profile_pic.jfif",
                            fit: BoxFit.cover,
                            height: 120,
                            width: 120,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Andrew Ainsley",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                            onTap: () {
                              if (e.link != null) {
                                Get.toNamed(e.link!);
                              } else if (e.name == "Logout") {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: 3,
                                          width: 40,
                                          color: Color(0xffE8E8E8),
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          "Logout",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xffDD3663),
                                          ),
                                        ),
                                        SizedBox(height: 12),
                                        Divider(
                                          color: Color(0xffDDDEE0),
                                        ),
                                        SizedBox(height: 12),
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
                                        SizedBox(height: 12),
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
                                                  Get.back();
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
                                      padding:
                                          const EdgeInsets.only(right: 12.0),
                                      child: svgViewer(
                                          asset: e.icon!,
                                          height: 18,
                                          width: 18),
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
      ],
    );
  }
}
