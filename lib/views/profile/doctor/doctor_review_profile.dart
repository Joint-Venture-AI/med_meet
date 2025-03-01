import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/home_doctor_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/review_card.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

class DoctorReviewProfile extends StatelessWidget {
  DoctorReviewProfile({super.key});

  final HomeDoctorController homeDoctorController =
      Get.find<HomeDoctorController>();

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
                            Obx(() {
                              final rating = homeDoctorController
                                  .doctorData.value.ratingPercentage;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 8,
                                children: rating.reversed
                                    .map(
                                      (el) => Row(
                                        spacing: 4,
                                        children: [
                                          Text(
                                            el.rating.toString(),
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
                                            width: 150 * (el.percentage / 100),
                                            decoration: BoxDecoration(
                                              color: Color(0xffFFB701),
                                              borderRadius:
                                                  BorderRadius.circular(999),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              );
                            }),
                            Obx(() {
                              final docData =
                                  homeDoctorController.doctorData.value;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                spacing: 8,
                                children: [
                                  Text(
                                    docData.avgRating.toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff333333),
                                    ),
                                  ),
                                  StarRating(
                                    allowHalfRating: true,
                                    rating: docData.avgRating,
                                    size: 16,
                                  ),
                                  Text(
                                    "${docData.reviews.length} Reviews",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff333333),
                                    ),
                                  ),
                                ],
                              );
                            }),
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
                      Obx(() {
                        final reviews =
                            homeDoctorController.doctorData.value.reviews;
                        return Column(
                          children: reviews
                              .map((el) => ReviewCard(reviewModel: el))
                              .toList(),
                        );
                      }),
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
