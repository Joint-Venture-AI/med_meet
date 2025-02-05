import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/components/my_custom_appbar.dart';
import 'package:med_meet_flutter/core/components/notification_tile.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: "Notification"),
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
