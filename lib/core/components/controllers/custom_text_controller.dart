import 'package:get/get.dart';

class CustomTextController extends GetxController {
  final RxBool _passShown = false.obs;
  final List<String> items = <String>[
    'One',
    'Two',
    'Free',
    'Four',
  ];

  final _dropDownVal ="".obs;

  @override
  void onInit() {
    super.onInit();
    _dropDownVal.value = items.first;
  }

  String get dropDownVal => _dropDownVal.value;


  bool get passShown => _passShown.value;

  void setDropDown(String value) {
    _dropDownVal.value = value;
    update();
  }

  void setPassShown(bool val) {
    _passShown.value = val;
  }
}
