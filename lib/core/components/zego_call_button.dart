import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/utils/config_files.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

ZegoSendCallInvitationButton callButton({targetUserID, targetUserName}) {
  return ZegoSendCallInvitationButton(
    isVideoCall: true,
    //You need to use the resourceID that you created in the subsequent steps.
    //Please continue reading this document.
    resourceID: ZegoCloudConfig.resourceID,
    iconSize: Size(24, 24),
    icon: ButtonIcon(
      icon: Icon(Icons.videocam, color: Colors.white, size: 16),
      backgroundColor: Colors.blue,
    ),
    invitees: [
      ZegoUIKitUser(
        id: targetUserID,
        name: targetUserName,
      ),
    ],
  );
}
