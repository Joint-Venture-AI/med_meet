class MessageModel {
  final String partnerId;
  final String name;
  final String image;
  final String model;
  final String lastMsg;
  final String lastMsgTime;
  final String lastMsgBy;

  // Constructor with default values to ensure meaningful UI
  MessageModel({
    this.partnerId = "unknown_partner_id",
    this.name = "Unnamed Partner",
    this.image = "/images/default.png", // Default placeholder image
    this.model = "Generic Model",
    this.lastMsg = "No message available",
    this.lastMsgTime = "N/A",
    this.lastMsgBy = "unknown_sender",
  });

  // Factory to handle creating a MessageModel from a Map
  factory MessageModel.fromJson(Map<String, dynamic> data) {
    return MessageModel(
      partnerId: data['partnerId'] ?? "unknown_partner_id",
      name: data['name'] ?? "Unnamed Partner",
      image: data['image'] ?? "/images/default.png",
      model: data['model'] ?? "Generic Model",
      lastMsg: data['lastMsg'] ?? "No message available",
      lastMsgTime: data['lastMsgTime'] ?? "N/A",
      lastMsgBy: data['lastMsgBy'] ?? "unknown_sender",
    );
  }

  // Method to convert the object back to Map, if needed
  Map<String, dynamic> toMap() {
    return {
      'partnerId': partnerId,
      'name': name,
      'image': image,
      'model': model,
      'lastMsg': lastMsg,
      'lastMsgTime': lastMsgTime,
      'lastMsgBy': lastMsgBy,
    };
  }
}
