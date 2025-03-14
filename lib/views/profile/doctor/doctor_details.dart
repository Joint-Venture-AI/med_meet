import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/controller/home_doctor_controller.dart';
import 'package:med_meet_flutter/controller/profile_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_drop_down.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController medicalLicenseNumberController =
      TextEditingController();
  final TextEditingController clinicNameController = TextEditingController();
  final TextEditingController clinicAddressController = TextEditingController();
  final TextEditingController consultationFeeController =
      TextEditingController();
  final TextEditingController aboutDoctorController = TextEditingController();
  final CommonController commonController = Get.put(CommonController());
  final Profilecontroller profilecontroller = Get.put(Profilecontroller());
  final HomeDoctorController homeDoctorController =
      Get.find<HomeDoctorController>();

  @override
  void initState() {
    commonController.getAllSpecialty();
    experienceController.text =
        homeDoctorController.doctorData.value.experience.toString();
    clinicNameController.text = homeDoctorController.doctorData.value.clinic;
    clinicAddressController.text =
        homeDoctorController.doctorData.value.clinicAddress;
    consultationFeeController.text =
        homeDoctorController.doctorData.value.consultationFee.toString();
    aboutDoctorController.text =
        homeDoctorController.doctorData.value.aboutDoctor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: "Doctor Details"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () {
                        return CustomDropDown(
                          title: "Specialist",
                          dropDownItems:
                              getDropDownItems(commonController.allSpecialty),
                          initialValue:
                              commonController.selectedSpecialty.value,
                          onChange: (String? newVal) {
                            commonController.selectedSpecialty.value = newVal!;
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Obx(() {
                      return CustomTextInput(
                        isPhone: true,
                        title: "Experience",
                        hintText: "Enter your experince",
                        textController: experienceController,
                      );
                    }),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Obx(() {
                      return CustomTextInput(
                        title: "Clinic Name",
                        hintText: "Enter your clinic name",
                        textController: clinicNameController,
                      );
                    }),
                    SizedBox(
                      height: 12,
                    ),
                    Obx(() {
                      return CustomTextInput(
                        title: "Clinic Address",
                        hintText: "Enter clinic address",
                        maxLines: 4,
                        textController: clinicAddressController,
                      );
                    }),
                    SizedBox(
                      height: 12,
                    ),
                    Obx(() {
                      return CustomTextInput(
                        title: "Set Consultation Fee",
                        isPhone: true,
                        hintText: "Add your fee",
                        textController: consultationFeeController,
                      );
                    }),
                    SizedBox(
                      height: 12,
                    ),
                    Obx(() {
                      return CustomTextInput(
                        title: "About Doctor",
                        hintText: "Write about yourself...",
                        maxLines: 4,
                        textController: aboutDoctorController,
                      );
                    }),
                    const SizedBox(
                      height: 48,
                    ),
                    CustomButton(
                      onPressed: () async {
                        await profilecontroller.updateProfile(
                          specialty: commonController.selectedSpecialty.value,
                          experience: experienceController.text,
                          medicalLicenseNumber:
                              medicalLicenseNumberController.text,
                          clinicName: clinicNameController.text,
                          clinicAddress: clinicAddressController.text,
                          consultationFee: consultationFeeController.text == ""
                              ? null
                              : int.parse(consultationFeeController.text),
                          aboutDoctor: aboutDoctorController.text,
                        );
                      },
                      buttonTitle: "Update Details",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
