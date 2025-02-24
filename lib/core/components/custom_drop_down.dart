import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {super.key,
      required this.title,
      required this.dropDownItems,
      this.isExpanded = true,
      this.padding = const EdgeInsets.symmetric(horizontal: 24),
      required this.initialValue,
      required this.onChange});

  final String title;
  final List<Map<String, String>> dropDownItems;
  final EdgeInsets padding;
  final bool isExpanded;
  final String initialValue;
  final Function(String?) onChange;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: AppTypography.bodyText1Black),
        SizedBox(
          height: 8,
        ),
        Container(
          padding: widget.padding,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border1),
            borderRadius: BorderRadius.circular(35),
          ),
          child: DropdownButton<String>(
            value: widget.initialValue, // Current selected value
            icon: const Icon(Icons.keyboard_arrow_down), // Dropdown arrow icon
            isExpanded: widget.isExpanded,
            padding: EdgeInsets.zero,
            elevation: 16, // Elevation of the dropdown menu
            style: AppTypography.bodyText1, // Text style
            underline: Container(),
            onChanged: widget.onChange,
            items: widget.dropDownItems.map((Map<String, String> value) {
              return DropdownMenuItem<String>(
                value: value["val"],
                child: Text(value["title"]!),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
