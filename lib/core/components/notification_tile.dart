import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile(
      {super.key, required this.body, required this.timeStamp});
  final String body;
  final String timeStamp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border1),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.background2,
            child: Icon(
              Icons.notifications_none,
              color: AppColors.iconColor1,
            ),
          ),
          title: Text(
            body,
            style: AppTypography.notificationTitle,
          ),
          subtitle: Text(
            getTimeAgo(timeStamp),
            style: AppTypography.timeStyle,
          ),
        ),
      ),
    );
  }
}
