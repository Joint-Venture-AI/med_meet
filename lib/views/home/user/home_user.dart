import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/controller/home_user_controller.dart';
import 'package:med_meet_flutter/controller/zego_cloud_controller.dart';
import 'package:med_meet_flutter/core/components/cached_network_image.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';
import 'package:med_meet_flutter/core/components/section_header.dart';
import 'package:med_meet_flutter/core/components/specialty_card.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class HomeUserView extends StatelessWidget {
  HomeUserView({super.key});
  final UserHomeController userHomeController = Get.put(UserHomeController());
  final ZegoCloudController zegoCloudController =
      Get.put(ZegoCloudController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          await userHomeController.fetchUserData();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
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
              Obx(
                () => Row(
                  spacing: 20,
                  children: userHomeController.specialtyList
                      .take(5)
                      .map((e) => buildSpecialist(
                          title: e.name, assetPath: e.image, specialtyID: e.id))
                      .toList(),
                ),
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
              Expanded(
                child: Obx(
                  () {
                    final doctors = userHomeController.allDoctors;
                    return doctors.isEmpty
                        ? Center(
                            child: Text("No Doctors found yet"),
                          )
                        : ListView.builder(
                            itemCount: doctors.length,
                            itemBuilder: (context, index) => DoctorCard(
                              id: doctors[index].id,
                              image: doctors[index].image,
                              name: doctors[index].name,
                              avarageRating:
                                  doctors[index].avgRating.toString(),
                              clinic: doctors[index].clinic,
                              fee: doctors[index].consultationFee.toString(),
                              specialist: doctors[index].specialist.name,
                            ),
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize buildCustomAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() => cachedImage(
                        url: userHomeController.userData.value.image,
                        size: 50,
                        borderRadius: 100)),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning",
                          style: AppTypography.bodyText1,
                        ),
                        Obx(
                          () => Text(
                            userHomeController.userData.value.name.toString(),
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                        ),
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
        ),
      ),
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
