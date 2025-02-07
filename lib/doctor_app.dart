import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/bottom_navigation.dart';
import 'package:med_meet_flutter/views/home/doctor/doctor_home.dart';
import 'package:med_meet_flutter/views/message_calls/messages.dart';
import 'package:med_meet_flutter/views/profile/doctor/doctor_profile_view.dart';

class Doctorapp extends StatefulWidget {
  const Doctorapp({super.key});

  @override
  State<Doctorapp> createState() => _DoctorappState();
}

class _DoctorappState extends State<Doctorapp> {
  int _index = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (value) {
          setState(() {
            _index = value;
          });
        },
        children: [
          DoctorHomeView(),
          DoctorHomeView(),
          MessagesView(),
          DoctorProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
          menuIndex: _index,
          onChanged: (index) {
            controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate,
            );
          }),
    );
  }
}
