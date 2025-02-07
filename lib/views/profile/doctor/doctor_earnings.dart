import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

class DoctorEarnings extends StatelessWidget {
  const DoctorEarnings({super.key});

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
                title: "Earnings",
                hasPadding: false,
              ),
              const SizedBox(
                height: 46,
              ),
              Row(
                children: [
                  Expanded(
                    child: highlightedContainer("\$5000", "Earned this Month"),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: highlightedContainer("\$25000", "Total Earned"),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.doctorWithdraw);
                },
                buttonTitle: "Withdraw Earnings",
              ),
              const SizedBox(
                height: 32,
              ),
              for (int i = 0; i < 3; i++)
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: withdrawalHistory(i == 2),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Row withdrawalHistory(bool isCompleted) {
    return Row(
      children: [
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueGrey.shade200,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Last Withdrawal",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff333333),
              ),
            ),
            Text(
              "2024 Jan 16",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff545454),
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              isCompleted ? "\$120" : "-\$120",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isCompleted ? Color(0xff07D11F) : Color(0xffEE1D23),
              ),
            ),
            Text(
              isCompleted ? "Completed" : "pending",
              style: TextStyle(
                fontSize: 12,
                color: isCompleted ? Color(0xff07D11F) : Color(0xffEE1D23),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget highlightedContainer(String title, String subTitle) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 28,
              ),
              Text(
                subTitle,
                style: TextStyle(
                  color: Color(0xff333333),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff193664),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: -24,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              color: Color(0xfff2f5f7),
              child: svgViewer(
                asset: "assets/svg/wallet.svg",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
