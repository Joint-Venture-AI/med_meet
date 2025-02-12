import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

enum StartingWeekDay {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

class CustomCallender extends StatefulWidget {
  final StartingWeekDay startingWeekDay;
  final Function(DateTime)? onClick;
  const CustomCallender({
    super.key,
    this.startingWeekDay = StartingWeekDay.saturday,
    this.onClick,
  });

  @override
  State<CustomCallender> createState() => _CustomCallenderState();
}

class _CustomCallenderState extends State<CustomCallender> {
  DateTime today = DateTime.now();
  DateTime currentDate = DateTime.now();
  DateTime? selectedDate;
  List<String> weekdays = ["MO", "TU", "WE", "TH", "FR", "SA", "SU"];

  List<Widget> getDates() {
    List<Widget> rtn = [];

    DateTime startOfRunningMonth = DateTime(
      currentDate.year,
      currentDate.month,
      1,
    );
    DateTime startOfNextMonth = DateTime(
      currentDate.year,
      currentDate.month + 1,
      1,
    );

    int weekDay = startOfRunningMonth.weekday - 1;
    weekDay =
        (weekDay - StartingWeekDay.values.indexOf(widget.startingWeekDay)) % 7;

    for (int i = 0; i < weekDay; i++) {
      rtn.add(cell());
    }

    for (DateTime i = startOfRunningMonth;
        i.isBefore(startOfNextMonth);
        i = i.add(const Duration(days: 1))) {
      rtn.add(cell(date: i));
    }

    return rtn;
  }

  Widget cell({DateTime? date}) {
    bool isSelected = false;

    if (date != null && selectedDate != null) {
      if (date.day == selectedDate!.day) {
        isSelected = true;
      }
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = date;
          if (widget.onClick != null && date != null) {
            widget.onClick!(date);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: isSelected ? BoxShape.circle : BoxShape.rectangle,
          color: isSelected ? Color(0xff333333) : null,
        ),
        child: Center(
          child: Text(
            date?.day.toString() ?? "",
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.white : Color(0xff90A4AE),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 10),
            Text(
              " ${getMonth(currentDate.month)} ${currentDate.year}",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff333333),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentDate = DateTime(
                    currentDate.year,
                    currentDate.month - 1,
                  );
                  selectedDate = null;
                });
              },
              child: svgViewer(
                asset: "assets/svg/arrow_triangle_left.svg",
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentDate = DateTime(
                    currentDate.year,
                    currentDate.month + 1,
                  );
                  selectedDate = null;
                });
              },
              child: svgViewer(
                asset: "assets/svg/arrow_triangle_right.svg",
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          shrinkWrap: true,
          children: [
            for (int i = 0; i < 7; i++)
              SizedBox(
                width: 40,
                height: 40,
                child: Center(
                  child: Text(
                    weekdays[(i +
                            StartingWeekDay.values
                                .indexOf(widget.startingWeekDay)) %
                        weekdays.length],
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff333333),
                    ),
                  ),
                ),
              ),
            ...getDates(),
          ],
        ),
      ],
    );
  }

  String getMonth(int month) {
    return [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ][month - 1];
  }
}
