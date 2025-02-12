import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class CircularCheckbox extends StatelessWidget {
  const CircularCheckbox({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: isActive ? Color(0xFF1E65FF) : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.border1),
          ),
          child: isActive
              ? Icon(
                  Icons.check,
                  size: 12,
                  color: Colors.white,
                  weight: 24,
                )
              : null,
        ),
        SizedBox(
          width: 5,
        ),
        Row(
          children: [
            Text("Agree With ", style: AppTypography.bodyText1Black),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.termsOfServices),
              child: Text(
                "Terms & Condition",
                style: AppTypography.bodyText1Black
                    .copyWith(color: Color(0xFF1E65FF)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
