import 'package:get/get.dart';

class AuthDoctorsController extends GetxController{

  final RxString imagePath = ''.obs;
  final RxString idFrontPath = ''.obs;
  final RxString idBackPath = ''.obs;
  final RxString pdfPath = ''.obs;

  String get getIdFrontPath => idFrontPath.value;
  String get getIdBackPath => idBackPath.value;
  String get getImagePath => imagePath.value;
  String get getPdfPath => pdfPath.value;

  void setImagePath(String path) {
    imagePath.value = path;
    update();
  }

  void setIdFrontPath(String path) {
    idFrontPath.value = path;
    update();
  }

  void setIdBackPath(String path) {
    idBackPath.value = path;
    update();
  }

  void setPdfPath(String path) {
    pdfPath.value = path;
    update();
  }
}