import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.title,
    required this.dropDownItems,
    this.isExpanded = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
  });

  final String title;
  final List<String> dropDownItems;
  final EdgeInsets padding;
  final bool isExpanded;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.dropDownItems.first;
  }

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
            border: Border.all(color: AppColor.border1),
            borderRadius: BorderRadius.circular(35),
          ),
          child: DropdownButton<String>(
            value: selectedValue, // Current selected value
            icon: const Icon(Icons.keyboard_arrow_down), // Dropdown arrow icon
            isExpanded: widget.isExpanded,
            padding: EdgeInsets.zero,
            elevation: 16, // Elevation of the dropdown menu
            style: AppTypography.bodyText1, // Text style
            underline: Container(),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
            items: widget.dropDownItems.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
