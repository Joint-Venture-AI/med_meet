class GeneralAppointmentModel {
  String appointmentID;
  String userID;
  String status;
  String name;
  String image;
  String specialist;
  DateTime date;
  String startTime;
  String endTime;

  GeneralAppointmentModel({
    this.appointmentID = "",
    this.status = "pending",
    this.name = "Unknown",
    this.userID = "",
    this.image = "",
    this.specialist = "General",
    DateTime? date,
    this.startTime = "00:00",
    this.endTime = "00:00",
  }) : date = date ?? DateTime.now();

  factory GeneralAppointmentModel.fromJson(Map<String, dynamic> json) =>
      GeneralAppointmentModel(
        appointmentID: json["_id"] ?? "",
        status: json["status"] ?? "pending",
        userID: json["accountID"] ?? "",
        name: json["name"] ?? "Unknown",
        image: json["image"] ?? "",
        specialist: json["specialist"] ?? "General",
        date: json["date"] == null
            ? DateTime.now()
            : DateTime.parse(json["date"]),
        startTime: json["startTime"] ?? "00:00",
        endTime: json["endTime"] ?? "00:00",
      );

  Map<String, dynamic> toJson() => {
        "_id": appointmentID,
        "status": status,
        "name": name,
        "image": image,
        "accountID": userID,
        "specialist": specialist,
        "date": date.toIso8601String(),
        "startTime": startTime,
        "endTime": endTime,
      };
}
