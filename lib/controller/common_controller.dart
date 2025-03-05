// ignore_for_file: unused_local_variable, invalid_use_of_protected_member

import 'dart:convert';

import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/controller/appointment_controller.dart';
import 'package:med_meet_flutter/controller/home_user_controller.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_snack_bar.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/helpers/pref_helper.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/models/medical_record_model.dart';
import 'package:med_meet_flutter/models/patient_details_model.dart';
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
  RxString selectedGender = "Male".obs;

  // stores the available time slots of a given doctor with id
  RxList<TimeSlotModel> availableSlots = <TimeSlotModel>[].obs;

  // stores the timestring from selected slots for user
  Rx<TimeSlotModel> selectedTimeSlot = TimeSlotModel().obs;

  // Stored the scedule id of the day
  RxString scheduleID = "".obs;
  // Stored the Date of the day
  RxString scheduledate = "".obs;

  // stores the Multiple selected timeslots for doctor schedule
  RxList<TimeSlotModel> selectedTimeslots = <TimeSlotModel>[].obs;

// Holds the patient details for the appointment
  Rx<PatientDetailsModel> patientDetails = PatientDetailsModel(
    age: 0,
    dob: "",
    gender: "",
    images: [],
    name: "",
    problem: "",
  ).obs;

  Rx<CardDetailsModel> cardDetails = CardDetailsModel(
          cardNumber: "", cardHolderName: "", expiryDate: "", cvv: "")
      .obs;

  //to force the only select one date
  RxString doctorScheduleDate = "".obs;

  // select and store a file in the variable
  RxString pickedFilePath = "".obs;
  RxString pickedFileName = "".obs;

  // hold remote pdf
  Rx<PDFDocument?> document = Rx<PDFDocument?>(null);

  // Fetches PDF from url and stores it in the variable
  Future getPdforPreview({fileUrl}) async {
    debugPrint('=====>>>>> PDF URL ===>> $fileUrl');
    Get.context!.loaderOverlay.show();
    document.value = await PDFDocument.fromURL(fileUrl);
    Get.context!.loaderOverlay.hide();
  }

  // Function to select file and store the path
  Future pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
      ],
    );

    if (result != null) {
      pickedFilePath.value = result.files.single.path!;
      pickedFileName.value = result.files.single.name;
    }
  }

  RxList<MedicalRecordModel> medicalRecords = <MedicalRecordModel>[].obs;

  Future getAllMedicalRecords(userID) async {
    Get.context!.loaderOverlay.show();
    Response response =
        await ApiClient.getData(ApiConstants.getAlMedicalRecords(userID));
    Get.context!.loaderOverlay.hide();
    ApiChecker.checkApi(response);
    if (response.statusCode == 200 || response.statusCode == 201) {
      medicalRecords.value = (response.body["data"] as List)
          .map((el) => MedicalRecordModel.fromJson(el))
          .toList();
    } else {
      medicalRecords.value = [];
    }
  }

  // Create schedule for a day

  Future createDoctorSchedule() async {
    if (doctorScheduleDate.value.isEmpty) {
      showCustomSnackBar("select a date");
    }
    if (selectedTimeslots.value.isEmpty) {
      showCustomSnackBar("select atleast one slot");
    }
    if (selectedTimeslots.value.isEmpty || doctorScheduleDate.value.isEmpty) {
      return;
    }
    final doctorID = await PrefsHelper.getString(PrefsKey.accountID);
    final slots = selectedTimeslots
        .map((el) => {"startTime": el.startTime, "endTime": el.endTime})
        .toList();
    final body = {
      "doctorId": doctorID,
      "date": doctorScheduleDate.value,
      "slots": slots
    };
    Response response = await ApiClient.postData(
        ApiConstants.doctorSetSchedule, jsonEncode(body));
    if (response.statusCode == 200) {
      showCustomSnackBar(response.body["message"]);
      Get.back();
    } else {
      ApiChecker.checkApi(response);
    }
  }

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

  Future confirmAppointment() async {
    // Getting the necassary data
    final doctorId = Get.find<UserHomeController>().singleDoctorData.value.id;
    final userId = await PrefsHelper.getString(PrefsKey.accountID);

    final slot = {
      "startTime": selectedTimeSlot.value.startTime,
      "endTime": selectedTimeSlot.value.endTime
    };

    final patientDetailsBody = {
      "fullName": patientDetails.value.name,
      "gender": patientDetails.value.gender,
      "age": patientDetails.value.age,
      "problemDescription": patientDetails.value.problem
    };
    // converting type file to type Multipart body
    List<MultipartBody> problemImages = patientDetails.value.images
        .map((el) => MultipartBody("image", el))
        .toList();

    // Preaparing data to be jsonEncoded
    final data = {
      "doctor": doctorId,
      "user": userId,
      "schedule": scheduleID.value,
      "slot": slot,
      "patientDetails": patientDetailsBody
    };
    final body = {"data": jsonEncode(data)};

    Get.context!.loaderOverlay.show();
    Response response = await ApiClient.postMultipartData(
        ApiConstants.bookAppointment, body,
        multipartBody: problemImages);
    Get.context!.loaderOverlay.hide();
    if (response.statusCode == 200) {
      confirmAppointmentDialog();
      await Get.find<AppointmentController>().getAllAppointments();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  // Get the list of specialization catergories EXP: Nutrotionists, cardialogists
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
      selectedTimeSlot.value = TimeSlotModel();
      selectedTimeslots.clear();
      if (slots != null) {
        availableSlots.value = (slots["slots"] as List)
            .map((e) => TimeSlotModel.fromJson(e))
            .toList();
        // setting the schedule date and schedule ID
        scheduleID.value = slots["schedule"];
        scheduledate.value = slots["date"];
      } else {
        availableSlots.value = [];
        showCustomSnackBar("No Available Slots", isError: false);
      }
    } else {
      ApiChecker.checkApi(response);
    }
  }

  RxList<TimeSlotModel> fixedSchedules = <TimeSlotModel>[
    TimeSlotModel(startTime: "00:00", endTime: "00:30"),
    TimeSlotModel(startTime: "00:30", endTime: "01:00"),
    TimeSlotModel(startTime: "01:00", endTime: "01:30"),
    TimeSlotModel(startTime: "01:30", endTime: "02:00"),
    TimeSlotModel(startTime: "02:00", endTime: "02:30"),
    TimeSlotModel(startTime: "02:30", endTime: "03:00"),
    TimeSlotModel(startTime: "03:00", endTime: "03:30"),
    TimeSlotModel(startTime: "03:30", endTime: "04:00"),
    TimeSlotModel(startTime: "04:00", endTime: "04:30"),
    TimeSlotModel(startTime: "04:30", endTime: "05:00"),
    TimeSlotModel(startTime: "05:00", endTime: "05:30"),
    TimeSlotModel(startTime: "05:30", endTime: "06:00"),
    TimeSlotModel(startTime: "06:00", endTime: "06:30"),
    TimeSlotModel(startTime: "06:30", endTime: "07:00"),
    TimeSlotModel(startTime: "07:00", endTime: "07:30"),
    TimeSlotModel(startTime: "07:30", endTime: "08:00"),
    TimeSlotModel(startTime: "08:00", endTime: "08:30"),
    TimeSlotModel(startTime: "08:30", endTime: "09:00"),
    TimeSlotModel(startTime: "09:00", endTime: "09:30"),
    TimeSlotModel(startTime: "09:30", endTime: "10:00"),
    TimeSlotModel(startTime: "10:00", endTime: "10:30"),
    TimeSlotModel(startTime: "10:30", endTime: "11:00"),
    TimeSlotModel(startTime: "11:00", endTime: "11:30"),
    TimeSlotModel(startTime: "11:30", endTime: "12:00"),
    TimeSlotModel(startTime: "12:00", endTime: "12:30"),
    TimeSlotModel(startTime: "12:30", endTime: "13:00"),
    TimeSlotModel(startTime: "13:00", endTime: "13:30"),
    TimeSlotModel(startTime: "13:30", endTime: "14:00"),
    TimeSlotModel(startTime: "14:00", endTime: "14:30"),
    TimeSlotModel(startTime: "14:30", endTime: "15:00"),
    TimeSlotModel(startTime: "15:00", endTime: "15:30"),
    TimeSlotModel(startTime: "15:30", endTime: "16:00"),
    TimeSlotModel(startTime: "16:00", endTime: "16:30"),
    TimeSlotModel(startTime: "16:30", endTime: "17:00"),
    TimeSlotModel(startTime: "17:00", endTime: "17:30"),
    TimeSlotModel(startTime: "17:30", endTime: "18:00"),
    TimeSlotModel(startTime: "18:00", endTime: "18:30"),
    TimeSlotModel(startTime: "18:30", endTime: "19:00"),
    TimeSlotModel(startTime: "19:00", endTime: "19:30"),
    TimeSlotModel(startTime: "19:30", endTime: "20:00"),
    TimeSlotModel(startTime: "20:00", endTime: "20:30"),
    TimeSlotModel(startTime: "20:30", endTime: "21:00"),
    TimeSlotModel(startTime: "21:00", endTime: "21:30"),
    TimeSlotModel(startTime: "21:30", endTime: "22:00"),
    TimeSlotModel(startTime: "22:00", endTime: "22:30"),
    TimeSlotModel(startTime: "22:30", endTime: "23:00"),
    TimeSlotModel(startTime: "23:00", endTime: "23:30"),
    TimeSlotModel(startTime: "23:30", endTime: "00:00"),
  ].obs;

  void confirmAppointmentDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: Container(
            height: 470,
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.border1,
              ),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              children: [
                SvgPicture.asset(SVGAssets.confirmAppointmentIcon),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "Congratulations!",
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF333333)),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Appointment successfully booked. You will receive a notification and the doctor you selected will contact you.",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Color(0xFF8A8A8A),
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 32,
                ),
                CustomButton(
                    onPressed: () {
                      Get.until((route) =>
                          (Get.currentRoute == AppRoutes.userApp ||
                              Get.currentRoute == AppRoutes.doctorApp));
                    },
                    buttonTitle: "Go to Home")
              ],
            ),
          ),
        );
      },
    );
  }
}
