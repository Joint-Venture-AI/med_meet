import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';

class MedicalRecords extends StatelessWidget {
  const MedicalRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: "Medical Records"),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Upload and manage your previous medical history in PDF format.",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff333333),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          Text(
                            "Your Records",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff333333),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.addMedicalRecords);
                            },
                            behavior: HitTestBehavior.translucent,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Color(0xff1E65FF),
                                ),
                                Text(
                                  "Add",
                                  style: TextStyle(
                                    fontSize: 18,
                                    decoration: TextDecoration.underline,
                                    color: Color(
                                      0xff1E65FF,
                                    ),
                                    decorationColor: Color(
                                      0xff1E65FF,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      for (int i = 0; i < 10; i++) medicalRecord(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding medicalRecord() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 30,
              color: Colors.black.withAlpha(
                (255 * 0.16).toInt(),
              ),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/user-photo.png",
                    height: 72,
                    width: 72,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                        color: Color(
                          0xff5C5C5C,
                        ),
                      ),
                    ),
                    Text(
                      "Age",
                      style: TextStyle(
                        color: Color(
                          0xff5C5C5C,
                        ),
                      ),
                    ),
                    Text(
                      "Gender",
                      style: TextStyle(
                        color: Color(
                          0xff5C5C5C,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(
                      ":",
                      style: TextStyle(
                        color: Color(
                          0xff5C5C5C,
                        ),
                      ),
                    ),
                    Text(
                      ":",
                      style: TextStyle(
                        color: Color(
                          0xff5C5C5C,
                        ),
                      ),
                    ),
                    Text(
                      ":",
                      style: TextStyle(
                        color: Color(
                          0xff5C5C5C,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(
                      "Andrew anisley",
                      style: TextStyle(
                        color: Color(
                          0xff5C5C5C,
                        ),
                      ),
                    ),
                    Text(
                      "15 May 2024",
                      style: TextStyle(
                        color: Color(
                          0xff5C5C5C,
                        ),
                      ),
                    ),
                    Text(
                      "\$20",
                      style: TextStyle(
                        color: Color(
                          0xff5C5C5C,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              onPressed: () {},
              buttonTitle: "See Details",
              height: 36,
              textSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
