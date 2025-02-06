import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/controllers/custom_text_controller.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    super.key,
    required this.title,
    required this.hintText,
    this.isPassword = false,
    this.isPhone = false,
    this.maxLines = 1,
    this.icon,
    this.renderTitle = true,
    this.endIcon,
    this.endIconButton,
  });

  final String title;
  final String hintText;
  final bool isPassword;
  final bool isPhone;
  final int maxLines;
  final IconData? icon;
  final bool renderTitle;
  final IconData? endIcon;
  final Widget? endIconButton;

  @override
  Widget build(BuildContext context) {
    final CustomTextController controller = Get.put(CustomTextController());

    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (renderTitle) Text(title, style: AppTypography.bodyText1Black),
          if (renderTitle)
            SizedBox(
              height: 8.h,
            ),
          Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Obx(
                () => Row(
                  children: [
                    if (icon != null) Icon(icon),
                    if (icon != null) SizedBox(width: 8.w),
                    if (isPhone)
                      DropdownButton<String>(
                        value: controller.dropDownVal, // Current selected value
                        icon: const Icon(
                            Icons.keyboard_arrow_down), // Dropdown arrow icon
                        isExpanded: false,
                        padding: EdgeInsets.zero,
                        elevation: 16, // Elevation of the dropdown menu
                        style: AppTypography.bodyText1, // Text style
                        underline: Container(),
                        onChanged: (String? newValue) {
                          controller.setDropDown(newValue!);
                        },
                        items: controller.items.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    Flexible(
                      child: TextField(
                        maxLines: maxLines,
                        obscureText: controller.passShown,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: hintText),
                      ),
                    ),
                    if (endIcon != null) Icon(endIcon),
                    if (endIconButton != null) endIconButton!,
                    if (isPassword)
                      GestureDetector(
                          onTap: () {
                            controller.setPassShown(!controller.passShown);
                          },
                          child: Icon(controller.passShown
                              ? Icons.visibility_off_outlined
                              : Icons.visibility)),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
