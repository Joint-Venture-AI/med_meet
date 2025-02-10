import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/details_header.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';

class BookReviewSummaryView extends StatelessWidget {
  const BookReviewSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    void confirmAppointment() {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.white,
              child: Container(
                height: 470,
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.border1,
                  ),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(SVGAssets.confirmAppointmentIcon),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Congratulations!",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF333333)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Appointment successfully booked. You will receive a notification and the doctor you selected will contact you.",
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Color(0xFF8A8A8A),
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    CustomButton(
                        onPressed: () {
                          Get.until(
                              (route) => Get.currentRoute == AppRoutes.userApp);
                        },
                        buttonTitle: "Go to Home")
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: CustomAppBar(title: "Review Summary")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                DetailsHeaeder(),
                SizedBox(
                  height: 20,
                ),
                BookingDetailsCard(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  " Your Problem",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Hello Dr. Jenny, I have a problem with my immune system. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
            Positioned(
                bottom: 30,
                child: CustomButton(
                    onPressed: confirmAppointment, buttonTitle: "continue"))
          ],
        ),
      ),
    );
  }
}

class BookingDetailsCard extends StatelessWidget {
  const BookingDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20), // Padding inside the card
        child: Column(
          mainAxisSize: MainAxisSize.min, // To keep the card size tight
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the left
          children: <Widget>[
            _buildRow('Date & Hour', 'Dec 23, 2024 | 10:00 AM'),
            _buildRow('Booking For', 'Alex john'),
            _buildRow('Gender', 'Male'),
            _buildRow('Age', '42'),
            _buildRow('Amount', '\$40'),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 8.0), // Padding between rows
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
