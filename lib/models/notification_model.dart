class NotificationModel {
  final String body;
  final String timeStamp;

  NotificationModel({
    this.body = "Unknown",
    this.timeStamp = "Unknown",
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        body: json["body"] ?? "Unknown",
        timeStamp: json["createdAt"] ?? "Unknown");
  }
}
