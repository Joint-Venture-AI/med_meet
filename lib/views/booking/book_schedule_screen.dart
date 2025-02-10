import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_date_picker.dart';
import 'package:med_meet_flutter/core/components/time_slot_grid.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class BookScheduleScreenView extends StatelessWidget {
  const BookScheduleScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
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
            Expanded(child: TimeSlotGrid()),
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
