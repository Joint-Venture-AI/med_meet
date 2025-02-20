import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:med_meet_flutter/core/helpers/pref_helper.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/models/Auth/doctor_model.dart';
import 'package:med_meet_flutter/views/auth/doctor/doctor_verify_otp.dart';

class DoctorAuthServiceController extends GetxController
    implements GetxService {
  final RxBool _isLoading = false.obs;
  final Rx<DoctorModel> _doctorData = DoctorModel().obs;

  bool get isLoading => _isLoading.value;

  Future<void> doctorLogin(uniqueId, password) async {
    if (uniqueId == "" ||
        uniqueId == null ||
        password == "" ||
        password == null) {
      Get.snackbar("Field Empty", "Please Provide Credentials");
      return;
    }
    _isLoading.value = true;
    final url = Uri.http(ApiConstants.baseUrl, ApiConstants.doctorLogin);
    final headers = {
      "Content-Type": "application/json",
    };
    final body = {"uniqueId": uniqueId, "password": password};

    try {
      var response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _doctorData.value = DoctorModel.fromJson(data["data"]["user"]);
        Get.snackbar("Authorization Complete", data["message"]);
        _isLoading.value = false;
        update();
        // if the doctor is not verified through opt?
        if (_doctorData.value.verified != null &&
            !_doctorData.value.verified!) {
          await Get.to(
              () => DoctorVerifyOtp(
                    email: _doctorData.value.email!,
                  ),
              arguments: OTPTYPE.doctorSignup);

          resendOTP(_doctorData.value.email);

          // is everyfield of profile filled for the doctor?
        } else if (_doctorData.value.isAllFieldsFilled != null &&
            !_doctorData.value.isAllFieldsFilled!) {
          Get.toNamed(AppRoutes.doctorDetails);
          // if the doctor is verified
        } else if (_doctorData.value.approvedStatus != null &&
            _doctorData.value.isAllFieldsFilled != null &&
            _doctorData.value.verified != null &&
            _doctorData.value.verified! &&
            _doctorData.value.isAllFieldsFilled! &&
            _doctorData.value.approvedStatus! == "approved") {
          Get.toNamed(AppRoutes.doctorApp);
        } else if (_doctorData.value.approvedStatus != null &&
            _doctorData.value.approvedStatus! == "pending") {
          Get.toNamed(AppRoutes.verifyProgressDoctor);
        } else if (_doctorData.value.approvedStatus != null &&
            _doctorData.value.approvedStatus! == "rejected") {
          Get.snackbar("Rejected", "Your application has been rejected");
        }
      } else {
        final data = jsonDecode(response.body);
        Get.snackbar("Not Authorized", data["message"]);
      }
    } catch (e) {
      debugPrint(
          '------------\n -------------------------- \n ${e.toString()}');
    }
    _isLoading.value = false;
    _doctorData.value = DoctorModel();
    update();
  }

  Future doctorSignUp(name, email, doctorID, password, country) async {
    if (name == "" ||
        name == null ||
        email == "" ||
        email == null ||
        doctorID == "" ||
        doctorID == null ||
        password == "" ||
        password == null ||
        country == "" ||
        country == null) {
      Get.snackbar("Field Empty", "Please Provide Informations");
      return;
    }
    _isLoading.value = true;
    final url = Uri.http(ApiConstants.baseUrl, ApiConstants.doctorSignUp);
    final headers = {
      "Content-Type": "application/json",
    };
    final body = {
      "name": name,
      "email": email,
      "doctorId": doctorID,
      "country": country,
      "password": password
    };

    try {
      var resopnse =
          await http.post(url, headers: headers, body: jsonEncode(body));
      if (resopnse.statusCode == 200) {
        _isLoading.value = false;
        update();
        final data = jsonDecode(resopnse.body);
        Get.snackbar("Message", data["message"]);

        if (data["success"]) {
          Get.toNamed(AppRoutes.doctorVerifyOTP,
              parameters: {'email': data["data"]["email"]});
        }
      }
    } catch (e) {
      debugPrint(
          '------------\n -------------------------- \n ${e.toString()}');
    }
    _isLoading.value = false;
    update();
  }

  Future resendOTP(uniqueID) async {
    if (uniqueID == "" || uniqueID == null) {
      Get.snackbar("Email/DoctorID Missing", "Email or Doctor ID is missing");
    }
    final url = Uri.http(ApiConstants.baseUrl, ApiConstants.doctorResendOTP);
    final headers = {
      "Content-Type": "application/json",
    };
    final body = {
      "uniqueId": uniqueID,
    };
    try {
      var response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      final data = jsonDecode(response.body);
      Get.snackbar(data["success"] ? "OPT Successfull" : "Something went wrong",
          data["message"]);
    } catch (e) {
      debugPrint(
          '------------\n -------------------------- \n ${e.toString()}');
    }
  }

  Future verifyOTP(uniqueID, otp, optType) async {
    final url = Uri.http(ApiConstants.baseUrl, ApiConstants.doctorVerifyEmail);
    final header = {"Content-Type": "application/json"};
    final body = {"uniqueId": uniqueID, "oneTimeCode": int.parse(otp)};
    try {
      final response =
          await http.post(url, headers: header, body: jsonEncode(body));
      if (response.body.isNotEmpty) {
        final data = jsonDecode(response.body);
        Get.snackbar(
            data["success"] ? "Successfull" : "Unsuccessfull", data["message"]);
        if (response.statusCode == 200) {
          await PrefsHelper.setString(PrefsKey.forgetPassToken, data["data"]);
          if (optType == OTPTYPE.doctorSignup) {
            if (_doctorData.value.isAllFieldsFilled != null &&
                !_doctorData.value.isAllFieldsFilled!) {
              Get.toNamed(AppRoutes.doctorDetails);
            } else {
              Get.toNamed(AppRoutes.verifyProgressDoctor);
            }
          } else {
            // Implement forget pass
          }
        }
      }
    } catch (e) {
      debugPrint(
          '------------\n -------------------------- \n ${e.toString()}');
    }
  }

  Future updateDoctorDetails() async {
    final url =
        Uri.http(ApiConstants.baseUrl, ApiConstants.doctorUpdateProfile);
    final header = {"Content-Type": "multipart/form-data"};
    try {
      var request = http.MultipartRequest("PATCH", url);
    } catch (e) {
      debugPrint(
          '------------\n -------------------------- \n ${e.toString()}');
    }
  }
}
