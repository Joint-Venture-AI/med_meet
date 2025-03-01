import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/controller/booking_user_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_callender.dart';
import 'package:med_meet_flutter/core/components/custom_snack_bar.dart';
import 'package:med_meet_flutter/core/components/time_slot_grid.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:med_meet_flutter/models/single_doctor_model.dart';
import 'package:med_meet_flutter/models/time_slot_model.dart';

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
            CustomCallender(
              onClick: (date) {
                commonController.getAvailaleTimeSlots(
                    doctorModel.id, DateFormat('dd-MM-yyyy').format(date));
              },
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Select Time",
              style: AppTypography.appbarTitle,
            ),
            Expanded(
              child: Obx(
                () {
                  return TimeSlotGrid(
                    // ignore: invalid_use_of_protected_member
                    availableSlots: commonController.availableSlots.value,
                    selectMultiple: false,
                    onPressed: (slot, model) {
                      commonController.selectedTimeSlot.value = TimeSlotModel(
                          endTime: model.endTime,
                          id: model.id,
                          startTime: model.startTime,
                          time: slot);
                    },
                  );
                },
              ),
            ),
            CustomButton(
                onPressed: () {
                  if (commonController.selectedTimeSlot.value.time == "") {
                    showCustomSnackBar("Please select a time slot");
                    return;
                  }
                  Get.toNamed(AppRoutes.bookPatientDetails);
                },
                buttonTitle: "Continue")
          ],
        ),
      ),
    );
  }
}
