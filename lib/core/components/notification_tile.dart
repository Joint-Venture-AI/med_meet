import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/app_typography.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key});

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
            "Notification Title",
            style: AppTypography.notificationTitle,
          ),
          subtitle: Text(
            "1 Day ago",
            style: AppTypography.timeStyle,
          ),
        ),
      ),
    );
  }
}
