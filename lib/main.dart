import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/services/fcm_service.dart';
import 'package:med_meet_flutter/services/notification_service.dart';
import 'package:med_meet_flutter/services/socket_service.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:med_meet_flutter/controller/zego_cloud_controller.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.instance.initialize();

  await SocketService().socketInitialize();

  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.scaffoldBackgroundColor,
    statusBarIconBrightness: Brightness.dark,
  ));

  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );
    Get.lazyPut(() => ZegoCloudController());
    FcmService().getFcmTOken();

    runApp(
      ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        builder: (_, child) {
          return GlobalLoaderOverlay(
            child: GetMaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
              ),
              getPages: AppRoutes.pages,
              initialRoute: AppRoutes.splashScreen,
            ),
          );
        },
      ),
    );
  });
}
