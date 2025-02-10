import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool isDark;
  final bool hasPadding;
  final bool hasLeading;
  final Widget? tailing;
  const CustomAppBar({
    super.key,
    required this.title,
    this.isDark = true,
    this.hasPadding = true,
    this.hasLeading = true,
    this.tailing,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: hasPadding ? 24 : 0),
        height: 64,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            hasLeading
                ? GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDark ? Colors.white : Colors.transparent,
                        border: Border.all(
                          width: 0.7,
                          color:
                              isDark ? Color(0xffDDDEE0) : Colors.transparent,
                        ),
                      ),
                      child: Center(
                        child: svgViewer(
                          asset: "assets/svg/arrow_back.svg",
                          color: isDark ? Color(0xff333333) : Colors.white,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 40,
                    width: 40,
                  ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: isDark ? Color(0xff333333) : Colors.white,
              ),
            ),
            tailing ??
                const SizedBox(
                  height: 24,
                  width: 24,
                ),
          ],
        ),
      ),
    );
  }
}
