import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/controller/home_user_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/details_header.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';

class BookReviewSummaryView extends StatelessWidget {
  BookReviewSummaryView({super.key});
  final UserHomeController userHomeController = Get.put(UserHomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
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
                Obx(() {
                  final doc = userHomeController.singleDoctorData.value;
                  return DetailsHeaeder(
                    addressOrEmail: doc.clinicAddress,
                    image: doc.image,
                    name: doc.name,
                    accID: doc.id,
                    role: "Doctor",
                    fee: doc.consultationFee.toString(),
                    specialty: doc.specialist.name,
                  );
                }),
                SizedBox(
                  height: 20,
                ),
                BookingDetailsCard(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your Problem",
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
                  child: Obx(() {
                    final problem = Get.find<CommonController>()
                        .patientDetails
                        .value
                        .problem;
                    return Text(
                      problem,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
            Positioned(
                bottom: 30,
                child: CustomButton(
                    onPressed: () {
                      Get.find<CommonController>().confirmAppointment();
                    },
                    buttonTitle: "continue"))
          ],
        ),
      ),
    );
  }

  void confirmAppointment() {
    showDialog(
      context: Get.context!,
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
                      Get.until((route) =>
                          (Get.currentRoute == AppRoutes.userApp ||
                              Get.currentRoute == AppRoutes.doctorApp));
                    },
                    buttonTitle: "Go to Home")
              ],
            ),
          ),
        );
      },
    );
  }
}

class BookingDetailsCard extends StatelessWidget {
  BookingDetailsCard({super.key});
  final CommonController commonController = Get.find<CommonController>();
  final UserHomeController userHomeController = Get.find<UserHomeController>();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20), // Padding inside the card
        child: Obx(() {
          final date = commonController.scheduledate.value;
          final time = commonController.selectedTimeSlot.value;
          final patient = commonController.patientDetails.value;
          final doc = userHomeController.singleDoctorData.value;
          return Column(
            mainAxisSize: MainAxisSize.min, // To keep the card size tight
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to the left
            children: <Widget>[
              _buildRow('Date & Hour',
                  '${DateFormat("dd MMMM yyyy").format(DateTime.parse(date))} | ${time.startTime}'),
              _buildRow('Booking For', patient.name),
              _buildRow('Gender', patient.gender),
              _buildRow('Age', patient.age.toString()),
              _buildRow('Amount', '\$${doc.consultationFee}'),
            ],
          );
        }),
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
