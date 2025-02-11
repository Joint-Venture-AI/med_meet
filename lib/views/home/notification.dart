import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/notification_tile.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CustomAppBar(title: "Notification")),
        body: Padding(
          padding: EdgeInsets.all(24),
          child: ListView(
            children: [
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
              NotificationTile(),
            ],
          ),
        ));
  }
}
