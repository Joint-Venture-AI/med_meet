import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/notification_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/notification_tile.dart';

class NotificationView extends StatelessWidget {
  NotificationView({super.key});
  final NotificationController notifications =
      Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(title: "Notification")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Obx(
          () {
            final notis = notifications.notificationsArray;
            if (notis.isEmpty) {
              return Center(
                child: Text("No Notifications Yet"),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  await notifications.getNotifications();
                },
                child: ListView.builder(
                  itemCount: notis.length,
                  itemBuilder: (context, index) {
                    final noti = notis[index];
                    return NotificationTile(
                        body: noti.body, timeStamp: noti.timeStamp);
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
