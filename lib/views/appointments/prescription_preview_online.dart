import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/appointment_controller.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/controller/profile_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';

class PrescriptionPreviewOnline extends StatelessWidget {
  PrescriptionPreviewOnline({super.key, required this.pdfUrl});
  final String pdfUrl;

  final AppointmentController appointment = Get.find<AppointmentController>();
  final CommonController commonController = Get.find<CommonController>();
  final Profilecontroller profilecontroller = Get.find<Profilecontroller>();

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
              profilecontroller.downloadPdfFromURL(pdfUrl);
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
        child: Center(
          child: Obx(() {
            final doc = commonController.document.value;
            return doc == null
                ? CircularProgressIndicator()
                : PDFViewer(document: doc);
          }),
        ),
      ),
    );
  }
}
