import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/constants/image_assets.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard(
      {super.key,
      this.isDoctorToDoctor = false,
      this.isAppointment = false,
      this.status});

  final bool isDoctorToDoctor;
  final bool isAppointment;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isAppointment
            ? Get.toNamed(AppRoutes.appointmentDetails,
                arguments: status == null)
            : status != null
                ? Get.toNamed(AppRoutes.appointmentDetails,
                    arguments: status == null)
                : Get.toNamed(AppRoutes.doctorDetailsUser);
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 12),
          width: double.infinity,
          height: 112.h,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.border1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      isAppointment
                          ? ImageAssets.userImage1
                          : ImageAssets.doctorImage1,
                      height: 90.h,
                      width: 81.w,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          isAppointment ? "Nguyen, Shane" : "Dr. Ananya Sharma",
                          style: AppTypography.appbarTitle),
                      isAppointment
                          ? Text("Online Consultancy",
                              style: AppTypography.bodyText1)
                          : Row(
                              children: [
                                Text(
                                  "Dentist",
                                  style: AppTypography.bodyText1,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text("|"),
                                SizedBox(
                                  width: 8,
                                ),
                                Text("City Hostpital",
                                    style: AppTypography.bodyText3),
                              ],
                            ),
                      isAppointment
                          ? Text("01:09 am - 10:41 pm",
                              style: AppTypography.bodyText3)
                          : Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent,
                                ),
                                Text(
                                  "4.5",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ],
                            )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: isDoctorToDoctor || isAppointment
                        ? Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.chatScreen);
                                },
                                child: SvgPicture.asset(
                                  SVGAssets.chatOutlined,
                                  color: Color(0xFF1E65FF),
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.callScreen);
                                },
                                child: Icon(
                                  Icons.videocam,
                                  color: Color(0xFF1E65FF),
                                ),
                              ),
                            ],
                          )
                        : status == null
                            ? Text(
                                "\$5.22",
                                style: AppTypography.priceStyle,
                              )
                            : Container(),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: isAppointment
                        ? Text(
                            "upcoming",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xFF07D11F)),
                          )
                        : status != null
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppointmentStatus.completed == status
                                        ? Color(0xFFF0FFF2)
                                        : Color(0xFFF0F5FF)),
                                child: Text(
                                  status!,
                                  style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          AppointmentStatus.completed == status
                                              ? Color(0xFF07D11F)
                                              : Color(0xFF1E65FF)),
                                ),
                              )
                            : null,
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: isAppointment
                        ? Text(
                            "22 Oct, 2020",
                            style: AppTypography.bodyText3,
                          )
                        : null,
                  ),
                ],
              )
            ],
          )),
    );
  }
}

class AppointmentStatus {
  static String upcomming = "upcomming";
  static String completed = "completed";
}
