import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/specialty_card.dart';
import 'package:med_meet_flutter/core/constants/svg_assets.dart';

class SpecialtyUserView extends StatelessWidget {
  const SpecialtyUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomAppBar(title: "Specialty")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Wrap(
          spacing: 40.w,
          runSpacing: 10.h,
          children: [
            buildSpecialist(title: "Dentist", assetPath: SVGAssets.dentist),
            buildSpecialist(
                title: "Nutrition", assetPath: SVGAssets.nutritionist),
            buildSpecialist(
                title: "Eye Spe..", assetPath: SVGAssets.eyeSpecialist),
            buildSpecialist(
                title: "Cardilog..", assetPath: SVGAssets.cardiacSpecialist),
            buildSpecialist(title: "Stomach", assetPath: SVGAssets.stomach),
            buildSpecialist(title: "Kidney", assetPath: SVGAssets.kidney),
            buildSpecialist(title: "Bone", assetPath: SVGAssets.bone),
            buildSpecialist(title: "Padiatric", assetPath: SVGAssets.pediatric),
            buildSpecialist(title: "General", assetPath: SVGAssets.general),
          ],
        ),
      ),
    );
  }
}
