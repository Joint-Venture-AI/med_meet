import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/components/my_custom_appbar.dart';
import 'package:med_meet_flutter/core/constants/image_assets.dart';

class ReviewAppointmentView extends StatelessWidget {
  const ReviewAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: "Review"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            SizedBox(
              height: 24,
            ),
            CircleAvatar(
              radius: 80,
              child: Image(image: AssetImage(ImageAssets.doctorImage2)),
            ),
            SizedBox(
              height: 16,
            ),
            FractionallySizedBox(
              widthFactor: 0.7,
              child: Text(
                "How was your experience with Dr. Drake Boeson?",
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
