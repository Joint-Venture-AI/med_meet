import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';

class UserAppointmentScreenView extends StatelessWidget {
  const UserAppointmentScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: CustomAppBar(title: "Appointments")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            SizedBox(
              height: 24,
            ),
            DoctorCard(
              status: AppointmentStatus.upcomming,
            ),
            DoctorCard(
              status: AppointmentStatus.completed,
            ),
          ],
        ),
      ),
    );
  }
}
