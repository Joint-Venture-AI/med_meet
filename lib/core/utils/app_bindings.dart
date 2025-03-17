import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/appointment_controller.dart';
import 'package:med_meet_flutter/controller/notification_controller.dart';
import 'package:med_meet_flutter/controller/zego_cloud_controller.dart';

class AppBindings {
  static Bindings bindings = BindingsBuilder(() {
    Get.lazyPut(() => ZegoCloudController(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);
    Get.lazyPut(() => AppointmentController(), fenix: true);
  });
}
