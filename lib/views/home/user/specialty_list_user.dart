import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';

class SpecialtyListUserView extends StatelessWidget {
  const SpecialtyListUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: CustomAppBar(title: "Dentist")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: ListView(
          children: [
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
            DoctorCard(),
          ],
        ),
      ),
    );
  }
}
