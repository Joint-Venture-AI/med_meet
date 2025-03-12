import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

Widget cachedImage({url, size = 112, width, borderRadius}) {
  return ClipRRect(
    borderRadius:
        BorderRadius.circular(double.parse((borderRadius ?? 12).toString())),
    child: Image.network(
      (url == null || url == "")
          ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQog6F07PLoVKKgvipRVIFx1ZVocC8Cu03qRtqXej_kGxRH-G-DKPntcb3kxNWD9c_njWE&usqp=CAU"
          : imageUrl(
              url), // Assuming imageUrl() just returns the URL string; adjust if it does more
      height: double.parse(size.toString()),
      width: width == null
          ? double.parse(size.toString())
          : double.parse(width.toString()),
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child; // Image is fully loaded
        return imagePlaceHolder(CircularProgressIndicator(), size, width);
      },
      errorBuilder: (context, error, stackTrace) {
        return imagePlaceHolder(Icon(Icons.error), size, width);
      },
    ),
  );
}

Widget imagePlaceHolder(child, size, width) {
  return Container(
    height: double.parse(size.toString()),
    width: width == null
        ? double.parse(size.toString())
        : double.parse(width.toString()),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.border1),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(child: child),
  );
}
