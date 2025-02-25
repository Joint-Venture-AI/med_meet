import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:med_meet_flutter/controller/auth_user_controller.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_drop_down.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/components/date_input.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class CompletePRofileView extends StatefulWidget {
  const CompletePRofileView({super.key});

  @override
  State<CompletePRofileView> createState() => _CompletePRofileViewState();
}

class _CompletePRofileViewState extends State<CompletePRofileView> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  XFile? imageFile;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {});
      imageFile = file;
    }
  }

  final CommonController commonController = Get.put(CommonController());

  final AuthUserController authUserController = Get.put(AuthUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60), child: CustomAppBar(title: "")),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
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
                GestureDetector(
                  onTap: () {
                    pickImage();
                  },
                  child: Container(
                    height: 120.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                        color: AppColors.background1, shape: BoxShape.circle),
                    child: Center(
                      child: imageFile.isNull
                          ? SvgPicture.asset(
                              SVGAssets.placeholderProfilePic,
                              height: 72.h,
                              width: 72.w,
                              fit: BoxFit.cover,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.file(
                                File(imageFile!.path),
                                height: double.maxFinite,
                                width: double.maxFinite,
                                fit: BoxFit.cover,
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
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.border1),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    phoneController.text = phone.completeNumber;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Obx(
                  () => CustomDropDown(
                    title: "Gender",
                    dropDownItems: commonController.genders,
                    initialValue: commonController.selectedGender.value,
                    onChange: (String? newVal) {
                      commonController.setSelectedGender(newVal!);
                    },
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                DateInput(
                    dateController: ageController,
                    icon: Icons.calendar_month,
                    hintText: "YYYY/MM/DD"),
                SizedBox(
                  height: 32,
                ),
                CustomButton(
                    onPressed: () {
                      authUserController.userCompleteProfile(
                          nameController.text,
                          phoneController.text,
                          commonController.selectedGender.value,
                          ageController.text,
                          authUserController.selectedCountry.value,
                          image: imageFile);
                    },
                    buttonTitle: "Complete Profile")
              ],
            ),
          ),
        ));
  }
}
