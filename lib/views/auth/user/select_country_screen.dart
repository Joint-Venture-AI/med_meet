// ignore_for_file: unused_local_variable

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/controller/auth_controllers/Ui/select_coountry_controller.dart';
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
  String countryName = "Select Your country";
  String flag = "";

  @override
  Widget build(BuildContext context) {
    final SelectCountryController selectCountryController =
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
                      showCountryPicker(
                        context: context,
                        showPhoneCode: false,
                        onSelect: (Country country) {
                          setState(() {
                            countryName = country.name;
                            flag = country.flagEmoji;
                            selectCountryController.setCountry(countryName);
                          });
                        },
                        countryListTheme: CountryListThemeData(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                          inputDecoration: InputDecoration(
                            labelText: 'Search',
                            hintText: 'Start typing to search',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.border1,
                                ),
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          searchTextStyle: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                    child: Container(
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
                              if (flag != "") Text(flag),
                              if (flag != "")
                                SizedBox(
                                  width: 8,
                                ),
                              Text(
                                countryName,
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
                ],
              ),
            ),
          ),
          CustomButton(
            buttonTitle: "Continue",
            onPressed: showDialogFunc,
          ),
        ],
      ),
    ));
  }

  void showDialogFunc() {
    if (countryName == "Select Your country") {
      Get.snackbar("Empty Field", "Please select your country");
      return;
    }
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
                      style: TextStyle(fontSize: 29, color: Color(0xff333333)),
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
  }
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
