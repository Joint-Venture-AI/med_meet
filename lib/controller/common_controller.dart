import 'package:get/get.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';
import 'package:med_meet_flutter/services/api_checker.dart';
import 'package:med_meet_flutter/services/api_client.dart';

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
  Rx<String> selectedGender = "Male".obs;
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
}
