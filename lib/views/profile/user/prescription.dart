import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

class Prescription extends StatelessWidget {
  const Prescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: "Presciption",
              hasPadding: false,
              tailing: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      width: 0.7,
                      color: Color(0xffDDDEE0),
                    ),
                  ),
                  child: Center(
                    child: svgViewer(
                      asset: "assets/svg/download.svg",
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Dr.Pelican Steve",
              style: AppTypography.appbarTitle,
            ),
            Text(
              "Cardiologist",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff383838),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aruga Medical",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff333333),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "140 Anywhere St. Any City",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff333333),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "MWF: 13:00 - 18:00",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff545454),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "TTH: 13:00 - 18:00",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff545454),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              height: 1,
              width: double.infinity,
              color: Color(0xffDDDEE0),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Patient Name: ",
                  style: TextStyle(
                    color: Color(0xff333333),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 16,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Color(0xffB0B0B0),
                    ))),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  "Sex: ",
                  style: TextStyle(
                    color: Color(0xff333333),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 16,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffB0B0B0),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Age: ",
                  style: TextStyle(
                    color: Color(0xff333333),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 16,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffB0B0B0),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Date: ",
                  style: TextStyle(
                    color: Color(0xff333333),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 16,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffB0B0B0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Rx",
              style: TextStyle(
                fontSize: 32,
                color: Color(0xff333333),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                      width: 148,
                      height: 1,
                      color: Color(0xffB0B0B0),
                    ),
                    Text(
                      "Signature",
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
