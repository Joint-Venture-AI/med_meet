import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_text_input.dart';
import 'package:med_meet_flutter/core/constants/image_assets.dart';
import 'package:med_meet_flutter/core/utils/app_colors.dart';

class ChatScreenView extends StatelessWidget {
  const ChatScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomAppBar(title: "Jene Cooper")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: ListView(
                reverse: true,
                children: [
                  MessageBox(
                    isMe: false,
                  ),
                  MessageBox(
                    isMe: true,
                  ),
                  MessageBox(
                    isMe: false,
                  ),
                  MessageBox(
                    isMe: true,
                  ),
                  MessageBox(
                    isMe: false,
                  ),
                  MessageBox(
                    isMe: true,
                  ),
                ],
              ),
            ),
          ),
          buildSendChat()
        ],
      ),
    );
  }

  Container buildSendChat() {
    final TextEditingController titleController = TextEditingController();
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: 54.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(100),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(3, 0),
          ),
        ],
      ),
      child: Row(
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
          )),
          IconButton(
            icon: Transform.rotate(angle: -45, child: Icon(Icons.attachment)),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  const MessageBox({
    super.key,
    required this.isMe,
  });

  final bool isMe;

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
            children: [
              if (!isMe)
                CircleAvatar(
                  backgroundImage: AssetImage(ImageAssets.doctorImage1),
                ),
              if (!isMe)
                SizedBox(
                  width: 10.w,
                ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
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
                          bottomLeft: isMe ? Radius.circular(20) : Radius.zero,
                          bottomRight: isMe ? Radius.zero : Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation venia consequat sunt nostrud amet.cccc",
                        style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: isMe ? Colors.white : Color(0xFF5C5C5C)),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text("14:00")
                  ],
                ),
              ),
              if (isMe) SizedBox(width: 10.w),
              if (isMe)
                CircleAvatar(
                  backgroundImage: AssetImage(ImageAssets.doctorImage1),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
