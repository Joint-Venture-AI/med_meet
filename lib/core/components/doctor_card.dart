import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:med_meet_flutter/core/components/cached_network_image.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:med_meet_flutter/core/utils/config_files.dart';
import 'package:med_meet_flutter/views/appointments/appointment_details_screen.dart';
import 'package:med_meet_flutter/views/common/doctor_details_for_doctor.dart';
import 'package:med_meet_flutter/views/common/doctors_details_for_user.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    this.isDoctorToDoctor = false,
    this.isAppointment = false,
    this.hasPrice = false,
    required this.id,
    required this.name,
    required this.image,
    this.userID,
    this.fee,
    this.specialist,
    this.clinic,
    this.avarageRating,
    this.status,
    this.time,
    this.date,
  });

  final bool isDoctorToDoctor;
  final bool isAppointment;
  final String? status;
  final bool hasPrice;
  final String id;
  final String? userID;
  final String image;
  final String name;
  final String? fee;
  final String? specialist;
  final String? clinic;
  final String? avarageRating;
  final String? time;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isAppointment
            ? Get.to(() => AppointmentDetailsView(appointmentID: id),
                arguments: true)
            : status != null
                ? Get.to(() => AppointmentDetailsView(appointmentID: id),
                    arguments: false)
                : isDoctorToDoctor
                    ? Get.to(() => DoctorDetailsForDoctor(
                          docID: id,
                        ))
                    : Get.to(() => DoctorsDetailsForUser(doctorId: id));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        width: double.infinity,
        height: 132.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.border1),
        ),
        child: Row(
          children: [
            image == ""
                ? SizedBox(
                    height: 119.h,
                    width: 81.w,
                  )
                : cachedImage(
                    url: image, size: 119.h, width: 81.w, borderRadius: 12),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          name.length < 12
                              ? name
                              : "${name.substring(0, 12)}...",
                          style: AppTypography.appbarTitle),
                      Container(
                        decoration: BoxDecoration(),
                        child: isDoctorToDoctor || (isAppointment)
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
                                  isDoctorToDoctor
                                      ? Container()
                                      : SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: MediaQuery.removePadding(
                                            context: context,
                                            removeBottom: true,
                                            removeTop: true,
                                            removeLeft: true,
                                            removeRight: true,
                                            child: callButton(
                                              targetUserID: userID,
                                              targetUserName: name,
                                            ),
                                          ),
                                        ),
                                ],
                              )
                            : status == null
                                ? Text(
                                    "\$${fee!}",
                                    style: AppTypography.priceStyle,
                                  )
                                : Container(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isAppointment
                          ? Text("Online Consultancy",
                              style: AppTypography.bodyText1)
                          : Flexible(
                              child: Wrap(
                                children: [
                                  Text(
                                    specialist!,
                                    style: AppTypography.bodyText1,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  if (status == null) Text("|"),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  if (status == null)
                                    Text(clinic!,
                                        style: AppTypography.bodyText3),
                                ],
                              ),
                            ),
                      Container(
                        decoration: BoxDecoration(),
                        child: (isAppointment && !hasPrice)
                            ? Text(
                                "upcoming",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xFF07D11F)),
                              )
                            : (isAppointment && hasPrice)
                                ? Text(
                                    "\$5.22",
                                    style: AppTypography.priceStyle,
                                  )
                                : status != null
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 4.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color:
                                                AppointmentStatus.completed ==
                                                        status
                                                    ? Color(0xFFF0FFF2)
                                                    : Color(0xFFF0F5FF)),
                                        child: Text(
                                          status!,
                                          style: GoogleFonts.roboto(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  AppointmentStatus.completed ==
                                                          status
                                                      ? Color(0xFF07D11F)
                                                      : Color(0xFF1E65FF)),
                                        ),
                                      )
                                    : null,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isAppointment
                          ? Text(time.toString(),
                              style: AppTypography.bodyText3)
                          : status == null
                              ? Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amberAccent,
                                    ),
                                    Text(
                                      avarageRating!.toString(),
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 6,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          color: Color(0xff545454),
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(time.toString(),
                                            style: AppTypography.bodyText1),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          color: Color(0xff545454),
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                            DateFormat('dd MMMM yyyy')
                                                .format(DateTime.parse(date!)),
                                            style: AppTypography.bodyText1),
                                      ],
                                    ),
                                  ],
                                ),
                      Container(
                        decoration: BoxDecoration(),
                        child: isAppointment
                            ? Text(
                                DateFormat('dd MMMM yyyy')
                                    .format(DateTime.parse(date!)),
                                style: AppTypography.bodyText3,
                              )
                            : null,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentStatus {
  static String upcomming = "upcomming";
  static String completed = "completed";
}

ZegoSendCallInvitationButton callButton({targetUserID, targetUserName}) {
  return ZegoSendCallInvitationButton(
    isVideoCall: true,
    //You need to use the resourceID that you created in the subsequent steps.
    //Please continue reading this document.
    resourceID: ZegoCloudConfig.resourceID,
    iconSize: Size(24, 24),
    icon: ButtonIcon(
      icon: Icon(Icons.videocam, color: Colors.white, size: 16),
      backgroundColor: Colors.blue,
    ),
    invitees: [
      ZegoUIKitUser(
        id: targetUserID,
        name: targetUserName,
      ),
    ],
  );
}
