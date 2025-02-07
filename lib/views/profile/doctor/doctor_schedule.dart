import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_date_picker.dart';

class DoctorSchedule extends StatelessWidget {
  const DoctorSchedule({super.key});

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
                title: "Schedule",
                hasPadding: false,
              ),
              const SizedBox(
                height: 12,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select Date",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff333333),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomDatePicker(),
            ],
          ),
        ),
      ),
    );
  }
}
