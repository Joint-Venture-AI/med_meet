import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

class PrescriptionList extends StatelessWidget {
  const PrescriptionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              CustomAppBar(
                title: "Prescriptions",
                hasPadding: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Doctors Prescription",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff333333),
                        ),
                      ),
                      Text(
                        "15 May 2024 5:00 pm",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff545454),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 16.5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Color(0xffDDDEE0), width: 0.5),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 4),
                              blurRadius: 30,
                              color: Colors.black.withAlpha(
                                (255 * 0.08).toInt(),
                              ),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                  child: Image.asset(
                                    "assets/images/doctor.png",
                                    height: 98,
                                    width: 82,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Dr. Pelican Steve",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xff333333),
                                            ),
                                          ),
                                          const Spacer(),
                                          svgViewer(
                                            asset: "assets/svg/reviews.svg",
                                            height: 16,
                                            width: 16,
                                            color: Color(
                                              0xffFFCC00,
                                            ),
                                          ),
                                          Text(
                                            " 4.5",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff333333),
                                            ),
                                          ),
                                        ],
                                      ),
                                      ...[
                                        ["Specialist :", "Skin & VD"],
                                        ["Consultation Date :", "15 May 2024"],
                                        ["Online Consultation :", "\$20"],
                                      ].map(
                                        (e) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                e[0],
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff5C5C5C),
                                                ),
                                              ),
                                              Text(
                                                e[1],
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff545454),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  behavior: HitTestBehavior.translucent,
                                  child: Text(
                                    "Notes",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff1e65ff),
                                      decorationColor: Color(0xff1e65ff),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.prescription);
                                  },
                                  child: Text(
                                    "Prescription",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff1e65ff),
                                      decorationColor: Color(0xff1e65ff),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
