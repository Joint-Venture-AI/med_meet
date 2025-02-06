import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int) onChanged;
  final int menuIndex;
  const BottomNavigation(
      {super.key, required this.menuIndex, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff90A4AE),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      unselectedLabelStyle: TextStyle(color: Colors.white),
      currentIndex: menuIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: menuIndex == 0
              ? Icon(
                  Icons.home,
                  color: Colors.white,
                )
              : Icon(Icons.home_outlined, color: Colors.white),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: menuIndex == 1
              ? SvgPicture.asset(SVGAssets.appointment)
              : SvgPicture.asset(SVGAssets.appointmentOutlined),
          label: 'Appointment',
        ),
        BottomNavigationBarItem(
          icon: menuIndex == 2
              ? SvgPicture.asset(SVGAssets.chat)
              : SvgPicture.asset(SVGAssets.chatOutlined),
          label: 'Message',
        ),
        BottomNavigationBarItem(
          icon: menuIndex == 3
              ? SvgPicture.asset(SVGAssets.profile)
              : SvgPicture.asset(SVGAssets.profileOutlined),
          label: 'Profile',
        ),
      ],
      onTap: onChanged,
    );
  }
}
