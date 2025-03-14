import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';

class DoctorWithdraw extends StatelessWidget {
  const DoctorWithdraw({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController bankNameController = TextEditingController();
    final TextEditingController accountTypeController = TextEditingController();
    final TextEditingController accountNumberController =
        TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            spacing: 12,
            children: [
              CustomAppBar(
                title: "Bank Account Details",
                hasPadding: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Text(
                  "Please provide the following information for the withdrawal",
                  style: TextStyle(
                    color: Color(0xff5C5C5C),
                  ),
                ),
              ),
              CustomTextInput(
                hintText: "Enter bank name...",
                title: "Bank Name",
                textController: bankNameController,
              ),
              CustomTextInput(
                hintText: "Enter Account type...",
                title: "Account Type",
                textController: accountTypeController,
              ),
              CustomTextInput(
                hintText: "Enter account number...",
                title: "Account Number",
                textController: accountNumberController,
              ),
              // CustomTextInput(
              //   hintText: "Bank name",
              //   title: "Bank Name",
              //   textController: bankNameController,
              // ),
              const Spacer(),
              CustomButton(onPressed: () {}, buttonTitle: "Withdraw"),
            ],
          ),
        ),
      ),
    );
  }
}
