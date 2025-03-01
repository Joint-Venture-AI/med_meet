import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/controller/home_doctor_controller.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/models/general_appointment_model.dart';

class DoctorAppointmentsScreenView extends StatefulWidget {
  const DoctorAppointmentsScreenView({super.key});

  @override
  State<DoctorAppointmentsScreenView> createState() =>
      _DoctorAppointmentsScreenViewState();
}

class _DoctorAppointmentsScreenViewState
    extends State<DoctorAppointmentsScreenView> {
  String selectedTab = "Completed";
  HomeDoctorController homeDoctorController = Get.find<HomeDoctorController>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          title: Text("Appointments"),
          centerTitle: true,
          leading: Text(""),
          bottom: TabBar(
            indicator: BoxDecoration(
              color: Color(0xFF90A4AE),
              border: Border.all(color: AppColors.border1),
              borderRadius: BorderRadius.circular(30),
            ),
            labelColor: Colors.white,
            dividerHeight: 0,
            splashFactory: NoSplash.splashFactory,
            tabs: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 11),
                decoration: BoxDecoration(
                  // border: Border.all(color: AppColors.border1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Upcomming",
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 11),
                decoration: BoxDecoration(
                  // border: Border.all(color: AppColors.border1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Completed",
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Obx(() {
          final upcomming = homeDoctorController.upcomingAppointments;
          final completed = homeDoctorController.completedAppointments;
          return TabBarView(children: <Widget>[
            buildBody(appointments: upcomming),
            buildBody(appointments: completed),
          ]);
        }),
      ),
    );
  }

  Padding buildBody({required List<GeneralAppointmentModel> appointments}) {
    if (appointments.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text("No Appointments"),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  final data = appointments[index];
                  return DoctorCard(
                    // ui specific configurations
                    isAppointment: true,
                    hasPrice: true,
                    // apponitment: data,
                    id: data.id,
                    name: data.name,
                    time: "${data.startTime} - ${data.endTime}",
                    date: data.date.toString(),
                    image: data.image,
                  );
                },
              ),
            )
          ],
        ),
      );
    }
  }
}
