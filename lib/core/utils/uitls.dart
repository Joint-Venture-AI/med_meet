import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';

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

String imageUrl(String? url) {
  if (url == null || url.isEmpty) {
    return "https://media.istockphoto.com/id/1223671392/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=612x612&w=0&k=20&c=s0aTdmT5aU6b8ot7VKm11DeID6NctRCpB755rA1BIP0=";
  } else {
    if (url.startsWith("http")) {
      return url;
    }
    return ApiConstants.baseAssetUrl + url;
  }
}

List<Map<String, String>> getDropDownItems(List<dynamic> items) {
  return items.map((item) {
    return {
      "title": item["name"].toString(),
      "val": item["_id"].toString(),
    };
  }).toList();
}
