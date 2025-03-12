import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/controller/message_controller.dart';
import 'package:med_meet_flutter/core/components/cached_network_image.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';
import 'package:med_meet_flutter/models/chat_model.dart';

class ChatScreenView extends StatelessWidget {
  ChatScreenView({super.key});
  final ChatController chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Obx(() {
            final title = chatController.recieverName.value;
            return CustomAppBar(title: title);
          })),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Obx(() {
              final chats = chatController.chatList;
              return ListView.builder(
                reverse: true,
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  final myId = chatController.myId.value;
                  return MessageBox(
                    isMe: chat.senderId == myId,
                    chatModel: chat,
                  );
                },
              );
            }),
          ),
          ChatReplyBox(),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  MessageBox({super.key, required this.isMe, required this.chatModel});

  final bool isMe;
  final ChatModel chatModel;

  final ChatController chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20.h,
      ),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isMe)
                Obx(() {
                  final partnerImage = chatController.recieverImage.value;
                  return cachedImage(
                      url: partnerImage, borderRadius: 100, size: 32);
                }),
              if (!isMe)
                SizedBox(
                  width: 10.w,
                ),
              Flexible(
                child: Column(
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    if (chatModel.message != null && chatModel.message != "")
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 15.h,
                        ),
                        decoration: BoxDecoration(
                          color: isMe
                              ? AppColors.backgroundChatReciever
                              : AppColors.backgroundChatSender,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft:
                                isMe ? Radius.circular(20) : Radius.zero,
                            bottomRight:
                                isMe ? Radius.zero : Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          chatModel.message!,
                          style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: isMe ? Colors.white : Color(0xFF5C5C5C)),
                        ),
                      ),
                    if (chatModel.file != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl(chatModel.file),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    SizedBox(height: 10.h),
                    Text(getTimeAgo(chatModel.createdAt))
                  ],
                ),
              ),
              if (isMe) SizedBox(width: 10.w),
              if (isMe)
                Obx(() {
                  final myImage = chatController.myImage.value;
                  return cachedImage(url: myImage, borderRadius: 100, size: 32);
                }),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatReplyBox extends StatefulWidget {
  const ChatReplyBox({
    super.key,
  });

  @override
  State<ChatReplyBox> createState() => _ChatReplyBoxState();
}

class _ChatReplyBoxState extends State<ChatReplyBox> {
  final ChatController chatController = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController messageTextController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (chatController.pickedImage.value != null)
              Container(
                  margin: EdgeInsets.only(left: 4, bottom: 6),
                  height: 60,
                  width: 60,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(chatController.pickedImage.value!),
                      ),
                      Positioned(
                        right: 10,
                        top: 5,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              chatController.pickedImage.value = null;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: Icon(
                              Icons.cancel,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            Row(
              children: [
                Flexible(
                  child: CustomTextInput(
                    textController: messageTextController,
                    title: "title",
                    hintText: "Send message",
                    renderTitle: false,
                    endIconButton: GestureDetector(
                      child: Icon(Icons.send),
                      onTap: () {
                        Get.find<ChatController>()
                            .handleSendMessage(message: messageTextController);
                      },
                    ),
                  ),
                ),
                InkWell(
                  onTap: chatController.pickImageFromGallery,
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.image_outlined)),
                ),
                InkWell(
                  onTap: chatController.pickImageFromCamera,
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.camera_alt_outlined)),
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}
