import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';

class TermsOfServices extends StatelessWidget {
  const TermsOfServices({super.key});

  @override
  Widget build(BuildContext context) {
    var text =
        "Lorem ipsum dolor sit amet consectetur. Enim massa aenean ac odio leo habitasse tortor tempor. Ut id urna odio dui leo congue. Ultrices pharetra ornare nam faucibus. Integer id varius consectetur non.";
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              CustomAppBar(
                title: "Terms of Services",
                hasPadding: false,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff545454),
                ),
              ),
              const SizedBox(height: 37),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff545454),
                ),
              ),
              const SizedBox(height: 37),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff545454),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
