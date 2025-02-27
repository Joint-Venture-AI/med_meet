import 'package:get/get.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';
import 'package:med_meet_flutter/models/time_slot_model.dart';
import 'package:med_meet_flutter/services/api_checker.dart';
import 'package:med_meet_flutter/services/api_client.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CommonController extends GetxController {
  // values for specialty dropdown
  var allSpecialty = [].obs;
  // Specialty Dropdown selected value
  RxString selectedSpecialty = "".obs;

  // For Gender Selection Dropdown
  List<Map<String, String>> genders = [
    {"title": "Male", "val": "Male"},
    {"title": "Female", "val": "Female"}
  ];

  // the variable to store the gender
  Rx<String> selectedGender = "Male".obs;

  // stores the available time slots of a given doctor with id
  RxList<TimeSlotModel> availableSlots = <TimeSlotModel>[].obs;

  // stores the timestring from selected slots
  RxString selectedTimeSlot = "".obs;

  // methodn to set the gender
  void setSelectedGender(String gender) {
    selectedGender.value = gender;
    update();
  }

  // Function to setSelected Specialty
  void setSelectedSpecialty(String specialty) {
    selectedSpecialty.value = specialty;
    update();
  }

  Future getAllSpecialty() async {
    Response response = await ApiClient.getData(ApiConstants.getAllSpecialty);

    if (response.statusCode == 200) {
      final data = response.body;
      final decodedData = data["data"];

      allSpecialty.value = decodedData;
      selectedSpecialty.value = decodedData[0]["_id"];
      allSpecialty.refresh();
      update();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  // Fetch Available Timeslots for a given Doctor
  Future getAvailaleTimeSlots(doctorID, date) async {
    Get.context!.loaderOverlay.show();
    Response response = await ApiClient.getData(
        ApiConstants.userGetAvailableTimeslots(doctorID, date));
    Get.context!.loaderOverlay.hide();
    if (response.statusCode == 200) {
      final body = response.body;
      final slots = body["data"];
      if (slots != null) {
        availableSlots.value = (slots["slots"] as List)
            .map((e) => TimeSlotModel.fromJson(e))
            .toList();
      }
    } else {
      ApiChecker.checkApi(response);
    }
  }
}
