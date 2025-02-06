import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, required this.menuIndex});
  final int menuIndex;

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
      onTap: (int index) {
        switch (index) {
          case 0:
            Get.offAllNamed(AppRoutes.homeUser);
            break; // Important: Don't forget the break statement

          // case 1:
          //   Get.offAllNamed(AppRoutes.APPOINT_USER);
          //   break;

          case 2:
            Get.offAllNamed(AppRoutes.messages);
            break;

          // case 3:
          //   Get.offAllNamed(AppRoutes.PROFILE_USER);
          //   break;
          default: // Optional: Handle cases outside 0-3

            break;
        }
      },
    );
  }
}
