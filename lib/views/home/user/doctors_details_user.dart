import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/details_header.dart';
import 'package:med_meet_flutter/core/components/my_custom_appbar.dart';
import 'package:med_meet_flutter/core/components/review_card.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class DoctorsDetailsUserView extends StatelessWidget {
  const DoctorsDetailsUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Doctor Details"),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(24),
            child: ListView(
              children: [
                DetailsHeaeder(),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround, // Distribute space evenly
                  children: [
                    _buildInfoColumn(
                      value: '10',
                      label: 'Years Exp..',
                    ),
                    const VerticalDivider(
                      // Add a vertical separator
                      color: Colors.grey,
                      thickness: 1,
                      width: 20, // Adjust width for spacing
                    ),
                    _buildInfoColumn(
                      value: '4.5',
                      label: 'Rating',
                    ),
                    const VerticalDivider(
                      // Add a vertical separator
                      color: Colors.grey,
                      thickness: 1,
                      width: 20, // Adjust width for spacing
                    ),
                    _buildInfoColumn(
                      value: '700+',
                      label: 'Patients',
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "About",
                  style: AppTypography.appbarTitle,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Dr. Ayesha is a renowned cardiologist with expertise in managing critical heart conditions, preventive cardiology, and cardiac surgeries.",
                  style: AppTypography.bodyText1,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Reviews",
                  style: AppTypography.appbarTitle,
                ),
                SizedBox(
                  height: 8.h,
                ),
                ReviewCard(),
                ReviewCard(),
                ReviewCard(),
                ReviewCard(),
                ReviewCard(),
                ReviewCard(),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: Padding(
                padding: EdgeInsets.all(24),
                child: CustomButton(
                    onPressed: () {}, buttonTitle: "Book Appointment")),
          )
        ],
      ),
    );
  }

  Widget _buildInfoColumn({required String value, required String label}) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Minimize column size
      children: [
        Text(
          value,
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: Color(0xFF8A8A8A),
          ),
        ),
      ],
    );
  }
}
