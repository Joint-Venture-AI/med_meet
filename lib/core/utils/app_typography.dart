import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle splashStyle = GoogleFonts.lora(
      fontSize: 32.sp, fontWeight: FontWeight.w600, color: Color(0xFF333333));

  static TextStyle headerText1 = GoogleFonts.roboto(
      fontSize: 24.sp, fontWeight: FontWeight.w500, color: Color(0xFF333333));

  static TextStyle bodyText1 = GoogleFonts.roboto(
      fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF545454));
  static TextStyle bodyText1Black = GoogleFonts.roboto(
      fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color(0xFF333333));

  static TextStyle bodyText2 = GoogleFonts.roboto(
      fontSize: 12.sp, fontWeight: FontWeight.w400, color: Color(0xFF545454));

  static TextStyle bodyText3 = GoogleFonts.roboto(
      fontSize: 12.sp, fontWeight: FontWeight.w400, color: Color(0xFF333333));

  static TextStyle bodyText3white = GoogleFonts.roboto(
      fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.white);
  static TextStyle appbarTitle = GoogleFonts.roboto(
      fontSize: 18.sp, fontWeight: FontWeight.w400, color: Color(0xFF333333));

  static TextStyle priceStyle = GoogleFonts.roboto(
      fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black);

  static TextStyle notificationTitle =
      GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle timeStyle = GoogleFonts.roboto(
      fontSize: 12.sp, fontWeight: FontWeight.w400, color: Color(0xFFB0B0B0));

  static TextStyle doctorNameStyle = GoogleFonts.roboto(
      fontSize: 19.sp, fontWeight: FontWeight.w400, color: Color(0xFF333333));
}
