import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/controller/appointment_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/components/patient_information_card.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:med_meet_flutter/models/medication_details_model.dart';
import 'package:med_meet_flutter/views/appointments/user_records.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CreatePrescriptionView extends StatefulWidget {
  const CreatePrescriptionView({super.key});

  @override
  State<CreatePrescriptionView> createState() => _CreatePrescriptionViewState();
}

class _CreatePrescriptionViewState extends State<CreatePrescriptionView> {
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController medicineDosageController =
      TextEditingController();
  final TextEditingController medicineDurationController =
      TextEditingController();
  final TextEditingController medicineFrequencyController =
      TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  // modal to create medicines
  final List<MedicationDetailsModel> medicines = [];

  final AppointmentController appointmentController =
      Get.put(AppointmentController());

  @override
  void initState() {
    appointmentController.getMedicineSuggestions("am");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
            title: "Create Prescription",
            tailing: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(UserRecords());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.background1,
                    ),
                    child: Center(
                      child: Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: SvgPicture.asset("assets/svg/doc.svg")),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.notesScreen);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.background1,
                    ),
                    child: Center(
                      child: Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: SvgPicture.asset(SVGAssets.noteIcon)),
                    ),
                  ),
                ),
              ],
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Obx(() {
              final patient =
                  appointmentController.appointmentDetails.value.patientDetails;
              return PatientInformationCard(
                age: patient.age.toString(),
                firstName: patient.fullName,
                gender: patient.gender,
                problem: patient.problemDescription,
              );
            }),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Medication Details",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                InkWell(
                  onTap: addMedicine,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFF90A4AE),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Add",
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 22,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            if (medicines.isNotEmpty)
              Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border1),
                    borderRadius: BorderRadius.circular(12)),
                child: SizedBox(
                  height: (51 * medicines.length.toDouble()),
                  child: ListView.builder(
                    itemCount: medicines.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            medicines[index].name,
                            style: GoogleFonts.roboto(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildMeds(medicines[index].dose),
                                    buildMeds(medicines[index].duration),
                                    buildMeds(medicines[index].frequency),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {});
                                        medicines.removeAt(index);
                                      },
                                      child: Icon(
                                        Icons.delete_outline,
                                        color: Colors.red,
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          medicineNameController.text =
                                              medicines[index].name;
                                          medicineDosageController.text =
                                              medicines[index].dose;
                                          medicineDurationController.text =
                                              medicines[index].duration;
                                          medicineFrequencyController.text =
                                              medicines[index].frequency;

                                          addMedicine(
                                              index: index, isEdit: true);
                                        },
                                        child: SvgPicture.asset(
                                            SVGAssets.editIcon)),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            SizedBox(
              height: 24.h,
            ),
            CustomTextInput(
              hintText: "Write here",
              title: "Summary",
              textController: summaryController,
              maxLines: 6,
            ),
            SizedBox(
              height: 12,
            ),
            CustomButton(
                onPressed: () {
                  appointmentController.generatePDF(
                      medicines: medicines, summary: summaryController.text);
                },
                buttonTitle: "Send Prescription")
          ],
        ),
      ),
    );
  }

  void addMedicine({isEdit = false, index}) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled:
          true, // Enables dynamic expansion when keyboard appears
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // Adjust bottom padding for keyboard
          ),
          child: DraggableScrollableSheet(
            initialChildSize: 0.5, // Adjust initial size
            minChildSize: 0.4, // Minimum height of the bottom sheet
            maxChildSize: 0.9, // Allows it to expand up to 90% of the screen
            expand: false, // Prevents automatic full expansion
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min, // Makes it adjust dynamically
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 4,
                        width: 80,
                        color: Color(0xFFCCD5DA),
                      ),
                      SizedBox(height: 16),
                      SizedBox(height: 12),
                      // ====>>>>> Type ahead here <<<<========
                      TypeAheadField<String>(
                        suggestionsCallback: (search) => appointmentController
                            .getMedicineSuggestions(search),
                        builder: (context, controller, focusNode) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Medicines",
                                style: AppTypography.bodyText1,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.border1),
                                    borderRadius: BorderRadius.circular(25)),
                                child: TextField(
                                  controller: medicineNameController,
                                  focusNode: focusNode,
                                  autofocus: true,
                                  onChanged: (value) {
                                    controller.text =
                                        medicineNameController.text;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Medicine Name ...",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        itemBuilder: (context, medicine) {
                          return ListTile(
                            title: Text(medicine),
                          );
                        },
                        onSelected: (medicine) {
                          medicineNameController.text = medicine;
                        },
                      ),
                      CustomTextInput(
                        hintText: "Medicine Dosage",
                        title: "Medicine dose",
                        textController: medicineDosageController,
                      ),
                      SizedBox(height: 12),
                      CustomTextInput(
                        hintText: "Medicine Duration",
                        title: "Medicine duration",
                        textController: medicineDurationController,
                      ),
                      SizedBox(height: 12),
                      CustomTextInput(
                        hintText: "Medicine Frequency",
                        title: "Medicine frequency",
                        textController: medicineFrequencyController,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TabSelector(
                            isActive: false,
                            tabTitle: "Cancel",
                            onTabClick: () {
                              Get.back();
                            },
                          ),
                          TabSelector(
                            isActive: true,
                            tabTitle: "Okay",
                            onTabClick: () {
                              MedicationDetailsModel med =
                                  MedicationDetailsModel(
                                name: medicineNameController.text,
                                dose: medicineDosageController.text,
                                duration: medicineDurationController.text,
                                frequency: medicineFrequencyController.text,
                              );
                              if (isEdit) {
                                setState(() {
                                  medicines[index] = med;
                                });
                              } else {
                                setState(() {
                                  medicines.add(med);
                                });
                              }

                              Get.back();
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Container buildMeds(title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.border1),
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        title,
        style: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class TabSelector extends StatelessWidget {
  const TabSelector({
    super.key,
    required this.isActive,
    required this.tabTitle,
    required this.onTabClick,
  });
  final bool isActive;
  final String tabTitle;
  final VoidCallback onTabClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTabClick,
      child: Container(
        padding: EdgeInsets.all(10),
        width: 162.w,
        decoration: BoxDecoration(
            color: isActive ? Color(0xFF90A4AE) : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Color(0xFF90A4AE))),
        child: Center(
            child: Text(
          tabTitle,
          style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: isActive ? Colors.white : Colors.black),
        )),
      ),
    );
  }
}
