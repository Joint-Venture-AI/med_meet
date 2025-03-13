import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/controller/home_doctor_controller.dart';
import 'package:med_meet_flutter/controller/home_user_controller.dart';
import 'package:med_meet_flutter/controller/message_controller.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/views/message_calls/components/message_tile.dart';

class MessagesView extends StatelessWidget {
  MessagesView({super.key});
  final ChatController messages = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              CustomAppBar(
                title: "Messages",
                hasLeading: false,
              ),
              Expanded(
                child: Obx(() {
                  final ref = messages.myMessages;
                  final myRole = messages.myRole.value;
                  final myId = myRole == "USER"
                      ? Get.find<UserHomeController>().userData.value.id
                      : Get.find<HomeDoctorController>().doctorData.value.id;
                  return ref.isEmpty
                      ? Center(
                          child: Text("No Messages yet"),
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            messages.fetchMessageData();
                          },
                          child: ListView.builder(
                            itemCount: ref.length,
                            itemBuilder: (context, index) {
                              final chat = ref[index];
                              return MessageTile(
                                image: chat.image,
                                partnerId: chat.partnerId,
                                partnerName: chat.name,
                                lastMessage: chat.lastMsg,
                                timeStamp: chat.lastMsgTime,
                                isMyLastMessage: myId == chat.lastMsgBy,
                                partnerRole: chat.partnerRole,
                              );
                            },
                          ),
                        );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
