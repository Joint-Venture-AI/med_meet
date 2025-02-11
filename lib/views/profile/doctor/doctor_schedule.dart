import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_date_picker.dart';
import 'package:med_meet_flutter/core/components/time_slot_grid.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class DoctorSchedule extends StatefulWidget {
  const DoctorSchedule({super.key});

  @override
  State<DoctorSchedule> createState() => _DoctorScheduleState();
}

class _DoctorScheduleState extends State<DoctorSchedule> {
  bool isAdding = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              CustomAppBar(
                title: isAdding ? "Add Schedule" : "Schedule",
                hasPadding: false,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
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
                    Expanded(
                      child: TimeSlotGrid(
                        isEnabled: isAdding,
                      ),
                    ),
                    CustomButton(
                      onPressed: () {
                        setState(() {
                          isAdding = !isAdding;
                        });
                      },
                      buttonTitle: isAdding ? "Submit" : "Add Schedule",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
