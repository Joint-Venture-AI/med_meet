import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';

class DoctorAllAppointmentList extends StatelessWidget {
  const DoctorAllAppointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: CustomAppBar(title: "All Appointments")),
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
