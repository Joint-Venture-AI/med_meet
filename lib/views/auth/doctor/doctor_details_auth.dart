import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_drop_down.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';


class DoctorDetailsAuthView extends StatelessWidget {
   DoctorDetailsAuthView({super.key});

  final TextEditingController experienceController = TextEditingController();
  final TextEditingController clinicNameController = TextEditingController();
  final TextEditingController clinicAddressController =
  TextEditingController();
  final TextEditingController consultationFeeController =
  TextEditingController();
  final TextEditingController aboutDoctorController = TextEditingController();

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
              CustomDropDown(title: "Specialist", dropDownItems: [
                "Dentist",
                "Immunologists",
                "Cardiologists",
                "Neurologist",
                "Orthopedics",
                "Therapist",
                "Nutritionist",
                "Gynecologic",
              ]),
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
                      GestureDetector(
                        onTap: () {

                        },
                        child: Obx(() => buildIDImageButton(
                            title: "Front side of ID",
                            isIamge: true,
                            asset: SVGAssets.addImageIcon,
                            imageFile: "")),
                      ),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Obx(() => buildIDImageButton(
                            title: "Back side of ID",
                            isIamge: true,
                            asset: SVGAssets.addImageIcon,
                            imageFile: "")),
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
                  Obx(() => GestureDetector(
                        onTap: () {

                        },
                        child: buildIDImageButton(
                            title: "Upload your PDF file here",
                            width: true,
                            asset: SVGAssets.cloudUpload,
                            pdfPath:""),
                      ))
                ],
              ),
              CustomButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.doctorVerifyOTP,
                        arguments: OTPTYPE.doctorSignup);
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
