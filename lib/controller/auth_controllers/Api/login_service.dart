import 'package:get/get.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class LoginServiceController extends GetxController implements GetxService {
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void doctorLogin(uniqueId, password) async {
    _isLoading.value = true;
    final url = Uri.https(ApiConstants.baseUrl, ApiConstants.doctorLogin);
    final headers = {
      "Content-Type": "application/json",
    };
    final body = {"uniqueId": uniqueId, "password": password};

    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      print(response.body);
    }
  }
}
