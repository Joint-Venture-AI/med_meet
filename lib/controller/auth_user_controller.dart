import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:med_meet_flutter/controller/zego_cloud_controller.dart';
import 'package:med_meet_flutter/core/components/custom_snack_bar.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';
import 'package:med_meet_flutter/core/helpers/pref_helper.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_constants.dart';
import 'package:med_meet_flutter/models/user_model.dart';
import 'package:med_meet_flutter/services/api_checker.dart';
import 'package:med_meet_flutter/services/api_client.dart';
import 'package:med_meet_flutter/services/notification_service.dart';
import 'package:med_meet_flutter/views/auth/user/user_verify_otp.dart';

class AuthUserController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<UserModel> userData = UserModel().obs;
  RxString selectedCountry = "select your country".obs;

  Future userSignIn(email, password) async {
    if (email == "" || password == "") {
      showCustomSnackBar("Provide Credentials");
      return;
    }
    if (password.length < 8) {
      showCustomSnackBar("Password must be at least 8 characters long");
      return;
    }
    // start loader
    Get.context!.loaderOverlay.show();
    final body = {
      "uniqueId": email,
      "password": password,
      "fcmToken": await NotificationService.instance.sendFCMTokenToServer(),
    };

    var response =
        await ApiClient.postData(ApiConstants.userLoign, jsonEncode(body));
    // off loader
    Get.context!.loaderOverlay.hide();

    if (response.statusCode == 200) {
      if (response.body["success"]) {
        // Show success message
        showCustomSnackBar(response.body["message"],
            isError:
                (response.statusCode != 200) || (response.statusCode != 201));

        // load the data in the user model and save it in the memory
        userData.value = UserModel.fromJson(response.body["data"]["user"]);
        // saving the access token
        PrefsHelper.setString(
            AppConstants.bearerToken, response.body["data"]["accessToken"]);

        // saving the id and role in shared prefrence
        PrefsHelper.setString(PrefsKey.accountID, userData.value.id);
        PrefsHelper.setString(PrefsKey.accountName, userData.value.name);
        PrefsHelper.setString(PrefsKey.role, userData.value.role);
// Zego Cloud on user login
        Get.find<ZegoCloudController>().onUserLogin(
            userID: userData.value.id, userName: userData.value.name);

        if (userData.value.verified != null && !userData.value.verified!) {
          // when user is not verified OTP is sent
          await requestOTP(userData.value.email, isforgotPass: false);
        } else if (userData.value.isAllFieldsFilled != null &&
            !userData.value.isAllFieldsFilled!) {
          // If all the fields are not filled
          Get.toNamed(AppRoutes.completeProfile);
        } else if (userData.value.id != null &&
            userData.value.verified! &&
            userData.value.isAllFieldsFilled!) {
          // when the user has all fields filled and also verified
          Get.offAllNamed(AppRoutes.userApp);
        }
      }
    } else {
      ApiChecker.checkApi(response);
    }
  }

  Future userSignUp(name, email, password, country) async {
    if (name == "" || email == "" || password == "" || country == "") {
      showCustomSnackBar("Fields Must not be empty");
      return;
    }
    if (password.length < 8) {
      showCustomSnackBar("Password must be at least 8 characters long");
      return;
    }

    final body = {
      "name": name,
      "email": email,
      "country": country,
      "password": password,
      "fcmToken": await NotificationService.instance.sendFCMTokenToServer(),
    };

    Get.context!.loaderOverlay.show();
    Response response =
        await ApiClient.postData(ApiConstants.userSignUp, jsonEncode(body));
    Get.context!.loaderOverlay.hide();

    if (response.statusCode == 200) {
      if (response.body["success"]) {
        showCustomSnackBar(response.body["message"],
            isError:
                (response.statusCode != 200) || (response.statusCode != 201));
        userData.value = UserModel.fromJson(response.body["data"]);

        if (userData.value.verified != null && !userData.value.verified!) {
          requestOTP(userData.value.email, isforgotPass: false);
        } else if (userData.value.isAllFieldsFilled != null &&
            !userData.value.isAllFieldsFilled!) {
          Get.toNamed(AppRoutes.completeProfile);
        }
      } else {
        showCustomSnackBar(response.body["message"]);
      }
    } else {
      ApiChecker.checkApi(response);
    }
  }

  Future requestOTP(email, {isforgotPass = true}) async {
    Get.context!.loaderOverlay.show();
    final body = {"uniqueId": email};
    var response = await ApiClient.postData(
      ApiConstants.userResendOtp,
      jsonEncode(body),
    );
    Get.context!.loaderOverlay.hide();

    if (response.statusCode == 200) {
      if (response.body["success"]) {
        showCustomSnackBar(response.body["message"],
            isError:
                (response.statusCode != 200) || (response.statusCode != 201));
        await Get.to(() => UserVerifyOtpView(
              email: email,
              isForgotPass: isforgotPass,
            ));
      }
      Get.snackbar("Something went wrong", response.body["message"]);
    } else {
      ApiChecker.checkApi(response);
    }
  }

  Future userVerifyEmail(email, onetimecode, {isforgetPass = true}) async {
    final body = {"uniqueId": email, "oneTimeCode": int.parse(onetimecode)};
    Get.context!.loaderOverlay.show();
    var response = await ApiClient.postData(
        ApiConstants.userVerifyEmail, jsonEncode(body));
    Get.context!.loaderOverlay.hide();
    if (response.statusCode == 200) {
      if (response.body["success"]) {
        showCustomSnackBar(response.body["message"],
            isError:
                (response.statusCode != 200) || (response.statusCode != 201));
        PrefsHelper.setString(PrefsKey.otpToken, response.body["data"]);
        if (isforgetPass) {
          Get.toNamed(AppRoutes.userNewPassword);
        } else {
          if (userData.value.isAllFieldsFilled != null &&
              !userData.value.isAllFieldsFilled!) {
            Get.toNamed(AppRoutes.completeProfile);
          }
        }
      } else {
        Get.snackbar("Something went wrong", "please try again later");
      }
    } else {
      ApiChecker.checkApi(response);
    }
  }

  Future userResetpassword(pass, confirmpass) async {
    if (pass == "" || confirmpass == "") {
      showCustomSnackBar("Field must not be emptyu");
      return;
    }
    if (pass != confirmpass) {
      showCustomSnackBar("Passwords do not match");
      return;
    }
    if (pass.length < 8) {
      showCustomSnackBar("Password must be at least 8 characters long");
      return;
    }

    final body = {"newPassword": pass, "confirmPassword": confirmpass};
    final header = {
      "Authorization": await PrefsHelper.getString(PrefsKey.otpToken),
      "Content-Type": "application/json"
    };
    Get.context!.loaderOverlay.show();
    var response = await ApiClient.postData(
        ApiConstants.userResetPass, jsonEncode(body),
        headers: header);
    Get.context!.loaderOverlay.hide();
    if (response.statusCode == 200) {
      if (response.body['success']) {
        showCustomSnackBar(response.body["message"],
            isError:
                (response.statusCode != 200) || (response.statusCode != 201));
        Get.toNamed(AppRoutes.userSignIn);
      }
    } else {
      ApiChecker.checkApi(response);
    }
  }

  Future userCompleteProfile(name, phone, gender, dob, country, {image}) async {
    if (name == "" ||
        phone == "" ||
        gender == "" ||
        dob == "" ||
        image == null ||
        country == "select your country") {
      showCustomSnackBar("Fields Must not be empty");
      return;
    }

    final body = {
      "data": jsonEncode({
        "name": name,
        "dob": dob,
        "gender": gender,
        "phoneNumber": phone,
        "country": country
      })
    };

    final List<MultipartBody> multipartBodies = [
      MultipartBody("image", File(image.path)),
    ];

    Get.context!.loaderOverlay.show();

    final bearerToken = await PrefsHelper.getString(AppConstants.bearerToken);

    var header = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $bearerToken'
    };

    Response response = await ApiClient.postMultipartData(
        ApiConstants.userUpdateProfile, body,
        multipartBody: multipartBodies, headers: header);
    Get.context!.loaderOverlay.hide();

    if (response.statusCode == 200) {
      showCustomSnackBar(response.body["message"],
          isError:
              (response.statusCode != 200) || (response.statusCode != 201));
      Get.toNamed(AppRoutes.userSignIn);
    } else {
      ApiChecker.checkApi(response);
    }
  }

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut<ZegoCloudController>(() => ZegoCloudController());
  }
}
