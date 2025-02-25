import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class CustomTextInput extends StatefulWidget {
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
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.renderTitle && widget.title != null)
            Text(widget.title!, style: AppTypography.bodyText1Black),
          if (widget.renderTitle)
            SizedBox(
              height: 8.h,
            ),
          Container(
              height: widget.multiLine ?? false ? 130 : null,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (widget.icon != null) Icon(widget.icon),
                      if (widget.icon != null) SizedBox(width: 8.w),
                      Flexible(
                        child: TextField(
                          keyboardType: widget.isPhone
                              ? TextInputType.phone
                              : TextInputType.text,
                          inputFormatters: widget.isPhone
                              ? [FilteringTextInputFormatter.digitsOnly]
                              : [],
                          controller: widget.textController,
                          maxLines: widget.maxLines,
                          enabled: widget.isEnabled,
                          obscureText: widget.isPassword ? obscureText : false,
                          decoration: InputDecoration(
                            // enabled: false,
                            border: InputBorder.none,
                            hintText: widget.hintText,
                          ),
                        ),
                      ),
                      if (widget.endIcon != null) Icon(widget.endIcon),
                      if (widget.endIconButton != null) widget.endIconButton!,
                      if (widget.isPassword)
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            child: Icon(
                              obscureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                              color: Color(0xFF545454),
                            )),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
