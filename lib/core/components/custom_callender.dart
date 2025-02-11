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
  const CustomCallender(
      {super.key, this.startingWeekDay = StartingWeekDay.sunday});

  @override
  State<CustomCallender> createState() => _CustomCallenderState();
}

class _CustomCallenderState extends State<CustomCallender> {
  DateTime today = DateTime.now();
  DateTime currentDate = DateTime.now();

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

    int weekDay = startOfRunningMonth.weekday;

    for (int i = 0; i < weekDay-1; i++) {
      rtn.add(cell());
    }

    for (DateTime i = startOfRunningMonth;
        i.isBefore(startOfNextMonth);
        i = i.add(const Duration(days: 1))) {
      rtn.add(cell(text: i.day.toString()));
    }

    StartingWeekDay.values[0];

    return rtn;
  }

  Widget cell({String? text}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Center(
        child: Text(
          text ?? "-",
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
              "${getMonth(currentDate.month)} ${currentDate.year}",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff333333),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentDate =
                      DateTime(currentDate.year, currentDate.month - 1);
                });
              },
              child: svgViewer(
                asset: "assets/svg/arrow_triangle_left.svg",
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentDate =
                      DateTime(currentDate.year, currentDate.month + 1);
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
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "MO",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff333333),
                ),
              ),
              Text(
                "TU",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff333333),
                ),
              ),
              Text(
                "WE",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff333333),
                ),
              ),
              Text(
                "TH",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff333333),
                ),
              ),
              Text(
                "FR",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff333333),
                ),
              ),
              Text(
                "SA",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff333333),
                ),
              ),
              Text(
                "SU",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff333333),
                ),
              ),
            ],
          ),
        ),
        GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          shrinkWrap: true,
          children: [
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
