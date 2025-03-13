import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
  Rx<File?> pickedImage = Rx<File?>(null);

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
    debugPrint("=======>>>>>> Socket Incoming Message: $message");
    final chatModel = ChatModel.fromJson(message);
    debugPrint("=======>>>>>> Socket Incoming image: ${chatModel.file}");

    if (chatModel.receiverId == myId.value &&
        chatModel.senderId == reciverID.value) {
      chatList.insert(0, chatModel);
      chatList.refresh();
    } else if (chatModel.receiverId == reciverID.value &&
        chatModel.senderId == myId.value) {
      chatList.insert(0, chatModel);
      chatList.refresh();
    }
  }

  void handleSendMessage({
    message,
    file,
  }) async {
    if (pickedImage.value != null) {
      debugPrint("=======>>>>>> sending form data <<<<<<===========");
      final data = {
        "senderId": myId.value,
        "receiverId": reciverID.value,
        "senderModel": myRole.value == "USER" ? "User" : "Doctor",
        "receiverModel": recieverRole.value,
        "message": (message as TextEditingController).text
      };

      final body = {"data": jsonEncode(data)};

      List<MultipartBody> imageData = <MultipartBody>[
        MultipartBody("image", pickedImage.value!)
      ];
      Get.context!.loaderOverlay.show();
      Response response = await ApiClient.postMultipartData(
          ApiConstants.sendChatFormdata, body,
          multipartBody: imageData);
      Get.context!.loaderOverlay.hide();
      if (response.statusCode == 200 || response.statusCode == 201) {
        pickedImage.value = null;
        message.clear();
      } else {
        ApiChecker.checkApi(response);
      }
    } else if (pickedImage.value == null &&
        (message != null || message != "")) {
      debugPrint("=======>>>>>> sending Socket data <<<<<<===========");
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

  Future fetchMessageData() async {
    Get.context!.loaderOverlay.show();
    myRole.value = await PrefsHelper.getString(PrefsKey.role);
    final myID = await PrefsHelper.getString(PrefsKey.accountID);

    await getAllMessages();
    socketService.on("receiver-$myID", handleIncomingMessage);
    socketService.on("updated-chat-list-$myID", updateMessageOrder);
    Get.context!.loaderOverlay.hide();
  }

  @override
  void onInit() async {
    super.onInit();
    fetchMessageData();
  }

  Future<void> pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    } else {
      debugPrint('No image selected from camera');
    }
  }

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    } else {
      debugPrint('No image selected from gallery');
    }
  }
}
