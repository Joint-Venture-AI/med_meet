import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/appointment_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';
import 'package:med_meet_flutter/views/appointments/prescription_preview_online.dart';

class UserRecords extends StatefulWidget {
  const UserRecords({super.key});

  @override
  State<UserRecords> createState() => _UserRecordsState();
}

class _UserRecordsState extends State<UserRecords> {
  final AppointmentController appointment = Get.find<AppointmentController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(title: "Records"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Wrap(
          spacing: 15.w,
          runSpacing: 15,
          children: [
            Obx(
              () {
                final data = appointment.appointmentDetails.value;
                return data.attachmentPdf.isEmpty
                    ? Center(child: Text("No Previous Records"))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data.attachmentPdf.length,
                        itemBuilder: (context, index) {
                          final file = data.attachmentPdf[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => PrescriptionPreviewOnline(
                                  pdfUrl: imageUrl(file)));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AppColors.background1,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/svg/pdf.svg",
                                    height: 140.h,
                                    width: 140.w,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  file.split('/').last,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
