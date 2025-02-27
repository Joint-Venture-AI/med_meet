import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:med_meet_flutter/controller/home_doctor_controller.dart';
import 'package:med_meet_flutter/core/components/custom_snack_bar.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';
import 'package:med_meet_flutter/core/helpers/pref_helper.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_constants.dart';
import 'package:med_meet_flutter/services/api_checker.dart';
import 'package:med_meet_flutter/services/api_client.dart';

class Profilecontroller extends GetxController {
  // display picture holder
  RxString displayPicture = "".obs;

  // image picker function for display picture
  Future pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      displayPicture.value = pickedFile.path;
    }
  }

  // To Update Profile
  Future updateDoctorProfile(
      {name,
      email,
      phone,
      dob,
      address,
      experience,
      medicalLicenseNumber,
      clinicName,
      clinicAddress,
      consultationFee,
      aboutDoctor,
      specialty}) async {
    final data = {
      "name": name,
      "email": email,
      "phone": phone,
      "dob": dob,
      "address": address,
      "experience": experience,
      "medicalLicenseNumber": medicalLicenseNumber,
      "clinicName": clinicName,
      "clinicAddress": clinicAddress,
      "consultationFee": consultationFee,
      "aboutDoctor": aboutDoctor,
      "specialty": specialty,
    };
    // remove null values
    data.removeWhere(
        (key, value) => value == null || value.toString().trim().isEmpty);

    final body = {"data": jsonEncode(data)};
    List<MultipartBody> multipart = [];
    if (displayPicture.value.isNotEmpty) {
      multipart = [
        MultipartBody("image", File(displayPicture.value)),
      ];
    }
    Get.context!.loaderOverlay.show();
    Response response = await ApiClient.postMultipartData(
        ApiConstants.doctorUpdateProfile, body,
        multipartBody: multipart);

    if (response.statusCode == 200) {
      showCustomSnackBar("Profile Updated Successfully", isError: false);
      await Get.find<HomeDoctorController>().getDoctorrData();
    } else {
      ApiChecker.checkApi(response);
    }
    Get.context!.loaderOverlay.hide();
  }
  // Update Doctor Details

  // To Logout
  Future logOut() async {
    Get.context!.loaderOverlay.show();
    await PrefsHelper.remove(PrefsKey.otpToken);
    await PrefsHelper.remove(PrefsKey.accessToken);
    await PrefsHelper.remove(PrefsKey.accountID);
    await PrefsHelper.remove(PrefsKey.role);
    await PrefsHelper.remove(AppConstants.bearerToken);
    Get.context!.loaderOverlay.hide();
    Get.offAllNamed(AppRoutes.selectCountryScreen);
  }
}
