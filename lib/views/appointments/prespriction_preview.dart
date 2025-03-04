import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/appointment_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';

class PresprictionPreview extends StatefulWidget {
  const PresprictionPreview({super.key, required this.pdfPath});

  final String pdfPath;

  @override
  State<PresprictionPreview> createState() => _PresprictionPreviewState();
}

class _PresprictionPreviewState extends State<PresprictionPreview> {
  int? pages;
  bool isReady = false;
  final AppointmentController appointment = Get.find<AppointmentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.scaffoldBackgroundColor.withAlpha(1200),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: "Prescription",
          tailing: GestureDetector(
            onTap: () {
              appointment.downloadPDf();
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.background1,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 3),
                child: SvgPicture.asset(SVGAssets.downloadIcon),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: PDFView(
          filePath: widget.pdfPath,
          enableSwipe: true,
          swipeHorizontal: true,
          autoSpacing: false,
          pageFling: false,
          backgroundColor: Colors.grey,
          onRender: (pages) {
            setState(() {
              pages = pages;
              isReady = true;
            });
          },
        ),
      ),
    );
  }
}
