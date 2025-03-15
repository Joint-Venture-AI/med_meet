import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_callender.dart';
import 'package:med_meet_flutter/core/components/time_slot_grid.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class DoctorSchedule extends StatefulWidget {
  const DoctorSchedule({super.key});

  @override
  State<DoctorSchedule> createState() => _DoctorScheduleState();
}

class _DoctorScheduleState extends State<DoctorSchedule> {
  bool isAdding = false;
  final CommonController commonController = Get.put(CommonController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commonController.doctorScheduleDate.value =
        DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

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
                    CustomCallender(
                      onClick: (date) {
                        commonController.doctorScheduleDate.value =
                            DateFormat('dd-MM-yyyy').format(date);
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
                            availableSlots:
                                // ignore: invalid_use_of_protected_member
                                commonController.fixedSchedules.value,
                            selectMultiple: true,
                            onPressed: (slot, model) {
                              if (commonController.selectedTimeslots
                                  .contains(model)) {
                                commonController.selectedTimeslots
                                    .remove(model);
                                return;
                              } else {
                                commonController.selectedTimeslots.add(model);
                              }
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: TimeSlotGrid(
                        availableSlots: [],
                        isEnabled: isAdding,
                        onPressed: (slot, model) {},
                      ),
                    ),
                    CustomButton(
                      onPressed: () {
                        commonController.createDoctorSchedule();
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
