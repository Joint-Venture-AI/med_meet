import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/bottom_navigation.dart';
import 'package:med_meet_flutter/views/home/user/home_user.dart';
import 'package:med_meet_flutter/views/appointments/user_appointment_screen.dart';
import 'package:med_meet_flutter/views/message_calls/messages.dart';
import 'package:med_meet_flutter/views/profile/user/user_profile_view.dart';

class UserApp extends StatefulWidget {
  const UserApp({super.key});

  @override
  State<UserApp> createState() => _AppState();
}

class _AppState extends State<UserApp> {
  PageController controller = PageController();
  int _index = 0;

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
          HomeUserView(),
          UserAppointmentScreenView(),
          MessagesView(),
          UserProfileView(),
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
        },
      ),
    );
  }
}
