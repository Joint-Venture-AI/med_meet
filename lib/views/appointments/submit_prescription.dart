import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:med_meet_flutter/models/appointmnets/medication_details_model.dart';

class SubmitPrescription extends StatelessWidget {
  const SubmitPrescription(
      {super.key, required this.medicines, required this.summary});

  final List<MedicationDetailsModel> medicines;
  final String summary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(
            title: "Prescription",
            tailing: GestureDetector(
              onTap: () {
                // todo: Implement pdf download
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.background1,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 3),
                  child: SvgPicture.asset(SVGAssets.downloadIcon),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Dr.Pelican Steve",
                style: AppTypography.appbarTitle,
              ),
              Text(
                "Cardiologist",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff383838),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Aruga Medical",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff333333),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "140 Anywhere St. Any City",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff333333),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "MWF: 13:00 - 18:00",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff545454),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "TTH: 13:00 - 18:00",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff545454),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Container(
                height: 1,
                width: double.infinity,
                color: Color(0xffDDDEE0),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Patient Name: ",
                    style: TextStyle(
                      color: Color(0xff333333),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 16,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Color(0xffB0B0B0),
                      ))),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "Sex: ",
                    style: TextStyle(
                      color: Color(0xff333333),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 16,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xffB0B0B0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Age: ",
                    style: TextStyle(
                      color: Color(0xff333333),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 16,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xffB0B0B0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Date: ",
                    style: TextStyle(
                      color: Color(0xff333333),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 16,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xffB0B0B0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Rx",
                style: TextStyle(
                  fontSize: 32,
                  color: Color(0xff333333),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (medicines.isNotEmpty)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border1),
                      borderRadius: BorderRadius.circular(12)),
                  child: SizedBox(
                    height: (51 * medicines.length.toDouble()),
                    child: ListView.builder(
                      itemCount: medicines.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "1. medName",
                              style: GoogleFonts.roboto(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildMeds(medicines[index].dose),
                                      buildMeds(medicines[index].duration),
                                      buildMeds(medicines[index].frequency),
                                      Icon(
                                        Icons.delete_outline,
                                        color: Colors.red,
                                      ),
                                      SvgPicture.asset(SVGAssets.editIcon),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Summary",
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                summary,
                style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF545454)),
              ),
              SizedBox(
                height: 56.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 148,
                        height: 1,
                        color: Color(0xffB0B0B0),
                      ),
                      Text(
                        "Signature",
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              CustomButton(onPressed: () {}, buttonTitle: "Submit Prescription")
            ],
          ),
        ));
  }

  Container buildMeds(title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.border1),
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        title,
        style: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }
}
