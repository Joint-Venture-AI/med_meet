import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget svgViewer({
  required String asset,
  double height = 24.0,
  double width = 24.0,
  Color? color,
}) {
  return SvgPicture.asset(
    asset,
    height: height,
    width: width,
    colorFilter:
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
  );
}

String getTimeAgo(String dateString) {
  DateTime inputDate =
      DateTime.parse(dateString).toLocal(); // Convert to local time
  DateTime now = DateTime.now();
  Duration difference = now.difference(inputDate);

  if (difference.inDays > 0) {
    return "${difference.inDays} days ago";
  } else if (difference.inHours > 0) {
    return "${difference.inHours} hours ago";
  } else if (difference.inMinutes > 0) {
    return "${difference.inMinutes} minutes ago";
  } else {
    return "Just now";
  }
}
