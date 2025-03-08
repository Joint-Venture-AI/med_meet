import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class FcmService {
  late String? fcmToken;
  final instance = FirebaseMessaging.instance;

  void getFcmTOken() async {
    fcmToken = await instance.getToken();
    debugPrint("===========>>>>>>>>>> FCM Token $fcmToken <<==");
  }

  @pragma('vm:entry-point')
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // await NotificationService.instance.setupFlutterNotifications();
    // await NotificationService.instance.showNotification(message);
  }
}
