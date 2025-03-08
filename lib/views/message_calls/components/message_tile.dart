import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/cached_network_image.dart';
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
            child: cachedImage(url: "", size: 50, borderRadius: 100),
          ),
          // name of the person
          title: Text('Dr. John Doe'),
          subtitle: Row(
            children: [
              // if i am the sender
              Text("You: "),
              // the recent text
              Text("Hi, how are you?...."),
            ],
          ),
          // time
          trailing: Text("10:00 AM"),
        ),
      ),
    );
  }
}
