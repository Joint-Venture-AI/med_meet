import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/my_custom_appbar.dart';
import 'package:med_meet_flutter/core/components/review_card.dart';
import 'package:med_meet_flutter/core/constants/image_assets.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
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
                Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border1),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 46.r,
                            backgroundImage:
                                AssetImage(ImageAssets.doctorImage1),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            "Dr. Ananya Sharma",
                            style: AppTypography.doctorNameStyle,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text("Dentist", style: AppTypography.bodyText1),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text("Christ Hospital in London, UK",
                              style: AppTypography.bodyText1),
                        ],
                      ),
                      Text("\$40", style: AppTypography.priceStyle),
                    ],
                  ),
                ),
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
