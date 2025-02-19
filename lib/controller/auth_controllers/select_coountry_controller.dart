import 'package:get/get.dart';

class SelectCountryController extends GetxController {
  final _country = "".obs;

  String get country => _country.value;

  void setCountry(String opt) {
    _country.value = opt;
  }
}
