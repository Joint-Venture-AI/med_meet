import 'dart:convert';

import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:med_meet_flutter/core/components/custom_snack_bar.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';
import 'package:med_meet_flutter/core/helpers/pref_helper.dart';
import 'package:med_meet_flutter/models/detailed_appointment_model.dart';
import 'package:med_meet_flutter/models/general_appointment_model.dart';
import 'package:med_meet_flutter/services/api_checker.dart';
import 'package:med_meet_flutter/services/api_client.dart';

class AppointmentController extends GetxController {
  // User End Appointment List
  RxList<GeneralAppointmentModel> userAppointmentList =
      <GeneralAppointmentModel>[].obs;

  // User End Appointment Details
  Rx<DetailedAppointmentModel> appointmentDetails =
      DetailedAppointmentModel().obs;
  // holds rating for appointment completion on users end
  RxDouble userAppointmentrating = 0.0.obs;

  // Fetch All The appointments for a given User
  Future getAllAppointments() async {
    Get.context!.loaderOverlay.show();
    // Retrieve the saved useID from the user
    // this will always be userID because the function will be called from user
    final userID = await PrefsHelper.getString(PrefsKey.accountID);
    Response response =
        await ApiClient.getData(ApiConstants.userGetAllAppointment(userID));
    Get.context!.loaderOverlay.hide();
    if (response.statusCode == 200) {
      // all is representing the all appointment list data
      final all = response.body["data"];
      // Converting List of json to List of Model
      userAppointmentList.value = (all as List)
          .map((el) => GeneralAppointmentModel.fromJson(el))
          .toList();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    final role = await PrefsHelper.getString(PrefsKey.role);
    if (role == "USER") {
      await getAllAppointments();
    }
  }

  // Fetches appointment detials with appointment ID
  Future getAppointmentDetails(appointmentID) async {
    Get.context!.loaderOverlay.show();
    Response response = await ApiClient.getData(
        ApiConstants.getAppointmentDetauls(appointmentID));
    Get.context!.loaderOverlay.hide();
    if (response.statusCode == 200) {
      // denoting the appointment details object in the body
      final details = response.body["data"];
      appointmentDetails.value = DetailedAppointmentModel.fromJson(details);
      update();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  // Post review with appointmentID
  Future postReviewToAppointment({ratting, review, appointmentID}) async {
    final body = {"rating": int.parse(ratting), "review": review};
    Get.context!.loaderOverlay.show();
    Response response = await ApiClient.postData(
        ApiConstants.userPostReview(appointmentID), jsonEncode(body));
    Get.context!.loaderOverlay.hide();
    if (response.statusCode == 200) {
      showCustomSnackBar(response.body["message"], isError: false);
    } else {
      ApiChecker.checkApi(response);
    }
  }
}
