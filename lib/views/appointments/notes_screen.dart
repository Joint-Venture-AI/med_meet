import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';

class NotesScreenView extends StatelessWidget {
  const NotesScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(title: "Notes"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            TextField(
              expands: true,
              maxLines: null,
              decoration: InputDecoration(
                  hintText: "Note something down", border: InputBorder.none),
            ),
            Positioned(
                bottom: 20,
                child: CustomButton(
                    onPressed: () {
                      Get.back();
                    },
                    buttonTitle: "Save"))
          ],
        ),
      ),
    );
  }
}
