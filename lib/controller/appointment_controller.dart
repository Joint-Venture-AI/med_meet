import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:med_meet_flutter/core/components/custom_snack_bar.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';
import 'package:med_meet_flutter/core/helpers/pref_helper.dart';
import 'package:med_meet_flutter/models/detailed_appointment_model.dart';
import 'package:med_meet_flutter/models/general_appointment_model.dart';
import 'package:med_meet_flutter/services/api_checker.dart';
import 'package:med_meet_flutter/services/api_client.dart';
import 'package:med_meet_flutter/views/appointments/prespriction_preview.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:path_provider/path_provider.dart';

class AppointmentController extends GetxController {
  final TextEditingController noteController = TextEditingController();

  // User End Appointment List
  RxList<GeneralAppointmentModel> userAppointmentList =
      <GeneralAppointmentModel>[].obs;

  // User End Appointment Details
  Rx<DetailedAppointmentModel> appointmentDetails =
      DetailedAppointmentModel().obs;
  // holds rating for appointment completion on users end
  RxDouble userAppointmentrating = 0.0.obs;

  Future updateAppointmentStatus() async {
    final body = {"status": "Completed"};
    final id = appointmentDetails.value.id;
    Get.context!.loaderOverlay.show();
    Response response = await ApiClient.postData(
        ApiConstants.updateAppointmentStatus(id), jsonEncode(body));
    Get.context!.loaderOverlay.hide();
    ApiChecker.checkApi(response);
    if (response.statusCode == 200 || response.statusCode == 201) {
      await getAppointmentDetails(id);
    }
  }

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
    } else {
      noteController.text = appointmentDetails.value.doctorNote;
    }
  }

  @override
  void onClose() {
    noteController.dispose();
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
    final body = {"rating": ratting, "review": review};
    Get.context!.loaderOverlay.show();
    Response response = await ApiClient.postData(
        ApiConstants.userPostReview(appointmentID), jsonEncode(body));
    Get.context!.loaderOverlay.hide();
    if (response.statusCode == 200) {
      showCustomSnackBar(response.body["message"], isError: false);
      await getAllAppointments();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  // Create and update notes on appointments
  Future createNotes({isNoteHidden}) async {
    final body = {"note": noteController.text, 'isNoteHidden': isNoteHidden};
    Get.context!.loaderOverlay.show();
    Response response = await ApiClient.postData(
        ApiConstants.doctorAddNotes(appointmentDetails.value.id),
        jsonEncode(body));
    Get.context!.loaderOverlay.hide();

    if (response.statusCode == 200) {
      showCustomSnackBar(response.body['message'], isError: false);
      await getAppointmentDetails(appointmentDetails.value.id);
    } else {
      ApiChecker.checkApi(response);
    }
  }

  // Get medicine suggestions
  Future<List<String>> getMedicineSuggestions(searchTerm) async {
    Response response =
        await ApiClient.getData(ApiConstants.getMedicineSuggestion(searchTerm));
    if (response.statusCode == 200) {
      final medicines = (response.body["data"] as List)
          .map((el) => el["name"].toString())
          .toList();
      return medicines;
    } else {
      ApiChecker.checkApi(response);
      return [];
    }
  }

  var pdf = pw.Document();

  Future previewPdf({medicines, summary}) async {
    Get.context!.loaderOverlay.show();
    Directory? directory = await getApplicationDocumentsDirectory();
    if (await directory.exists()) {
      final file = File("${directory.path}/prescription.pdf");
      if (await file.exists()) {
        await file.delete();
      }
      await file.writeAsBytes(await pdf.save());
      Get.context!.loaderOverlay.hide();
      await sendPrescription(file);
      await updateAppointmentStatus();
      Get.to(
        () => PresprictionPreview(
          pdfPath: file.path,
        ),
      );
    } else {
      showCustomSnackBar("PDF Preview Failed");
    }
  }

  Future sendPrescription(file) async {
    List<MultipartBody> prescription = [MultipartBody("doc", file)];
    Response response = await ApiClient.postMultipartData(
        ApiConstants.sendPrescription(appointmentDetails.value.id), {},
        multipartBody: prescription);
    if (response.statusCode == 200) {
      showCustomSnackBar("Prescription Sent", isError: false);
    } else {
      ApiChecker.checkApi(response);
    }
  }

  Future downloadPDf() async {
    Get.context!.loaderOverlay.show();
    final file = File(await returnPdfPath());
    await file.writeAsBytes(await pdf.save());
    Get.context!.loaderOverlay.hide();
    showCustomSnackBar("Download Complete", isError: false);
  }

  Future<String> returnPdfPath() async {
    final String timestamp =
        DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    Directory? directory = Directory('/storage/emulated/0/Download');
    if (!await directory.exists()) {
      directory = await getExternalStorageDirectory();
    }
    final path = "${directory!.path}/prescription-$timestamp.pdf";
    return path;
  }

  Future generatePDF({medicines, summary}) async {
    pdf = pw.Document();
    Get.context!.loaderOverlay.show();

    final doctor = appointmentDetails.value.doctor;
    final patient = appointmentDetails.value.patientDetails;
    final appDate = appointmentDetails.value.date;

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                doctor.name,
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColor.fromHex('#333333'),
                ),
              ),
              pw.Text(
                doctor.specialist,
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColor.fromHex('#383838'),
                ),
              ),
              pw.SizedBox(height: 16),
              pw.Row(
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        doctor.clinic,
                        style: pw.TextStyle(
                          fontSize: 14,
                          color: PdfColor.fromHex('#333333'),
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        doctor.clinicAddress,
                        style: pw.TextStyle(
                          fontSize: 14,
                          color: PdfColor.fromHex('#333333'),
                        ),
                      ),
                    ],
                  ),
                  pw.Spacer(),
                  pw.Text(
                    "Slot: ${appointmentDetails.value.startTime} - ${appointmentDetails.value.endTime}",
                    style: pw.TextStyle(
                      fontSize: 14,
                      color: PdfColor.fromHex('#545454'),
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 32),
              pw.Container(
                height: 1,
                width: double.infinity,
                color: PdfColor.fromHex("#DDDEE0"),
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                children: [
                  pw.Text(
                    "Patient Name: ",
                    style: pw.TextStyle(
                      color: PdfColor.fromHex("#333333"),
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Container(
                      height: 16,
                      width: double.infinity,
                      decoration: pw.BoxDecoration(
                        border: pw.Border(
                          bottom: pw.BorderSide(
                            color: PdfColor.fromHex("#B0B0B0"),
                          ),
                        ),
                      ),
                      child: pw.Center(
                        child: pw.Text(
                          patient.fullName,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              pw.SizedBox(
                height: 16,
              ),
              pw.Row(
                children: [
                  pw.Text(
                    "Sex: ",
                    style: pw.TextStyle(
                      color: PdfColor.fromHex("#333333"),
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Container(
                      height: 16,
                      width: double.infinity,
                      decoration: pw.BoxDecoration(
                        border: pw.Border(
                          bottom: pw.BorderSide(
                            color: PdfColor.fromHex("#B0B0B0"),
                          ),
                        ),
                      ),
                      child: pw.Center(
                        child: pw.Text(patient.gender),
                      ),
                    ),
                  ),
                  pw.Text(
                    "Age: ",
                    style: pw.TextStyle(
                      color: PdfColor.fromHex("#333333"),
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Container(
                      height: 16,
                      width: double.infinity,
                      decoration: pw.BoxDecoration(
                        border: pw.Border(
                          bottom: pw.BorderSide(
                            color: PdfColor.fromHex("#B0B0B0"),
                          ),
                        ),
                      ),
                      child: pw.Center(
                        child: pw.Text(patient.age.toString()),
                      ),
                    ),
                  ),
                  pw.Text(
                    "Date: ",
                    style: pw.TextStyle(
                      color: PdfColor.fromHex("#333333"),
                    ),
                  ),
                  pw.Expanded(
                    flex: 2,
                    child: pw.Container(
                      height: 16,
                      width: double.infinity,
                      decoration: pw.BoxDecoration(
                        border: pw.Border(
                          bottom: pw.BorderSide(
                            color: PdfColor.fromHex("#B0B0B0"),
                          ),
                        ),
                      ),
                      child: pw.Center(
                        child: pw.Text(
                          DateFormat("dd MMMM yyyy").format(
                            DateTime.parse(appDate.toString()),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              pw.SizedBox(
                height: 24,
              ),
              pw.Text(
                "Rx",
                style: pw.TextStyle(
                  fontSize: 32,
                  color: PdfColor.fromHex("#333333"),
                ),
              ),
              pw.SizedBox(
                height: 20,
              ),
              if (medicines.isNotEmpty)
                pw.Container(
                  padding:
                      pw.EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  decoration: pw.BoxDecoration(),
                  child: pw.Column(
                    children: (medicines as List)
                        .asMap()
                        .map(
                          (index, el) {
                            return MapEntry(
                              index,
                              pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "${index + 1}. ${medicines[index].name}",
                                    style: pw.TextStyle(
                                        fontSize: 12,
                                        fontWeight: pw.FontWeight.normal),
                                  ),
                                  pw.SizedBox(height: 12),
                                  pw.Row(
                                    mainAxisSize: pw.MainAxisSize.max,
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.SizedBox(
                                        width: 8,
                                      ),
                                      pw.Expanded(
                                        child: pw.Row(
                                          mainAxisSize: pw.MainAxisSize.max,
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.spaceBetween,
                                          children: [
                                            buildMeds(medicines[index].dose),
                                            buildMeds(
                                                medicines[index].duration),
                                            buildMeds(
                                                medicines[index].frequency),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  pw.SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            );
                          },
                        )
                        .values
                        .toList(),
                  ),
                ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Text(
                "Summary",
                style: pw.TextStyle(
                  fontSize: 12,
                  fontWeight: pw.FontWeight.normal,
                  color: PdfColor.fromHex("#000000"),
                ),
              ),
              pw.SizedBox(
                height: 14,
              ),
              pw.Text(
                summary,
                style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.normal,
                    color: PdfColor.fromHex("#545454")),
              ),
              pw.SizedBox(
                height: 56,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Column(
                    children: [
                      pw.Container(
                        width: 148,
                        height: 1,
                        color: PdfColor.fromHex("#B0B0B0"),
                      ),
                      pw.Text(
                        "Signature",
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 30),
            ],
          );
        },
      ),
    ); // Page

    Get.context!.loaderOverlay.hide();
    previewPdf(medicines: medicines, summary: summary);
  }

  pw.Widget buildMeds(title) {
    return pw.Container(
      padding: pw.EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: pw.BoxDecoration(
          border: pw.Border.all(color: PdfColor.fromHex("#DDDEE0")),
          borderRadius: pw.BorderRadius.circular(12)),
      child: pw.Text(
        title,
        style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.normal),
      ),
    );
  }
}
