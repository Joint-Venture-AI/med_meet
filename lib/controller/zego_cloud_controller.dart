import 'package:get/get.dart';
import 'package:med_meet_flutter/core/helpers/pref_helper.dart';

class ZegoCloudController extends GetxController {
  Rx<ZegoCloudModel> zegoUser = ZegoCloudModel().obs;

  Future getZegoUser() async {
    final accID = await PrefsHelper.getString(PrefsKey.accountID);
    final accName = await PrefsHelper.getString(PrefsKey.accountName);
    zegoUser.value = ZegoCloudModel(userID: accID, userName: accName);
  }

  @override
  void onInit() {
    super.onInit();
    getZegoUser();
  }
}

class ZegoCloudModel {
  String userName;
  String userID;

  ZegoCloudModel({this.userID = "None", this.userName = "None"});

  factory ZegoCloudModel.fromJson(Map<String, dynamic> zegoUser) {
    return ZegoCloudModel(userID: zegoUser["id"], userName: zegoUser["name"]);
  }
}
