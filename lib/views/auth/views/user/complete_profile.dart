import 'dart:io';

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
import 'package:med_meet_flutter/views/auth/controllers/image_picker_controller.dart';

class CompletePRofileView extends StatelessWidget {
  const CompletePRofileView({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController ageController = TextEditingController();

    final ImagePickerController imagePickerController =
        Get.put(ImagePickerController());

    Future<void> pickImage() async {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
      if (photo != null) {
        imagePickerController.setImagePath(photo.path);
      }
    }

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40), child: CustomAppBar(title: "")),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Expanded(
              child: Column(
                children: [
                  Text(
                    "Complete Your Profile",
                    style: AppTypography.headerText1,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Fill in the details to get the best \n   experience',
                    style: AppTypography.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      child: Container(
                        height: 120.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                            color: AppColors.background1,
                            shape: BoxShape.circle),
                        child: Center(
                          child: imagePickerController.imagePath.isEmpty
                              ? SvgPicture.asset(
                                  SVGAssets.placeholderProfilePic,
                                  height: 72.h,
                                  width: 72.w,
                                  fit: BoxFit.cover,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.file(
                                    File(imagePickerController.getImagePath),
                                    height: double.maxFinite,
                                    width: double.maxFinite,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  CustomTextInput(
                    title: "Name",
                    hintText: "Enter your name",
                    textController: nameController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextInput(
                    title: "Name",
                    hintText: "Enter your name",
                    isPhone: true,
                    textController: phoneController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomDropDown(
                    title: "Gender",
                    dropDownItems: ["Male", "Female"],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextInput(
                    title: "Age",
                    hintText: "Enter your age",
                    textController: ageController,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  CustomButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.signIn);
                      },
                      buttonTitle: "Complete Profile")
                ],
              ),
            ),
          ),
        ));
  }
}
