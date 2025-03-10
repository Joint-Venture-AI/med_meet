class ChatModel {
  final String id;
  final String senderId;
  final String receiverId;
  final String senderModel;
  final String receiverModel;
  final String? message; // Optional field
  final String? file; // Optional field
  final List<String> seenBy;
  final String createdAt;

  // Constructor with default values
  ChatModel({
    this.id = "unknown_id",
    this.senderId = "unknown_sender_id",
    this.receiverId = "unknown_receiver_id",
    this.senderModel = "Unknown Sender",
    this.receiverModel = "Unknown Receiver",
    this.message,
    this.file,
    this.seenBy = const [],
    this.createdAt = "N/A",
  });

  // Factory to create a ChatModel from a Map
  factory ChatModel.fromJson(Map<String, dynamic> data) {
    return ChatModel(
      id: data['_id'] ?? "unknown_id",
      senderId: data['senderId'] ?? "unknown_sender_id",
      receiverId: data['receiverId'] ?? "unknown_receiver_id",
      senderModel: data['senderModel'] ?? "Unknown Sender",
      receiverModel: data['receiverModel'] ?? "Unknown Receiver",
      message: data['message'], // Only included if present
      file: data['file'], // Only included if present
      seenBy: List<String>.from(data['seenBy'] ?? []),
      createdAt: data['createdAt'] ?? DateTime.now().toUtc().toIso8601String(),
    );
  }

  // Method to convert the object back to Map, if needed
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'senderModel': senderModel,
      'receiverModel': receiverModel,
      'message': message,
      'file': file,
      'seenBy': seenBy,
      'createdAt': createdAt,
    };
  }
}
