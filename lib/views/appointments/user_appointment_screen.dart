import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';
import 'package:med_meet_flutter/core/components/my_custom_appbar.dart';

class UserAppointmentScreenView extends StatelessWidget {
  const UserAppointmentScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Appointments"),
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
