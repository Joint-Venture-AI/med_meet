// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/controller/auth_controllers/select_coountry_controller.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class SelectCountryScreen extends StatelessWidget {
  const SelectCountryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final SelectCountryController homeController =
        Get.put(SelectCountryController());
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 89,
                  ),
                  SvgPicture.asset(
                    SVGAssets.locationColorful,
                    height: 80.h,
                    width: 80.w,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    "Select Your Country",
                    style: AppTypography.headerText1,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    "Please choose your country to personalize your experience and ensure accurate services",
                    style: AppTypography.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  GestureDetector(
                    onTapDown: (details) {
                      RenderBox box = context.findRenderObject() as RenderBox;
                      Offset globalPosition =
                          box.globalToLocal(details.globalPosition);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Stack(
                              children: [
                                Positioned(
                                  top: details.globalPosition.dy,
                                  left: 120,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(12),
                                    elevation: 5,
                                    child: SizedBox(
                                      width: 264,
                                      child: AlertDialog(
                                          contentPadding: EdgeInsets.zero,
                                          insetPadding: EdgeInsets.all(12),
                                          backgroundColor: Colors.transparent,
                                          content: SizedBox(
                                            height: Get.height / 2,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                color: AppColors
                                                                    .border1))),
                                                    child: TextField(
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText: "Search",
                                                        hintStyle: TextStyle(
                                                          color:
                                                              Color(0xFF9CA3AF),
                                                          fontSize: 14,
                                                        ),
                                                        prefixIcon: Icon(
                                                          Icons.search,
                                                          color:
                                                              Color(0xFF9CA3AF),
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                  buildCountry(),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                )
                              ],
                            );
                          });
                    },
                    child: Obx(
                      () => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.border1),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                if (homeController.flag != "")
                                  SvgPicture.asset(homeController.flag),
                                if (homeController.flag != "")
                                  SizedBox(
                                    width: 8,
                                  ),
                                Text(
                                  homeController.country,
                                  style: AppTypography.bodyText2,
                                ),
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.typography1,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            buttonTitle: "Continue",
            onPressed: () {
              Get.toNamed(AppRoutes.userSignIn);
            },
          ),
        ],
      ),
    ));
  }

  Padding buildCountry({name = "Bangladesh", flag = 'assets/bd_flag.svg'}) {
    final SelectCountryController homeController =
        Get.put(SelectCountryController());
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
      child: GestureDetector(
        onTap: () {
          homeController.setCountry(name);
          homeController.setFlag(flag);
        },
        child: Row(
          children: [
            SvgPicture.asset(
              SVGAssets.flagBD,
              height: 16,
              width: 16,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              "Bangladesh",
              style: AppTypography.bodyText2,
            )
          ],
        ),
      ),
    );
  }

  void showDialogFunc() {}
}
