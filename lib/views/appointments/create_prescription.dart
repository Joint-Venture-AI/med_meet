import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/components/my_custom_appbar.dart';
import 'package:med_meet_flutter/core/components/patient_information_card.dart';
import 'package:med_meet_flutter/views/appointments/doctor_appointments_screen.dart';

class CreatePrescriptionView extends StatelessWidget {
  const CreatePrescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    void addMedicine() {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 4,
                    width: 80.w,
                    color: Color(0xFFCCD5DA),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextInput(
                    hintText: "Medicine Name",
                    title: "Medicine Name",
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  CustomTextInput(
                    hintText: "Medicine Dosage",
                    title: "Medicine dose",
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  CustomTextInput(
                    hintText: "Medicine Duration",
                    title: "Medicine duration",
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  CustomTextInput(
                    hintText: "Medicine Frequency",
                    title: "Medicine frequency",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TabSelector(
                          isActive: false,
                          tabTitle: "Cancel",
                          onTabClick: () {
                            Get.back();
                          }),
                      TabSelector(
                          isActive: true, tabTitle: "Okay", onTabClick: () {})
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: customAppBar(title: "Create Prescription", hasNote: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            SizedBox(
              height: 20.h,
            ),
            PatientInformationCard(),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Medication Details",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                InkWell(
                  onTap: addMedicine,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFF90A4AE),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Add",
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 22,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomTextInput(
              hintText: "Write here",
              title: "Summary",
              maxLines: 6,
            )
          ],
        ),
      ),
    );
  }
}
