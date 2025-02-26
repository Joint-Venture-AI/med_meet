import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/doctor/auth_doctor_controller.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_drop_down.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class DoctorDetailsAuthView extends StatelessWidget {
  DoctorDetailsAuthView({super.key});

  final TextEditingController experienceController = TextEditingController();
  final TextEditingController clinicNameController = TextEditingController();
  final TextEditingController clinicAddressController = TextEditingController();
  final TextEditingController consultationFeeController =
      TextEditingController();
  final TextEditingController aboutDoctorController = TextEditingController();
  final AuthDoctorsController authDoctorsController =
      Get.find<AuthDoctorsController>();
  final CommonController commonController = Get.put(CommonController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CustomAppBar(title: "Doctor Details")),
        body: Padding(
          padding: EdgeInsets.all(24),
          child: ListView(
            children: [
              Obx(
                () => CustomDropDown(
                  title: "Specialist",
                  dropDownItems: commonController.allSpecialty.map((item) {
                    return {
                      "title": item["name"].toString(),
                      "val": item["_id"].toString(),
                    };
                  }).toList(),
                  initialValue: commonController.selectedSpecialty.value,
                  onChange: (String? newVal) {
                    commonController.selectedSpecialty.value = newVal!;
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              CustomTextInput(
                isPhone: true,
                title: "Experience",
                hintText: "Experience",
                textController: experienceController,
              ),
              SizedBox(
                height: 12,
              ),
              Obx(
                () => CustomDropDown(
                  title: "Select Gender",
                  dropDownItems: commonController.genders,
                  initialValue: commonController.selectedGender.value,
                  onChange: (String? newVal) {
                    commonController.setSelectedGender(newVal!);
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              CustomTextInput(
                title: "Clinic Name",
                hintText: "Clinic Name",
                textController: clinicNameController,
              ),
              SizedBox(
                height: 12,
              ),
              CustomTextInput(
                title: "Clinic Address",
                hintText: "Clinic Address",
                maxLines: 4,
                textController: clinicAddressController,
              ),
              SizedBox(
                height: 12,
              ),
              CustomTextInput(
                isPhone: true,
                title: "Set Consultation Fee",
                hintText: "Set price",
                textController: consultationFeeController,
              ),
              SizedBox(
                height: 12,
              ),
              CustomTextInput(
                title: "About Doctor",
                hintText: "About doctor",
                maxLines: 4,
                textController: aboutDoctorController,
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Upload Professional ID Image",
                    style: AppTypography.bodyText1Black,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            authDoctorsController.setImage(
                                type: FileTypes.idFront);
                          },
                          child: buildIDImageButton(
                              title: "Front side of ID",
                              isIamge: true,
                              asset: SVGAssets.addImageIcon,
                              imageFile: authDoctorsController.idFront.value !=
                                      null
                                  ? authDoctorsController.idFront.value!.path
                                  : ""),
                        ),
                      ),
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            authDoctorsController.setImage(
                                type: FileTypes.idBack);
                          },
                          child: buildIDImageButton(
                              title: "Back side of ID",
                              isIamge: true,
                              asset: SVGAssets.addImageIcon,
                              imageFile:
                                  authDoctorsController.idBack.value != null
                                      ? authDoctorsController.idBack.value!.path
                                      : ""),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Upload Your Medical License or Certification (PDF)",
                    style: AppTypography.bodyText1Black,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        authDoctorsController.setFile();
                      },
                      child: buildIDImageButton(
                          title: "Upload your PDF file here",
                          width: true,
                          asset: SVGAssets.cloudUpload,
                          pdfPath: authDoctorsController.medicalLicense.value !=
                                  null
                              ? authDoctorsController.medicalLicense.value!.path
                              : ""),
                    ),
                  ),
                ],
              ),
              CustomButton(
                  onPressed: () {
                    authDoctorsController.addDetailsAfterSignUp(
                        aboutDoctor: aboutDoctorController.text,
                        clinicAddress: clinicAddressController.text,
                        clinicName: clinicNameController.text,
                        consultationFree: consultationFeeController.text,
                        experience: experienceController.text,
                        specialist: commonController.selectedSpecialty.value,
                        gender: commonController.selectedGender.value);
                  },
                  buttonTitle: "Continue")
            ],
          ),
        ));
  }

  DottedBorder buildIDImageButton(
      {title,
      width = false,
      asset,
      imageFile = "",
      isIamge = false,
      pdfPath = ""}) {
    return DottedBorder(
      color: AppColors.border1,
      dashPattern: [14],
      child: SizedBox(
        height: 140.h,
        width: width ? double.maxFinite : 162.w,
        child: imageFile != ""
            ? Image.file(File(imageFile), fit: BoxFit.cover)
            : pdfPath != ""
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        pdfPath,
                        style: AppTypography.bodyText1Black,
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(asset),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        title,
                        style: AppTypography.bodyText1Black,
                      )
                    ],
                  ),
      ),
    );
  }
}
