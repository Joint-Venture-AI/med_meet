import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/review_card.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

class DoctorReviewProfile extends StatelessWidget {
  const DoctorReviewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              CustomAppBar(
                title: "Reviews",
                hasPadding: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 0.7,
                            color: Color(0xffDDDEE0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Row(
                                  spacing: 4,
                                  children: [
                                    Text(
                                      "5",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff333333),
                                      ),
                                    ),
                                    svgViewer(
                                      asset: "assets/svg/reviews.svg",
                                      height: 16,
                                      width: 16,
                                      color: Color(0xffFFB701),
                                    ),
                                    Container(
                                      height: 6,
                                      width: 150 * (5 / 5),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFB701),
                                        borderRadius: BorderRadius.circular(999),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 4,
                                  children: [
                                    Text(
                                      "4",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff333333),
                                      ),
                                    ),
                                    svgViewer(
                                      asset: "assets/svg/reviews.svg",
                                      height: 16,
                                      width: 16,
                                      color: Color(0xffFFB701),
                                    ),
                                    Container(
                                      height: 6,
                                      width: 150 * (4 / 5),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFB701),
                                        borderRadius: BorderRadius.circular(999),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 4,
                                  children: [
                                    Text(
                                      "3",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff333333),
                                      ),
                                    ),
                                    svgViewer(
                                      asset: "assets/svg/reviews.svg",
                                      height: 16,
                                      width: 16,
                                      color: Color(0xffFFB701),
                                    ),
                                    Container(
                                      height: 6,
                                      width: 150 * (3 / 5),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFB701),
                                        borderRadius: BorderRadius.circular(999),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 4,
                                  children: [
                                    Text(
                                      "2",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff333333),
                                      ),
                                    ),
                                    svgViewer(
                                      asset: "assets/svg/reviews.svg",
                                      height: 16,
                                      width: 16,
                                      color: Color(0xffFFB701),
                                    ),
                                    Container(
                                      height: 6,
                                      width: 150 * (2 / 5),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFB701),
                                        borderRadius: BorderRadius.circular(999),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 4,
                                  children: [
                                    Text(
                                      "1",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff333333),
                                      ),
                                    ),
                                    svgViewer(
                                      asset: "assets/svg/reviews.svg",
                                      height: 16,
                                      width: 16,
                                      color: Color(0xffFFB701),
                                    ),
                                    Container(
                                      height: 6,
                                      width: 150 * (1 / 5),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFB701),
                                        borderRadius: BorderRadius.circular(999),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              spacing: 8,
                              children: [
                                Text(
                                  "4.0",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                Row(
                                  children: [
                                    for (int i = 0; i < 5; i++)
                                      svgViewer(
                                        asset: "assets/svg/reviews.svg",
                                        height: 16,
                                        width: 16,
                                        color: i == 4
                                            ? Color(0xffE8E8E8)
                                            : Color(0xffFFB701),
                                      ),
                                  ],
                                ),
                                Text(
                                  "52 Reviews",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8.0,
                            top: 18,
                          ),
                          child: Text(
                            "Reviews",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      ReviewCard(),
                      ReviewCard(),
                      ReviewCard(),
                      ReviewCard(),
                      ReviewCard(),
                      const SizedBox(
                        height: 40,
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
