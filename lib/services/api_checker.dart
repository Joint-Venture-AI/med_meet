import 'package:get/get.dart';

import '../core/components/custom_snack_bar.dart';

class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false}) async {
    if (response.statusCode != 200) {
      showCustomSnackBar(response.statusText!, getXSnackBar: getXSnackBar);
      // if (response.statusCode == 401) {
      // } else {

      // }
    }
  }
}
