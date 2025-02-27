import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingUserController extends GetxController {
  // Gets the current date in the specidied format
  String currentDay = DateFormat('dd-MM-yyyy').format(DateTime.now());
}
