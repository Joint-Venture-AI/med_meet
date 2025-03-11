import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/controller/home_doctor_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/details_header.dart';
import 'package:med_meet_flutter/core/components/review_card.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class DoctorDetailsForDoctor extends StatelessWidget {
  DoctorDetailsForDoctor({super.key, required this.docID});
  final String docID;
  final HomeDoctorController homeDoctorController =
      Get.put(HomeDoctorController());
  @override
  Widget build(BuildContext context) {
    homeDoctorController.getSingleDoctor(docID);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(title: "Doctor Details")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: ListView(
          children: [
            Obx(() {
              final docRef = homeDoctorController.singleDoctorData.value;
              return DetailsHeaeder(
                name: docRef.name,
                accID: docRef.id,
                role: "Doctor",
                addressOrEmail: docRef.clinicAddress,
                image: docRef.image,
                fee: docRef.consultationFee.toString(),
                specialty: docRef.specialist.name,
                isDoctorToDoctor: true,
              );
            }),
            SizedBox(
              height: 20.h,
            ),
            Obx(() {
              final docRef = homeDoctorController.singleDoctorData.value;
              return Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround, // Distribute space evenly
                children: [
                  _buildInfoColumn(
                    value: docRef.experience.toString(),
                    label: 'Years Exp..',
                  ),
                  const VerticalDivider(
                    // Add a vertical separator
                    color: Colors.grey,
                    thickness: 1,
                    width: 20, // Adjust width for spacing
                  ),
                  _buildInfoColumn(
                    value: docRef.avgRating.toString(),
                    label: 'Rating',
                  ),
                  const VerticalDivider(
                    // Add a vertical separator
                    color: Colors.grey,
                    thickness: 1,
                    width: 20, // Adjust width for spacing
                  ),
                  _buildInfoColumn(
                    value: docRef.totalPatientsCount.toString(),
                    label: 'Patients',
                  ),
                ],
              );
            }),
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
            Obx(() {
              return Text(
                homeDoctorController.singleDoctorData.value.aboutDoctor,
                style: AppTypography.bodyText1,
              );
            }),
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

            Obx(() {
              return Column(
                  children: homeDoctorController.singleDoctorData.value.reviews
                      .map((e) => ReviewCard(
                            reviewModel: e,
                          ))
                      .toList());
            }),
            // ReviewCard(),
            // ReviewCard(),
            // ReviewCard(),
            // ReviewCard(),
            // ReviewCard(),
            // ReviewCard(),
          ],
        ),
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
