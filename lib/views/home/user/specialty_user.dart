import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/home_user_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/specialty_card.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';

class SpecialtyUserView extends StatelessWidget {
  SpecialtyUserView({super.key});
  final UserHomeController userHomeController = Get.find<UserHomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(title: "Specialty")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Obx(() {
          return Wrap(
            runAlignment: WrapAlignment.center,
            spacing: 38.w,
            runSpacing: 10.h,
            children: userHomeController.specialtyList
                .map(
                  (e) => buildSpecialist(
                      title: e.name,
                      assetPath: "${ApiConstants.baseAssetUrl}${e.image}",
                      specialtyID: e.id),
                )
                .toList(),
          );
        }),
      ),
    );
  }
}
