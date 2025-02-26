import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';
import 'package:med_meet_flutter/models/Auth/user_model.dart';
import 'package:med_meet_flutter/models/single_doctor_model.dart';
import 'package:med_meet_flutter/services/api_checker.dart';
import 'package:med_meet_flutter/services/api_client.dart';

class UserHomeController extends GetxController {
  Rx<UserModel> userData = UserModel().obs;
  Rx<SingleDoctorModel> singleDoctorData = SingleDoctorModel().obs;
  RxList<SpecialistModel> specialtyList = <SpecialistModel>[].obs;
  RxList<SingleDoctorModel> allSpecialistDoctors = <SingleDoctorModel>[].obs;
  RxList<SingleDoctorModel> allDoctors = <SingleDoctorModel>[].obs;
  RxList<SingleDoctorModel> filteredDoctors = <SingleDoctorModel>[].obs;
  final TextEditingController searchController = TextEditingController();

  void filterDoctors(String query) {
    if (query.isEmpty) {
      filteredDoctors.value = allDoctors;
      filteredDoctors.refresh();
      return;
    }
    final filtered = allDoctors.where((doctor) {
      final doctorName = doctor.name.toLowerCase();
      final searchQuery = query.toLowerCase();
      return doctorName.contains(searchQuery);
    }).toList();
    filteredDoctors.value = filtered;
    filteredDoctors.refresh();
  }

  // fetch user data
  Future getUserData() async {
    // Fetching User Data
    Response response = await ApiClient.getData(ApiConstants.userGetProfile);

    if (response.statusCode == 200) {
      // loading user data in memory
      userData.value = UserModel.fromJson(response.body["data"]);
    } else {
      ApiChecker.checkApi(response);
    }
  }

// Fetch doctor specialty list
  Future getSpecialtistLists() async {
    Response response = await ApiClient.getData(ApiConstants.getAllSpecialty);
    if (response.statusCode == 200) {
      // load the specialty list
      specialtyList.value = (response.body['data'] as List)
          .map((e) => SpecialistModel.fromJson(e))
          .toList();
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

  Future getSpecialistDoctor(specialistID) async {
    Get.context!.loaderOverlay.show();
    Response response = await ApiClient.getData(
        ApiConstants.getSpecialistDoctors(specialistID));
    Get.context!.loaderOverlay.hide();
    if (response.statusCode == 200) {
      // get the list of specialist doctors
      final body = response.body;
      final doctorList = body["data"];
      // convert (json to model) list
      allSpecialistDoctors.value = (doctorList as List)
          .map((e) => SingleDoctorModel.fromJson(e))
          .toList();
      allSpecialistDoctors.refresh();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  @override
  void onInit() async {
    Get.context!.loaderOverlay.show();
    super.onInit();
    await getUserData();
    await getSpecialtistLists();
    await getAllDoctors();
    filteredDoctors.value = allDoctors;
    Get.context!.loaderOverlay.hide();
  }
}
