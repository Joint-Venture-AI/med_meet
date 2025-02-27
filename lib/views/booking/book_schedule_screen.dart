import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/controller/booking_user_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_date_picker.dart';
import 'package:med_meet_flutter/core/components/time_slot_grid.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:med_meet_flutter/models/single_doctor_model.dart';

class BookScheduleScreenView extends StatelessWidget {
  BookScheduleScreenView({super.key, required this.doctorModel});

  final SingleDoctorModel doctorModel;

  final BookingUserController bookingUserController =
      Get.put(BookingUserController());
  final CommonController commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    String currentDay = DateFormat('dd-MM-yyyy').format(DateTime.now());
    commonController.getAvailaleTimeSlots(doctorModel.id, currentDay);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(title: "Book Schedule")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Date",
              style: AppTypography.appbarTitle,
            ),
            SizedBox(
              height: 26,
            ),
            CustomDatePicker(),
            SizedBox(
              height: 24,
            ),
            Text(
              "Select Time",
              style: AppTypography.appbarTitle,
            ),
            Expanded(child: Obx(() {
              return TimeSlotGrid(
                availableSlots: commonController.availableSlots,
              );
            })),
            CustomButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.bookPatientDetails);
                },
                buttonTitle: "Continue")
          ],
        ),
      ),
    );
  }
}
