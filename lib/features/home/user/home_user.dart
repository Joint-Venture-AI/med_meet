import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/components/bottom_navigation.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';
import 'package:med_meet_flutter/core/components/section_header.dart';
import 'package:med_meet_flutter/core/components/specialty_card.dart';
import 'package:med_meet_flutter/core/constants/image_assets.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class HomeUserView extends StatelessWidget {
  const HomeUserView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: ListView(
          children: [
            SearchField(),
            SizedBox(
              height: 12,
            ),
            SectionHeader(
              title: "Specialist",
              onTap: () {
                Get.toNamed(AppRoutes.specialtyUser);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildSpecialist(title: "Dentist", assetPath: SVGAssets.dentist),
                buildSpecialist(
                    title: "Nutrition", assetPath: SVGAssets.nutritionist),
                buildSpecialist(
                    title: "Eye Spe..", assetPath: SVGAssets.eyeSpecialist),
                buildSpecialist(
                    title: "Cardilog..",
                    assetPath: SVGAssets.cardiacSpecialist),
                buildSpecialist(title: "Stomach", assetPath: SVGAssets.stomach),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            SectionHeader(
              title: "Doctors",
              onTap: () {
                Get.toNamed(AppRoutes.doctorListUser);
              },
            ),
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(menuIndex: 0),
    );
  }

  PreferredSize buildCustomAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(ImageAssets.profilePic1),
                        radius: 20,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        children: [
                          Text(
                            "Good Morning",
                            style: AppTypography.bodyText1,
                          ),
                          Text(
                            "Nikenla Steve",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black),
                          )
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.notifications);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.border1),
                          shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.notifications,
                          color: AppColors.iconColor1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.doctorListUser);
      },
      child: Container(
        height: 44.h,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.search,
              color: AppColors.iconColor1,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Search for doctors",
              style: AppTypography.bodyText1,
            )
          ],
        ),
      ),
    );
  }
}
