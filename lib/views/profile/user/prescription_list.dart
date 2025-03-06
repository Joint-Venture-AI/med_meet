import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/controller/profile_controller.dart';
import 'package:med_meet_flutter/core/components/cached_network_image.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';
import 'package:med_meet_flutter/models/prescription_model.dart';
import 'package:med_meet_flutter/views/appointments/prescription_preview_online.dart';
import 'package:med_meet_flutter/views/profile/user/prescription_note.dart';

class PrescriptionList extends StatelessWidget {
  PrescriptionList({super.key});
  final Profilecontroller profilecontroller = Get.put(Profilecontroller());
  final CommonController commonController = Get.put(CommonController());

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
                      Obx(() {
                        final prescription = profilecontroller.allPrescription;
                        return prescription.isEmpty
                            ? Center(child: Text("No Prescription Yet"))
                            : Column(
                                children: prescription
                                    .map((model) =>
                                        _buildPrescriptionCard(model))
                                    .toList(),
                              );
                      }),
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

  Widget _buildPrescriptionCard(PrescriptionModel model) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16.5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xffDDDEE0), width: 0.5),
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
                  child: cachedImage(url: model.image, size: 98, width: 82)),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          model.name,
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
                          model.avgRating.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff333333),
                          ),
                        ),
                      ],
                    ),
                    _buildCardRow(key: "Specialist", value: model.specialist),
                    _buildCardRow(
                        key: "Consultation slot",
                        value: "${model.startTime} - ${model.endTime}"),
                    _buildCardRow(
                        key: "Consultation Fee",
                        value: " \$${model.consultationFee}"),
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
                onTap: () {
                  Get.to(() => PrescriptionNote(note: model.doctorNote));
                },
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
                onTap: () async {
                  // await commonController.getPdforPreview(
                  //     fileUrl: imageUrl(model.prescription));
                  Get.to(() => PrescriptionPreviewOnline(
                      pdfUrl: imageUrl(model.prescription)));
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
    );
  }

  Row _buildCardRow({key, value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff5C5C5C),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff545454),
          ),
        ),
      ],
    );
  }
}
