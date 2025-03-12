import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/message_controller.dart';
import 'package:med_meet_flutter/core/components/cached_network_image.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

class MessageTile extends StatelessWidget {
  final String image;
  final String partnerName;
  final String partnerId;
  final String partnerRole;
  final String lastMessage;
  final String timeStamp;
  final bool isMyLastMessage;

  const MessageTile({
    super.key,
    required this.image,
    required this.partnerId,
    required this.partnerRole,
    required this.partnerName,
    required this.lastMessage,
    required this.timeStamp,
    required this.isMyLastMessage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Get.find<ChatController>().recieverImage.value = image;
        Get.find<ChatController>().recieverName.value = partnerName;
        Get.find<ChatController>().reciverID.value = partnerId;
        Get.find<ChatController>().recieverRole.value = partnerRole;
        Get.toNamed(AppRoutes.chatScreen);
        await Get.find<ChatController>().getMyChatHistory(partnerId);
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
            child: cachedImage(url: image, size: 50, borderRadius: 100),
          ),

          title: Text(partnerName.length < 15
              ? partnerName
              : "${partnerName.substring(0, 15)}..."),
          subtitle: Row(
            children: [
              if (isMyLastMessage) Text("You: "),
              // the recent text
              if (lastMessage.isEmpty) Text("Sent a photo"),
              if (lastMessage.isNotEmpty)
                Text(lastMessage.length < 15
                    ? lastMessage
                    : "${lastMessage.substring(0, 15)}..."),
            ],
          ),
          // time
          trailing: Text(getTimeAgo(timeStamp)),
        ),
      ),
    );
  }
}
