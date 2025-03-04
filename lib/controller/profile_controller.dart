import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:med_meet_flutter/controller/home_doctor_controller.dart';
import 'package:med_meet_flutter/controller/home_user_controller.dart';
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

  // Create Medical Record
  Future createMedicalRecord({name, age, gender, historty}) async {
    final data = {
      "name": name,
      "age": age,
      "gender": gender,
      "medicalHistory": historty,
      "user": await PrefsHelper.getString(PrefsKey.accountID),
    };
    // List<MultipartBody> doc = [MultipartBody("doc", file)];
  }

  //  change password
  Future changePassword(
      {currentPasword, newPassword, confirmNewPassword}) async {
    final data = {
      "currentPassword": currentPasword,
      "newPassword": newPassword,
      "confirmPassword": confirmNewPassword,
    };
    // Reading account Role
    final role = await PrefsHelper.getString(PrefsKey.role);
    final url = role == "DOCTOR"
        ? ApiConstants.doctorChangePassword
        : ApiConstants.userChangePassword;
    Get.context!.loaderOverlay.show();
    Response response = await ApiClient.postData(url, jsonEncode(data));
    if (response.statusCode == 200) {
      showCustomSnackBar("Password Changed Successfully", isError: false);
    } else {
      ApiChecker.checkApi(response);
    }
    Get.context!.loaderOverlay.hide();
  }

  // To Update Profile
  Future updateProfile(
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

    final role = await PrefsHelper.getString(PrefsKey.role);
    final url = role == "DOCTOR"
        ? ApiConstants.doctorUpdateProfile
        : ApiConstants.userUpdateProfile;
    Get.context!.loaderOverlay.show();
    Response response =
        await ApiClient.postMultipartData(url, body, multipartBody: multipart);

    if (response.statusCode == 200) {
      showCustomSnackBar("Profile Updated Successfully", isError: false);
      if (role == "DOCTOR") {
        await Get.find<HomeDoctorController>().getDoctorrData();
      } else {
        await Get.find<UserHomeController>().getUserData();
      }
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
