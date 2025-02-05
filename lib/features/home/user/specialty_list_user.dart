import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';
import 'package:med_meet_flutter/core/components/my_custom_appbar.dart';

class SpecialtyListUserView extends StatelessWidget {
  const SpecialtyListUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Dentist"),
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
