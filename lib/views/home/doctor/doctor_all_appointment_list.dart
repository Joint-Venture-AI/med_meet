import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';
import 'package:med_meet_flutter/core/components/my_custom_appbar.dart';

class DoctorAllAppointmentList extends StatelessWidget {
  const DoctorAllAppointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "All Appointments"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: Column(
          children: [
            SizedBox(height: 12),
            Expanded(
                child: ListView(
              children: [
                DoctorCard(
                  isAppointment: true,
                ),
                DoctorCard(
                  isAppointment: true,
                ),
                DoctorCard(
                  isAppointment: true,
                ),
                DoctorCard(
                  isAppointment: true,
                ),
                DoctorCard(
                  isAppointment: true,
                ),
                DoctorCard(
                  isAppointment: true,
                ),
                DoctorCard(
                  isAppointment: true,
                ),
                DoctorCard(
                  isAppointment: true,
                ),
                DoctorCard(
                  isAppointment: true,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
