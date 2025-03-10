import 'dart:convert';

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

class MessageController extends GetxController {
  RxList<MessageModel> myMessages = <MessageModel>[].obs;
  RxList<ChatModel> myChatHistory = <ChatModel>[].obs;
  RxString myRole = "".obs;
  RxString myId = "".obs;
  // These two variable stores chat partner image and name
  RxString recieverImage = "".obs;
  RxString recieverName = "".obs;

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
      print("response => ${myMessages[0].name}");
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
      myChatHistory.value = (response.body["data"] as List)
          .map((el) => ChatModel.fromJson(el))
          .toList();
    }
  }

  void handleIncomingMessage(dynamic message) {
    print("Socket recieved message");

    final chatModel = ChatModel.fromJson(message);
    myChatHistory.value.add(chatModel);
    print("message lenght-> ${myChatHistory.length}");
    myChatHistory.refresh();
  }

  @override
  void onInit() async {
    super.onInit();
    Get.context!.loaderOverlay.show();
    myRole.value = await PrefsHelper.getString(PrefsKey.role);
    final myID = await PrefsHelper.getString(PrefsKey.accountID);

    await getAllMessages();
    socketService.on("receiver-$myID", handleIncomingMessage);
    Get.context!.loaderOverlay.hide();
  }
}
