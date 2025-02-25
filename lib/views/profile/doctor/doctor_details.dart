import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';

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

  
  @override
  void initState() async {
    await commonController.getAllSpecialty();
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
                    // CustomDropDown(
                    //   title: "Specialist",
                    //   dropDownItems: [
                    //     "Dentist",
                    //     "Immunologists",
                    //     "Cardiologists",
                    //     "Neurologist",
                    //     "Orthopedics",
                    //     "Therapist",
                    //     "Nutritionist",
                    //     "Gynecologic",
                    //   ],
                    // ),
                    SizedBox(
                      height: 12,
                    ),
                    CustomTextInput(
                      isPhone: true,
                      title: "Experience",
                      hintText: "Medical License Number",
                      textController: experienceController,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CustomTextInput(
                      title: "Medical License Number",
                      hintText: "Experience",
                      textController: medicalLicenseNumberController,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CustomTextInput(
                      title: "Clinic Name",
                      hintText: "Clinic Name",
                      textController: clinicNameController,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CustomTextInput(
                      title: "Clinic Address",
                      hintText: "Clinic Address",
                      maxLines: 4,
                      textController: clinicAddressController,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CustomTextInput(
                      title: "Set Consultation Fee",
                      isPhone: true,
                      hintText: "Set price",
                      textController: consultationFeeController,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CustomTextInput(
                      title: "About Doctor",
                      hintText: "About doctor",
                      maxLines: 4,
                      textController: aboutDoctorController,
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    CustomButton(
                      onPressed: () {},
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
