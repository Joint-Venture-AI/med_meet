import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointments"),
        centerTitle: true,
        leading: Text(""),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabSelector(
                  isActive: selectedTab == "Upcoming",
                  tabTitle: "Upcoming",
                  onTabClick: () {
                    setState(() {
                      selectedTab = "Upcoming";
                    });
                  },
                ),
                TabSelector(
                  isActive: selectedTab == "Completed",
                  tabTitle: "Completed",
                  onTabClick: () {
                    setState(() {
                      selectedTab = "Completed";
                    });
                  },
                ),
              ],
            ),
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
