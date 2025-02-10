import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/components/date_input.dart';
import 'package:med_meet_flutter/core/components/my_custom_appbar.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';

class BookCardDetailsView extends StatelessWidget {
  const BookCardDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController cardNumberController = TextEditingController();
    final TextEditingController ccvController = TextEditingController();
    final TextEditingController expiryDateController = TextEditingController();
    return Scaffold(
      appBar: customAppBar(title: "Card Details"),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            CustomTextInput(
              hintText: "Card Holder Name",
              textController: nameController,
              title: "Card Holder Name",
            ),
            SizedBox(height: 16),
            CustomTextInput(
              hintText: "Card Number",
              textController: cardNumberController,
              title: "Card Number",
            ),
            SizedBox(height: 16),
            DateInput(
                title: "Expiry Date",
                dateController: expiryDateController,
                icon: Icons.calendar_today,
                hintText: "Expiry Date"),
            SizedBox(height: 16),
            CustomTextInput(
              hintText: "CCV",
              textController: ccvController,
              title: "CCV",
            ),
            Spacer(),
            CustomButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.bookReviewSummary);
                },
                buttonTitle: "Continue")
          ],
        ),
      ),
    );
  }
}
