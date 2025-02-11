import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/constants/image_assets.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.chatScreen);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(ImageAssets.doctorImage1),
          ),
          title: Text('Dr. John Doe'),
          subtitle: Row(
            children: [
              Text("You: "),
              Text("Hi, how are you?...."),
            ],
          ),
          trailing: Text("10:00 AM"),
        ),
      ),
    );
  }
}
