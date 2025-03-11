import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:med_meet_flutter/controller/home_doctor_controller.dart';
import 'package:med_meet_flutter/controller/home_user_controller.dart';
import 'package:med_meet_flutter/core/constants/api_constants.dart';
import 'package:med_meet_flutter/core/helpers/pref_helper.dart';
import 'package:med_meet_flutter/models/chat_model.dart';
import 'package:med_meet_flutter/models/messasge_model.dart';
import 'package:med_meet_flutter/services/api_checker.dart';
import 'package:med_meet_flutter/services/api_client.dart';
import 'package:med_meet_flutter/services/socket_service.dart';

class ChatController extends GetxController {
  RxList<MessageModel> myMessages = <MessageModel>[].obs;
  RxList<ChatModel> chatList = <ChatModel>[].obs;

  RxString myRole = "".obs;
  RxString myId = "".obs;
  // These two variable stores chat partner image and name
  RxString recieverImage = "".obs;
  RxString recieverName = "".obs;
  RxString reciverID = "".obs;
  RxString recieverRole = "".obs;

  RxString myImage = "".obs;

  // Socket Instance
  SocketService socketService = SocketService();

  Future getAllMessages() async {
    // This is to get my dp along with the fetched chat list
    final myRole = await PrefsHelper.getString(PrefsKey.role);

    if (myRole == "USER") {
      myImage.value = Get.find<UserHomeController>().userData.value.image;
    } else {
      myImage.value = Get.find<HomeDoctorController>().doctorData.value.image;
    }
    // Here Fetching Chat List starts
    final myId = await PrefsHelper.getString(PrefsKey.accountID);
    Response response =
        await ApiClient.getData(ApiConstants.getMyChatList(myId));
    ApiChecker.checkApi(response);
    if (response.statusCode == 200 || response.statusCode == 201) {
      myMessages.value = (response.body["data"] as List)
          .map((el) => MessageModel.fromJson(el))
          .toList();
      update();
    }
  }

  Future getMyChatHistory(recieverID) async {
    final senderID = await PrefsHelper.getString(PrefsKey.accountID);
    myId.value = senderID;

    final body = {"sender": senderID, "receiver": recieverID};

    Get.context!.loaderOverlay.show();
    Response response =
        await ApiClient.postData(ApiConstants.getChatHistory, jsonEncode(body));
    Get.context!.loaderOverlay.hide();
    ApiChecker.checkApi(response);
    if (response.statusCode == 200 || response.statusCode == 201) {
      chatList.value = (response.body["data"] as List)
          .map((el) => ChatModel.fromJson(el))
          .toList();
      update();
    }
  }

  void handleIncomingMessage(dynamic message) {
    final chatModel = ChatModel.fromJson(message);

    if (chatModel.receiverId == myId.value &&
        chatModel.senderId == reciverID.value) {
      chatList.insert(0, chatModel);
      chatList.refresh();
    }
  }

  void handleSendMessage({
    message,
    file,
  }) async {
    if (message == "" || message == null) {}
    if (file == null && (message != null || message != "")) {
      final body = {
        "senderId": myId.value,
        "receiverId": reciverID.value,
        "senderModel": myRole.value == "USER" ? "User" : "Doctor",
        "receiverModel": recieverRole.value,
        "message": (message as TextEditingController).text
      };
      socketService.emit("sendMessage", jsonEncode(body));

      message.clear();

      chatList.insert(0, ChatModel.fromJson(body));
      chatList.refresh();
    }
  }

  void updateMessageOrder(dynamic message) {
    if (message == null) return;
    final model = MessageModel.fromJson(message);
    // print("message ==>> $message");

    final existingMessageIndex =
        myMessages.indexWhere((msg) => msg.partnerId == model.partnerId);
    if (existingMessageIndex != -1) {
      myMessages.removeAt(existingMessageIndex);
    }
    myMessages.insert(0, model);
    myMessages.refresh();
  }

  @override
  void onInit() async {
    super.onInit();
    Get.context!.loaderOverlay.show();
    myRole.value = await PrefsHelper.getString(PrefsKey.role);
    final myID = await PrefsHelper.getString(PrefsKey.accountID);

    await getAllMessages();
    socketService.on("receiver-$myID", handleIncomingMessage);
    socketService.on("updated-chat-list-$myID", updateMessageOrder);
    Get.context!.loaderOverlay.hide();
  }
}
