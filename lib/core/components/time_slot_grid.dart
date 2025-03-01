import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/models/time_slot_model.dart';

class TimeSlotGrid extends StatelessWidget {
  final bool isEnabled;
  // time slots freshly recieved from the server for a given doctor
  final List<TimeSlotModel> availableSlots;
  // callback function to handle the selected time slot
  final Function(String, TimeSlotModel) onPressed;
  // if the grid should allow multiple selection
  final bool selectMultiple;
  TimeSlotGrid({
    super.key,
    this.isEnabled = true,
    required this.availableSlots,
    required this.onPressed,
    this.selectMultiple = false,
  });

  final CommonController commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    // Maping the object into a string formatted as "10:30 - 11:00"
    final List<String> timeSlots =
        availableSlots.map((e) => "${e.startTime} - ${e.endTime}").toList();

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
          onPressed: onPressed,
          selectMultiple: selectMultiple,
          model: availableSlots[index],
        );
      },
    );
  }
}

class TimeSlotButton extends StatefulWidget {
  const TimeSlotButton(
      {super.key,
      required this.timeSlot,
      required this.isEnabled,
      required this.onPressed,
      required this.selectMultiple,
      required this.model});
  final bool isEnabled;
  final String timeSlot;
  final Function(String, TimeSlotModel) onPressed;
  final bool selectMultiple;
  final TimeSlotModel model;

  @override
  State<TimeSlotButton> createState() => _TimeSlotButtonState();
}

class _TimeSlotButtonState extends State<TimeSlotButton> {
  bool isActive = false;

  final CommonController commonController = Get.find<CommonController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed(widget.timeSlot, widget.model);
      },
      child: Obx(() {
        return Container(
          // padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: AppColors.border1),
            color: widget.selectMultiple
                ? commonController.selectedTimeslots.contains(widget.model)
                    ? AppColors.button1
                    : null
                : commonController.selectedTimeSlot.value.time ==
                        widget.timeSlot
                    ? AppColors.button1
                    : null,
          ),
          child: Center(
            child: Text(
              widget.timeSlot,
              style: GoogleFonts.roboto(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: widget.selectMultiple
                    ? commonController.selectedTimeslots.contains(widget.model)
                        ? Colors.white
                        : Color(0xFF545454)
                    : commonController.selectedTimeSlot.value.time ==
                            widget.timeSlot
                        ? Colors.white
                        : Color(0xFF545454),
              ),
            ),
          ),
        );
      }),
    );
  }
}
