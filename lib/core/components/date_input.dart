import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';

class DateInput extends StatefulWidget {
  const DateInput(
      {super.key,
      required this.dateController,
      required this.icon,
      required this.hintText,
      this.title = ""});

  final TextEditingController dateController;
  final IconData icon;
  final String hintText;
  final String title;

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF333333),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.border1),
              borderRadius: BorderRadius.circular(24)),
          child: Row(
            children: [
              Flexible(
                // Text Field
                child: TextFormField(
                  controller: widget.dateController,
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Only allow digits
                  ],
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != _selectedDate) {
                      setState(() {
                        _selectedDate = picked;
                        widget.dateController.text =
                            DateFormat('yyyy-MM-dd').format(picked);
                      });
                    }
                  },
                  decoration: InputDecoration(
                      hintText: widget.hintText,
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Color(0xFF333333))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter your ${widget.hintText}";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Icon(
                widget.icon,
                color: AppColors.iconColor1,
                size: 14,
              ),
            ],
          ),
        )
      ],
    );
  }
}
