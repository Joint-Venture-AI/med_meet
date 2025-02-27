import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/booking_user_controller.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomDatePicker extends StatefulWidget {
  final Function()? onChanged;

  const CustomDatePicker({super.key, this.onChanged});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime currentDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();

  final BookingUserController bookingUserController =
      Get.find<BookingUserController>();

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      // padding: EdgeInsets.all(12),
      child: Column(
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
          TableCalendar(
            rowHeight: 50,
            firstDay: DateTime(2010),
            lastDay: DateTime(2030),
            focusedDay: _focusedDate,
            headerVisible: false,
            daysOfWeekVisible: false,
            selectedDayPredicate: (day) {
              return isSameDay(_focusedDate, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _focusedDate = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              defaultTextStyle: TextStyle(
                fontSize: 14,
                color: Color(0xff90A4AE),
                fontWeight: FontWeight.w500,
              ),
              selectedDecoration:
                  BoxDecoration(color: Colors.black, shape: BoxShape.circle),
              weekendTextStyle: TextStyle(
                fontSize: 14,
                color: Color(0xff90A4AE),
                fontWeight: FontWeight.w500,
              ),
              selectedTextStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              todayDecoration: BoxDecoration(color: Colors.transparent),
              todayTextStyle: TextStyle(
                color: Color(0xff90A4AE),
              ),
            ),
            weekendDays: [DateTime.monday, DateTime.sunday],
          ),
        ],
      ),
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
