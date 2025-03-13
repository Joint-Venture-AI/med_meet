import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/controller/home_user_controller.dart';
import 'package:med_meet_flutter/core/components/cached_network_image.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';
import 'package:med_meet_flutter/views/appointments/prescription_preview_online.dart';

class MedicalRecords extends StatelessWidget {
  MedicalRecords({super.key});

  final CommonController commonController = Get.find<CommonController>();
  final UserHomeController userHomeController = Get.find<UserHomeController>();

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
                              commonController.pickedFileName.value = "";
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
                      Obx(() {
                        final records = commonController.medicalRecords;
                        return records.isEmpty
                            ? Center(
                                child: Text("No Records Created yet"),
                              )
                            : Column(
                                children: records
                                    .map((el) => medicalRecord(
                                        age: el.age.toString(),
                                        file: el.prespription,
                                        gender: el.gender,
                                        name: el.name))
                                    .toList(),
                              );
                      })
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

  Padding medicalRecord({name, age, gender, file}) {
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
                (255 * 0.08).toInt(),
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: cachedImage(
                        url: userHomeController.userData.value.image, size: 72),
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
                      name,
                      style: TextStyle(
                        color: Color(
                          0xff5C5C5C,
                        ),
                      ),
                    ),
                    Text(
                      age,
                      style: TextStyle(
                        color: Color(
                          0xff5C5C5C,
                        ),
                      ),
                    ),
                    Text(
                      gender,
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
              onPressed: () async {
                // await commonController.getPdforPreview(fileUrl: imageUrl(file));
                Get.to(() => PrescriptionPreviewOnline(pdfUrl: imageUrl(file)));
              },
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
