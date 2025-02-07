import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/my_custom_appbar.dart';

class NotesScreenView extends StatelessWidget {
  const NotesScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Notes",
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
