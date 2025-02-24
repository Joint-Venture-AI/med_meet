import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:med_meet_flutter/core/components/custom_snack_bar.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';
import 'package:med_meet_flutter/core/helpers/pref_helper.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_constants.dart';
import 'package:med_meet_flutter/models/Auth/doctor_model.dart';
import 'package:med_meet_flutter/services/api_checker.dart';
import 'package:med_meet_flutter/services/api_client.dart';
import 'package:med_meet_flutter/views/auth/doctor/doctor_verify_otp.dart';

class AuthDoctorsController extends GetxController {
  final RxString imagePath = ''.obs;
  final RxString idFrontPath = ''.obs;
  final RxString idBackPath = ''.obs;
  final RxString pdfPath = ''.obs;

  String get getIdFrontPath => idFrontPath.value;
  String get getIdBackPath => idBackPath.value;
  String get getImagePath => imagePath.value;
  String get getPdfPath => pdfPath.value;

  void setImagePath(String path) {
    imagePath.value = path;
    update();
  }

  void setIdFrontPath(String path) {
    idFrontPath.value = path;
    update();
  }

  void setIdBackPath(String path) {
    idBackPath.value = path;
    update();
  }

  void setPdfPath(String path) {
    pdfPath.value = path;
    update();
  }

  //  =====>>> API Calls <<<=======

  final RxBool isLoading = false.obs;
  Rx<DoctorModel> doctorData = DoctorModel().obs;
  RxString selectedCountry = "select your country".obs;

  Rx<File?> idFront = Rx<File?>(null);
  Rx<File?> idBack = Rx<File?>(null);
  Rx<File?> medicalLicense = Rx<File?>(null);

