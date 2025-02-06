import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';

class UserPersonalInformation extends StatelessWidget {
  const UserPersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                  color: Color(0xff90A4AE),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                  ),
                  child: Image.asset(
                    "assets/images/profile_bg.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomAppBar(
                      title: "Profile",
                      isDark: false,
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    ClipOval(
                      child: Image.asset(
                        "assets/images/profile_pic.jfif",
                        fit: BoxFit.cover,
                        height: 120,
                        width: 120,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Andrew Ainsley",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            child: Column(
              spacing: 16,
              children: [
                CustomTextInput(
                  renderTitle: false,
                  hintText: "Andrew Ainsley",
                  icon: Icons.person,
                ),
                CustomTextInput(
                  renderTitle: false,
                  hintText: "andres.do@gmail.com",
                  icon: Icons.mail_rounded,
                ),
                CustomTextInput(
                  renderTitle: false,
                  hintText: "10 Jan 2001",
                  icon: Icons.cake_rounded,
                ),
                CustomTextInput(
                  renderTitle: false,
                  hintText: "2713 |Westheimer Rd, |Santa Ana, Illionis 526548",
                  icon: Icons.location_on_rounded,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
