import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';

class UserAppointmentScreenView extends StatelessWidget {
  const UserAppointmentScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: "Appointments",
              hasLeading: false,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: ListView(
                  children: [
                    DoctorCard(
                      status: AppointmentStatus.upcomming,
                    ),
                    DoctorCard(
                      status: AppointmentStatus.completed,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
