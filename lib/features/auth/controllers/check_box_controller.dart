import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  final _isChecked = false.obs; //
  // Make isChecked observable

  bool get isChecked => _isChecked.value;

  void toggleCheckbox(bool newValue) {
    _isChecked.value = newValue;
  }
}
