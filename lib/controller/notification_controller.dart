import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';
import 'package:med_meet_flutter/core/helpers/pref_helper.dart';
import 'package:med_meet_flutter/models/notification_model.dart';
import 'package:med_meet_flutter/services/api_client.dart';

class NotificationController extends GetxController {
  // Notificaiton Lists
  RxList<NotificationModel> notificationsArray = <NotificationModel>[].obs;

  // Get Notifications
  Future getNotifications() async {
    final myId = await PrefsHelper.getString(PrefsKey.accountID);

    Get.context!.loaderOverlay.show();
    Response response =
        await ApiClient.getData(ApiConstants.getNotifications(myId));
    Get.context!.loaderOverlay.hide();
    if (response.statusCode == 200 || response.statusCode == 201) {
      notificationsArray.value = (response.body["data"] as List)
          .map((el) => NotificationModel.fromJson(el))
          .toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getNotifications();
  }
}
