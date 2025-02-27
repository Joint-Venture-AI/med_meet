import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class PatientInformationCard extends StatelessWidget {
  const PatientInformationCard({
    super.key,
    required this.firstName,
    required this.gender,
    required this.age,
    required this.problem,
  });

  final String firstName;
  final String gender;
  final String age;
  final String problem;

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
                      firstName,
                      style: AppTypography.bodyText1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      gender,
                      style: AppTypography.bodyText1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      age,
                      style: AppTypography.bodyText1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      problem,
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
