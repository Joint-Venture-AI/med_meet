import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/controllers/custom_text_controller.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    super.key,
    this.title,
    required this.hintText,
    this.isPassword = false,
    this.isPhone = false,
    this.maxLines = 1,
    this.icon,
    this.renderTitle = true,
    this.isEnabled = true,
    this.multiLine,
    this.endIcon,
    this.endIconButton,
    required this.textController,
  });

  final String? title;
  final String hintText;
  final bool isPassword;
  final bool isPhone;
  final int maxLines;
  final IconData? icon;
  final bool renderTitle;
  final IconData? endIcon;
  final Widget? endIconButton;
  final bool? multiLine;
  final bool isEnabled;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    final CustomTextController controller = Get.put(CustomTextController());

    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (renderTitle && title != null)
            Text(title!, style: AppTypography.bodyText1Black),
          if (renderTitle)
            SizedBox(
              height: 8.h,
            ),
          Container(
              height: multiLine ?? false ? 130 : null,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Obx(
                    () => Row(
                      children: [
                        if (icon != null) Icon(icon),
                        if (icon != null) SizedBox(width: 8.w),
                        Flexible(
                          child: TextField(
                            keyboardType: isPhone
                                ? TextInputType.phone
                                : TextInputType.text,
                            inputFormatters: isPhone
                                ? [FilteringTextInputFormatter.digitsOnly]
                                : [],
                            controller: textController,
                            maxLines: maxLines,
                            enabled: isEnabled,
                            obscureText: controller.passShown,
                            decoration: InputDecoration(
                              // enabled: false,
                              border: InputBorder.none,
                              hintText: hintText,
                            ),
                          ),
                        ),
                        if (endIcon != null) Icon(endIcon),
                        if (endIconButton != null) endIconButton!,
                        if (isPassword)
                          GestureDetector(
                              onTap: () {
                                controller.setPassShown(!controller.passShown);
                              },
                              child: Icon(
                                controller.passShown
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility,
                                color: Color(0xFF545454),
                              )),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
