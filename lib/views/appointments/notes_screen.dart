import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/appointment_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';

class NotesScreenView extends StatefulWidget {
  const NotesScreenView({super.key});

  @override
  State<NotesScreenView> createState() => _NotesScreenViewState();
}

class _NotesScreenViewState extends State<NotesScreenView> {
  var _isPrivate = true;
  final AppointmentController appointmentController =
      Get.find<AppointmentController>();

  @override
  void initState() {
    appointmentController.noteController.text =
        appointmentController.appointmentDetails.value.doctorNote;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(title: "Notes"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            RadioListTile(
                title: Text("Private"),
                value: true,
                groupValue: _isPrivate,
                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (value) {
                  setState(() {
                    _isPrivate = value!;
                  });
                }),
            RadioListTile(
                title: Text("Public"),
                value: false,
                groupValue: _isPrivate,
                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (value) {
                  setState(() {
                    _isPrivate = value!;
                  });
                }),
            Expanded(
              child: TextField(
                controller: appointmentController.noteController,
                decoration: InputDecoration(
                    hintText: "Note something down.....",
                    border: InputBorder.none),
              ),
            ),
            CustomButton(
                onPressed: () {
                  appointmentController.createNotes(isNoteHidden: _isPrivate);
                },
                buttonTitle: "Save"),
          ],
        ),
      ),
    );
  }
}
