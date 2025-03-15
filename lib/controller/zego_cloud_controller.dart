import 'package:get/get.dart';
import 'package:med_meet_flutter/core/helpers/pref_helper.dart';
import 'package:med_meet_flutter/core/utils/config_files.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class ZegoCloudController extends GetxController {
  Rx<ZegoCloudModel> zegoUser = ZegoCloudModel().obs;

  Future getZegoUser() async {
    final accID = await PrefsHelper.getString(PrefsKey.accountID);
    final accName = await PrefsHelper.getString(PrefsKey.accountName);
    zegoUser.value = ZegoCloudModel(userID: accID, userName: accName);
  }

  void onUserLogin({userID, userName}) {
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: ZegoCloudConfig.appID,
      appSign: ZegoCloudConfig.appSign,
      
      userID: userID,
      userName: userName,
      notificationConfig: ZegoCallInvitationNotificationConfig(
        androidNotificationConfig: ZegoAndroidNotificationConfig(
          channelID: "ZegoUIKit",
          channelName: "Call Notifications",
          sound: "notification",
          icon: "notification_icon",
        ),
      ),
      plugins: [ZegoUIKitSignalingPlugin()],
      requireConfig: (ZegoCallInvitationData data) {
        var config = (data.invitees.length > 1)
            ? ZegoCallType.videoCall == data.type
                ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
                : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
            : ZegoCallType.videoCall == data.type
                ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
                : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

        // Enable call minimization
        config.topMenuBar.isVisible = true;
        config.topMenuBar.buttons
            .insert(0, ZegoCallMenuBarButtonName.minimizingButton);

        // background pip
        config.topMenuBar.buttons
            .insert(0, ZegoCallMenuBarButtonName.pipButton);
        config.pip.enableWhenBackground = true;

        return config;
      },
    );
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
