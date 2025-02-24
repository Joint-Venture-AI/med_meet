import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';

class TimeSlotGrid extends StatelessWidget {
  final bool isEnabled;
  const TimeSlotGrid({super.key, this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    final List<String> timeSlots = [
      "09.00 - 09.30",
      "10:00 - 10:30",
      "11:00 - 11:00",
      "12:00 - 12:30",
      "01:00 - 01:30",
      "02:00 - 02.30",
      "03:00 - 03:00",
      "09.00 - 09.30",
      "09.00 - 09.30",
    ];
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        childAspectRatio: 3.5, // Adjust aspect ratio for desired shape
        crossAxisSpacing: 14, // Spacing between columns
        mainAxisSpacing: 10, // Spacing between rows
      ),
      itemCount: timeSlots.length,
      itemBuilder: (context, index) {
        return TimeSlotButton(
          timeSlot: timeSlots[index],
          isEnabled: isEnabled,
        );
      },
    );
  }
}

class TimeSlotButton extends StatefulWidget {
  const TimeSlotButton(
      {super.key, required this.timeSlot, required this.isEnabled});
  final bool isEnabled;
  final String timeSlot;

  @override
  State<TimeSlotButton> createState() => _TimeSlotButtonState();
}

class _TimeSlotButtonState extends State<TimeSlotButton> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isEnabled) {
          setState(() {
            isActive = !isActive;
          });
        }
      },
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: AppColors.border1),
            color: isActive ? AppColors.button1 : null),
        child: Center(
          child: Text(
            widget.timeSlot,
            style: GoogleFonts.roboto(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: isActive ? Colors.white : Color(0xFF545454),
            ),
          ),
        ),
      ),
    );
  }
}