  void setImage({type}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (type == FileTypes.idFront) {
        idFront.value = File(image.path);
      }
      if (type == FileTypes.idBack) {
        idBack.value = File(image.path);
      }
    }
  }

  void setFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      medicalLicense.value = File(result.paths[0]!);
    }
  }

  void setSelectCountry(String country) {
    selectedCountry.value = country;
    update();
  }

  Future signIn(email, password) async {
    if (email == "" || email == null || password == "" || password == null) {
      showCustomSnackBar("Please Provide Credentials", getXSnackBar: false);
    }
    isLoading.value = true;
    final body = {"uniqueId": email, "password": password};
    final response =
        await ApiClient.postData(ApiConstants.doctorLogin, jsonEncode(body));

    if (response.statusCode == 200) {
      doctorData.value = DoctorModel.fromJson(response.body["data"]["user"]);
      PrefsHelper.setString(
          AppConstants.bearerToken, response.body["data"]["accessToken"]);
      isLoading.value = false;
      Get.snackbar(response.body["success"] ? "Authenticated" : "Error",
          response.body["message"]);
      if (!doctorData.value.verified!) {
        await sendOTP(doctorData.value.email!);
        await Get.to(() => DoctorVerifyOtp(email: doctorData.value.email!));
      } else if (!doctorData.value.isAllFieldsFilled!) {
        Get.toNamed(AppRoutes.doctorDetails);
      } else if (doctorData.value.approvedStatus! == "pending") {
        Get.toNamed(AppRoutes.verifyProgressDoctor);
      } else if (doctorData.value.approvedStatus == "rejected") {
        Get.snackbar("Rejected", "Your application has been rejected");
      } else if (doctorData.value.approvedStatus == "approved") {
        Get.toNamed(AppRoutes.doctorApp);
      }
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading.value = false;
  }

  Future signUp(name, email, doctorID, password) async {
    if (name == "" ||
        name == null ||
        email == "" ||
        email == null ||
        doctorID == "" ||
        doctorID == null ||
        password == "" ||
        password == null) {
      showCustomSnackBar("Please Provide Data", getXSnackBar: false);
    }

    isLoading.value = true;

    final body = {
      "name": name,
      "email": email,
      "doctorId": doctorID,
      "country": selectedCountry.value,
      "password": password
    };

    Response response =
        await ApiClient.postData(ApiConstants.doctorSignUp, jsonEncode(body));
    isLoading.value = false;
    if (response.statusCode == 200) {
      showCustomSnackBar(response.body["message"], getXSnackBar: false);
      if (response.body["success"]) {
        await sendOTP(email, isSignUp: true);
      }
      isLoading.value = false;
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading.value = false;
  }

  Future sendOTP(uniqueID, {isSignUp = false}) async {
    final body = {"uniqueId": uniqueID};
    Response response = await ApiClient.postData(
        ApiConstants.doctorResendOTP, jsonEncode(body));
    if (response.statusCode == 200) {
      Get.snackbar("OTP Sent", response.body["message"]);
      isLoading.value = false;
      Get.to(() => DoctorVerifyOtp(
            email: uniqueID,
            isSignUp: isSignUp,
          ));
    } else {
      ApiChecker.checkApi(response);
    }
  }

  Future verifyDoctorOtp(uniqueId, oneTimeCode, {isSignup}) async {
    isLoading.value = true;
    final body = {"uniqueId": uniqueId, "oneTimeCode": int.parse(oneTimeCode)};
    Response response = await ApiClient.postData(
        ApiConstants.doctorVerifyEmail, jsonEncode(body));

    if (response.statusCode == 200) {
      if (response.body["success"]) {
        PrefsHelper.setString(PrefsKey.otpToken, response.body["data"]);
        Get.snackbar("Successfull", response.body["message"]);
        if (isSignup) {
          if (doctorData.value.isAllFieldsFilled == null) {
            isLoading.value = false;
            Get.toNamed(AppRoutes.doctorDetails);
          } else {
            isLoading.value = false;
            Get.toNamed(AppRoutes.doctorSignIn);
          }
        } else {
          isLoading.value = false;
          Get.toNamed(AppRoutes.doctorNewPass);
        }
      }
    } else {
      ApiChecker.checkApi(response);
    }
  }

  Future forgetPass(password, confirmPassword) async {
    isLoading.value = true;
    if (password == "" || confirmPassword == "") {
      showCustomSnackBar("Fields are empty");
      isLoading.value = false;
      return;
    }
    if (password != confirmPassword) {
      showCustomSnackBar("Passwords do no match");
      isLoading.value = false;
      return;
    }

    final body = {"newPassword": password, "confirmPassword": confirmPassword};
    final header = {
      "Authorization": await PrefsHelper.getString(PrefsKey.otpToken),
      'Content-Type': 'application/json'
    };

    Response response = await ApiClient.postData(
        ApiConstants.doctorResetPassword, jsonEncode(body),
        headers: header);
    if (response.statusCode == 200) {
      if (response.body["success"]) {
        Get.snackbar("Successful", response.body["message"]);
        isLoading.value = false;
        Get.toNamed(AppRoutes.doctorSignIn);
      }
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading.value = false;
  }

// this is for the doctor details screen after sign up screen
  Future addDetailsAfterSignUp(
      {specialist,
      experience,
      clinicName,
      clinicAddress,
      consultationFree,
      aboutDoctor,
      gender}) async {
    if (specialist == null ||
        specialist.isEmpty ||
        experience == null ||
        experience.isEmpty ||
        clinicName == null ||
        clinicName.isEmpty ||
        clinicAddress == null ||
        clinicAddress.isEmpty ||
        consultationFree == null ||
        consultationFree.isEmpty ||
        aboutDoctor == null ||
        aboutDoctor.isEmpty ||
        gender == null ||
        gender.isEmpty ||
        idFront.value == null ||
        idBack.value == null ||
        medicalLicense.value == null) {
      showCustomSnackBar("Fill out all fields");
      return;
    }
    isLoading.value = true;
    final body = {
      "data": json.encode({
        "aboutDoctor": aboutDoctor,
        "clinic": clinicName,
        "clinicAddress": clinicAddress,
        "consultationFee": int.parse(consultationFree),
        "experience": int.parse(experience),
        "gender": gender,
        "specialist": specialist,
      })
    };

    final List<MultipartBody> multipartBodies = [
      MultipartBody("professionalIdFront", idFront.value!),
      MultipartBody("professionalIdBack", idBack.value!),
      MultipartBody("medicalLicense", medicalLicense.value!),
    ];

    final bearerToken = await PrefsHelper.getString(AppConstants.bearerToken);

    var header = {
      'Content-Type': "multipart/form-data",
      'Authorization': 'Bearer $bearerToken'
    };

    Response response = await ApiClient.postMultipartData(
        ApiConstants.doctorUpdateProfile, body,
        multipartBody: multipartBodies, headers: header);

    if (response.statusCode == 200) {
      if (response.body["success"]) {
        Get.toNamed(AppRoutes.verifyProgressDoctor);
      }
    } else {
      ApiChecker.checkApi(response);
    }
  }
}

class FileTypes {
  static String idFront = "FrontIDPhoto";
  static String idBack = "BackIDPhoto";
}
