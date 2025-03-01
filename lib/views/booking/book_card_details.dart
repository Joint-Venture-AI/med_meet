import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/common_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_snack_bar.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/components/date_input.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/models/patient_details_model.dart';

class BookCardDetailsView extends StatelessWidget {
  BookCardDetailsView({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController ccvController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final CommonController commonController = Get.put(CommonController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(title: "Card Details")),
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
                  if (cardNumberController.text.isEmpty ||
                      nameController.text.isEmpty ||
                      ccvController.text.isEmpty ||
                      expiryDateController.text.isEmpty) {
                    // when the fields are empty
                    showCustomSnackBar("Please fill all the fields");
                  } else {
                    commonController.cardDetails.value = CardDetailsModel(
                        cardNumber: cardNumberController.text,
                        cardHolderName: nameController.text,
                        expiryDate: expiryDateController.text,
                        cvv: ccvController.text);
                    Get.toNamed(AppRoutes.bookReviewSummary);
                  }
                },
                buttonTitle: "Continue")
          ],
        ),
      ),
    );
  }
}
