import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class PatientInformationCard extends StatelessWidget {
  const PatientInformationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border1),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Patient Information",
            style: AppTypography.appbarTitle,
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "First Name",
                    style: AppTypography.bodyText1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Gender",
                    style: AppTypography.bodyText1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Age",
                    style: AppTypography.bodyText1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Problem",
                    style: AppTypography.bodyText1,
                  ),
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ":",
                    style: AppTypography.bodyText1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    ":",
                    style: AppTypography.bodyText1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    ":",
                    style: AppTypography.bodyText1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    ":",
                    style: AppTypography.bodyText1,
                  ),
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Andrew Ainsley",
                      style: AppTypography.bodyText1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Male",
                      style: AppTypography.bodyText1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "27",
                      style: AppTypography.bodyText1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
                      style: AppTypography.bodyText1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
