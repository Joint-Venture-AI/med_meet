import 'package:get/get.dart';

class SelectCountryController extends GetxController {
  final _country = "Select Your Country".obs;

  String get country => _country.value;

  void setCountry(String opt) {
    _country.value = opt;
  }

  final _flag = "".obs;

  String get flag => _flag.value;

  void setFlag(String opt) {
    _flag.value = opt;
  }
}
