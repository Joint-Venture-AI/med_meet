class TimeSlotModel {
  String startTime;
  String endTime;
  bool isBooked;
  String id;

  TimeSlotModel({
    this.startTime = "00:00",
    this.endTime = "00:00",
    this.isBooked = false,
    this.id = "",
  });

  factory TimeSlotModel.fromJson(Map<String, dynamic> json) => TimeSlotModel(
        startTime: json["startTime"] ?? "00:00",
        endTime: json["endTime"] ?? "00:00",
        isBooked: json["isBooked"] ?? false,
        id: json["_id"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "startTime": startTime,
        "endTime": endTime,
        "isBooked": isBooked,
        "_id": id,
      };
}
