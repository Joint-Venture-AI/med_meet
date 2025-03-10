import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

Widget cachedImage({url, size = 112, width, borderRadius}) {
  return ClipRRect(
    borderRadius:
        BorderRadius.circular(double.parse((borderRadius ?? 12).toString())),
    child: CachedNetworkImage(
      imageUrl: (url == null || url == "")
          ? imageUrl(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQog6F07PLoVKKgvipRVIFx1ZVocC8Cu03qRtqXej_kGxRH-G-DKPntcb3kxNWD9c_njWE&usqp=CAU")
          : imageUrl(url),
      imageBuilder: (context, imageProvider) => Container(
        height: double.parse(size.toString()),
        width: width == null
            ? double.parse(size.toString())
            : double.parse(width.toString()),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) =>
          imagePlaceHolder(CircularProgressIndicator(), size, width),
      errorWidget: (context, url, error) =>
          imagePlaceHolder(Icon(Icons.error), size, width),
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
