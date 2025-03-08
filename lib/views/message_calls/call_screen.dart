// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:med_meet_flutter/controller/zego_cloud_controller.dart';
// import 'package:med_meet_flutter/core/utils/config_files.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

// class CallScreenView extends StatelessWidget {
//   CallScreenView({
//     super.key,
//     this.callID = "123456",
//   });

//   final String callID;
//   final ZegoCloudController zegoCloudController =
//       Get.find<ZegoCloudController>();

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       final user = zegoCloudController.zegoUser.value;
//       return ZegoUIKitPrebuiltCall(
//         appID: ZegoCloudConfig.appID,
//         appSign: ZegoCloudConfig.appSign,
//         userID: user.userID,
//         userName: user.userName,
//         callID: "123456",
//         config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
//       );
//     });
//   }
// }
