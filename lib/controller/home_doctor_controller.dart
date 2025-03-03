import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';
import 'package:med_meet_flutter/core/helpers/pref_helper.dart';
import 'package:med_meet_flutter/models/doctor_score_model.dart';
import 'package:med_meet_flutter/models/general_appointment_model.dart';
import 'package:med_meet_flutter/models/single_doctor_model.dart';
import 'package:med_meet_flutter/services/api_checker.dart';
import 'package:med_meet_flutter/services/api_client.dart';

class HomeDoctorController extends GetxController {
  // Holds Doctor login data
  Rx<SingleDoctorModel> doctorData = SingleDoctorModel().obs;
  // Contain the full infromation of a doctor fetched with id
  Rx<SingleDoctorModel> singleDoctorData = SingleDoctorModel().obs;
  // Contains a list of doctors
  RxList<SingleDoctorModel> allDoctors = <SingleDoctorModel>[].obs;
  // Holds the doctor's score in a model
  Rx<DoctorScoreCountModel> doctorScore = DoctorScoreCountModel().obs;
  // holds upcoming appointments
  RxList<GeneralAppointmentModel> upcomingAppointments =
      <GeneralAppointmentModel>[].obs;
  // holds completed appointments
  RxList<GeneralAppointmentModel> completedAppointments =
      <GeneralAppointmentModel>[].obs;
  // holds all the appointments
  RxList<GeneralAppointmentModel> allAppointments =
      <GeneralAppointmentModel>[].obs;

  // fetch Doctor data
  Future getDoctorrData() async {
    // Fetching DoctorData Data
    final docID = await PrefsHelper.getString(PrefsKey.accountID);
    Response response = await ApiClient.getData(
        // change later with docID
        ApiConstants.getSingleDoctor(docID));

    if (response.statusCode == 200) {
      // loading Doctor data in memory
      doctorData.value = SingleDoctorModel.fromJson(response.body["data"]);
    } else {
      ApiChecker.checkApi(response);
    }
  }

  // Fetch all doctors
  Future getAllDoctors() async {
    Response response = await ApiClient.getData(ApiConstants.userGetAllDoctors);
    if (response.statusCode == 200) {
      // loading doctors without filtering
      final body = response.body;
      final doctorList = body["data"];
      // convert (json to model) list
      allDoctors.value = (doctorList as List)
          .map((e) => SingleDoctorModel.fromJson(e))
          .toList();
      allDoctors.refresh();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  // Get Single Doctor Info with ID
  Future getSingleDoctor(docID) async {
    Get.context!.loaderOverlay.show();
    Response response =
        await ApiClient.getData(ApiConstants.getSingleDoctor(docID));
    if (response.statusCode == 200) {
      // loading doctor details by id for user
      singleDoctorData.value =
          SingleDoctorModel.fromJson(response.body["data"]);
      singleDoctorData.refresh();
    } else {
      ApiChecker.checkApi(response);
    }
    Get.context!.loaderOverlay.hide();
  }

  // Fetches the scores with doctor id
  Future getDoctorScores() async {
    final docId = await PrefsHelper.getString(PrefsKey.accountID);
    Response response =
        await ApiClient.getData(ApiConstants.doctorGetHisScore(docId));

    if (response.statusCode == 200) {
      // loading doctor score
      doctorScore.value = DoctorScoreCountModel.fromJson(response.body["data"]);
    } else {
      ApiChecker.checkApi(response);
    }
  }

  // Fetches Upcomming Appointments
  Future getDoctorUpcomingAppointments() async {
    // reading docid from memory
    final docID = await PrefsHelper.getString(PrefsKey.accountID);
    Response response = await ApiClient.getData(
        ApiConstants.getDoctorFilteredAppointment(docID, "Upcoming"));
    if (response.statusCode == 200) {
      // loading doctor filtered appointments
      final body = response.body;
      final doctorList = body["data"];
      // convert (json to model) list
      upcomingAppointments.value = (doctorList as List)
          .map((e) => GeneralAppointmentModel.fromJson(e))
          .toList();
      upcomingAppointments.refresh();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  // Fetches Completed Appointments
  Future getDoctorCompletedAppointments() async {
    // reading docid from memory
    final docID = await PrefsHelper.getString(PrefsKey.accountID);
    Response response = await ApiClient.getData(
        ApiConstants.getDoctorFilteredAppointment(docID, "Completed"));
    if (response.statusCode == 200) {
      // loading doctor completed appointments
      final body = response.body;
      final doctorList = body["data"];
      // convert (json to model) list
      completedAppointments.value = (doctorList as List)
          .map((e) => GeneralAppointmentModel.fromJson(e))
          .toList();
      completedAppointments.refresh();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  // Fetches all Appointments
  Future getDoctorAllAppointments() async {
    // reading docid from memory
    final docID = await PrefsHelper.getString(PrefsKey.accountID);
    Response response =
        await ApiClient.getData(ApiConstants.getDoctorAllAppointment(docID));
    if (response.statusCode == 200) {
      // loading doctor completed appointments
      final body = response.body;
      final doctorList = body["data"];
      // convert (json to model) list
      allAppointments.value = (doctorList as List)
          .map((e) => GeneralAppointmentModel.fromJson(e))
          .toList();
      allAppointments.refresh();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    Get.context!.loaderOverlay.show();
    final role = await PrefsHelper.getString(PrefsKey.role);
    if (role == "DOCTOR") {
      await getDoctorrData();
      await getDoctorScores();
      await getAllDoctors();
      await getDoctorUpcomingAppointments();
      await getDoctorCompletedAppointments();
      await getDoctorAllAppointments();
      await Get.find<CommonController>().getAllSpecialty();
    }
    Get.context!.loaderOverlay.hide();
  }
}
