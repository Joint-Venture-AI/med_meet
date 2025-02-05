import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTypography.appbarTitle,
        ),
        TextButton(
            onPressed: onTap,
            child: Text(
              "See all",
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                color: Color(0xFF1E65FF),
              ),
            ))
      ],
    );
  }
}
