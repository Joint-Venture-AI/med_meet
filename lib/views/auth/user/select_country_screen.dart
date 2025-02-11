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
import 'package:med_meet_flutter/core/utils/uitls.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({super.key});

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  int index = -1;

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
              //   showModalBottomSheet(
              //     context: context,
              //     backgroundColor: Colors.white,
              //     builder: (context) {
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 24,
              //         ),
              //         child: SafeArea(
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               const SizedBox(
              //                 height: 48,
              //               ),
              //               Text(
              //                 "How will you use Medmeet?",
              //                 style: TextStyle(
              //                   fontSize: 29,
              //                   color: Color(0xff333333),
              //                 ),
              //                 textAlign: TextAlign.center,
              //               ),
              //               const SizedBox(
              //                 height: 40,
              //               ),
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   OptionWidget(
              //                     asset: SVGAssets.patientIcon,
              //                     label: "Patient",
              //                     isSelected: index == 0,
              //                     onTap: () {
              //                       setState(() {
              //                         index = 0;
              //                       });
              //                     },
              //                   ),
              //                   const SizedBox(
              //                     width: 48,
              //                   ),
              //                   OptionWidget(
              //                     asset: SVGAssets.doctorIcon,
              //                     label: "Doctor",
              //                     isSelected: index == 1,
              //                     onTap: () {
              //                       setState(() {
              //                         index = 1;
              //                       });
              //                     },
              //                   ),
              //                 ],
              //               ),
              //               const SizedBox(
              //                 height: 64,
              //               ),
              //               CustomButton(
              //                 onPressed: () {},
              //                 buttonTitle: "Continue",
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   );
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                builder: (context) {
                  int selectedIndex = 0; // Local variable to track selection

                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SafeArea(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 48),
                              Text(
                                "How will you use Medmeet?",
                                style: TextStyle(
                                    fontSize: 29, color: Color(0xff333333)),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OptionWidget(
                                    asset: SVGAssets.patientIcon,
                                    label: "Patient",
                                    isSelected: selectedIndex == 0,
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = 0;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 48),
                                  OptionWidget(
                                    asset: SVGAssets.doctorIcon,
                                    label: "Doctor",
                                    isSelected: selectedIndex == 1,
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = 1;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 64),
                              CustomButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  if (selectedIndex == 0) {
                                    Get.toNamed(AppRoutes.userSignIn);
                                  } else {
                                    Get.toNamed(AppRoutes.doctorSignIn);
                                  }
                                },
                                buttonTitle: "Continue",
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    ));
  }

  Padding buildCountry({name = "Bangladesh", flag = 'assets/svg/bd_flag.svg'}) {
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

class OptionWidget extends StatefulWidget {
  final String asset;
  final String label;
  final Function() onTap;
  final bool isSelected;

  const OptionWidget({
    required this.asset,
    required this.label,
    super.key,
    required this.onTap,
    required this.isSelected,
  });

  @override
  OptionWidgetState createState() => OptionWidgetState();
}

class OptionWidgetState extends State<OptionWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onTap();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.isSelected
                ? const Color(0xFF1E65FF)
                : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(4),
          // color:
          //     widget.isSelected ? const Color(0xFF1E65FF) : Colors.transparent,
        ),
        child: Column(
          children: [
            Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: widget.isSelected
                    ? Border.all(color: const Color(0xFF1E65FF))
                    : Border.all(color: const Color(0xFF525252)),
              ),
              child: Center(
                child: svgViewer(
                  asset: widget.asset,
                  color: widget.isSelected
                      ? const Color(0xFF1E65FF)
                      : Color(0xff525252),
                  height: 32,
                  width: 32,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 18,
                color: widget.isSelected
                    ? const Color(0xFF1E65FF)
                    : Color(0xff525252),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
