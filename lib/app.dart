import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/bottom_navigation.dart';
import 'package:med_meet_flutter/views/home/user/home_user.dart';
import 'package:med_meet_flutter/views/message_calls/chat_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          HomeUserView(),
          HomeUserView(),
          ChatScreenView(),
          HomeUserView(),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        menuIndex: _index,
        onChanged: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
