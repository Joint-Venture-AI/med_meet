class ChatModel {
  final String time;
  final String message;
  final String avatarUrl;
  final String userID;
  final String? imageUrl;

  ChatModel(
      {required this.userID,
      required this.message,
      this.imageUrl,
      this.avatarUrl = "",
      required this.time});
}
