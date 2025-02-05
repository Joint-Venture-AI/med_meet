import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/components/doctor_card.dart';

class DoctorsListUserView extends StatelessWidget {
  const DoctorsListUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            CustomTextInput(
              title: "Search",
              hintText: "Search",
              icon: Icons.search,
              renderTitle: false,
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return DoctorCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
