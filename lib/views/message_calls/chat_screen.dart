import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:med_meet_flutter/controller/message_controller.dart';
import 'package:med_meet_flutter/core/components/cached_network_image.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';

class ChatScreenView extends StatelessWidget {
  ChatScreenView({super.key});
  final MessageController chatController = Get.put(MessageController());
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Obx(
                () {
                  final chat = chatController.myChatHistory.value;
                  return ListView.builder(
                    reverse: true,
                    itemCount: chat.length,
                    itemBuilder: (context, index) {
                      final curr = chat[index];
                      return MessageBox(
                        isMe: curr.senderId == chatController.myId.value,
                        time: curr.createdAt,
                        message: curr.message!,
                      );
                    },
                  );
                },
              ),
            ),
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
  MessageBox(
      {super.key,
      required this.isMe,
      this.message = "",
      this.imageUrl,
      required this.time});

  final bool isMe;
  final String message;
  final String? imageUrl;
  final String time;

  final MessageController chatController = Get.find<MessageController>();

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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (imageUrl == null)
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
                            message,
                            style: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: isMe ? Colors.white : Color(0xFF5C5C5C)),
                          )),
                    if (imageUrl != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child:
                            cachedImage(url: imageUrl, size: 120, width: 300),
                      ),
                    SizedBox(height: 10.h),
                    Text(getTimeAgo(time))
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
  const ChatReplyBox({super.key});

  @override
  State<ChatReplyBox> createState() => _ChatReplyBoxState();
}

class _ChatReplyBoxState extends State<ChatReplyBox> {
  File? _pickedImage;

  Future<void> _pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _pickedImage = File(pickedFile.path);
      } else {
        debugPrint('No image selected from camera');
      }
    });
  }

  Future<void> _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _pickedImage = File(pickedFile.path);
      } else {
        debugPrint('No image selected from gallery');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_pickedImage != null)
            Container(
                margin: EdgeInsets.only(left: 4, bottom: 6),
                height: 60,
                width: 60,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(_pickedImage!),
                    ),
                    Positioned(
                      right: 10,
                      top: 5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _pickedImage = null;
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
                  textController: titleController,
                  title: "title",
                  hintText: "Send message",
                  renderTitle: false,
                  endIconButton: GestureDetector(
                    child: Icon(Icons.send),
                    onTap: () {},
                  ),
                ),
              ),
              InkWell(
                onTap: _pickImageFromGallery,
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.image_outlined)),
              ),
              InkWell(
                onTap: _pickImageFromCamera,
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.camera_alt_outlined)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
