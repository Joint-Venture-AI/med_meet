import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';

class PrescriptionNote extends StatelessWidget {
  const PrescriptionNote({super.key, required this.note});
  final String note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(title: "Note"),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          note,
          style: GoogleFonts.roboto(fontSize: 18, ),
        ),
      ),
    );
  }
}
