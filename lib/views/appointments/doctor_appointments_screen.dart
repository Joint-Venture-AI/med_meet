import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';

class DoctorAppointmentsScreenView extends StatefulWidget {
  const DoctorAppointmentsScreenView({super.key});

  @override
  State<DoctorAppointmentsScreenView> createState() =>
      _DoctorAppointmentsScreenViewState();
}

class _DoctorAppointmentsScreenViewState
    extends State<DoctorAppointmentsScreenView> {
  String selectedTab = "Completed";
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
              color: Color(0xFF545454),
              borderRadius: BorderRadius.circular(30),
            ),
            labelColor: Colors.white,
            tabs: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 11),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border1),
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
                  border: Border.all(color: AppColors.border1),
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
        body: TabBarView(children: <Widget>[
          buildBody(),
          buildBody(),
        ]),
      ),
    );
  }

  Padding buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView(
              children: [
                DoctorCard(
                  isAppointment: true,
                  hasPrice: true,
                ),
                DoctorCard(
                  isAppointment: true,
                  hasPrice: true,
                ),
                DoctorCard(
                  isAppointment: true,
                  hasPrice: true,
                ),
                DoctorCard(
                  isAppointment: true,
                  hasPrice: true,
                ),
                DoctorCard(
                  isAppointment: true,
                  hasPrice: true,
                ),
                DoctorCard(
                  isAppointment: true,
                  hasPrice: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
