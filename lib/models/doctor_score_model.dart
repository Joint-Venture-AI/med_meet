class DoctorScoreCountModel {
  int upcoming;
  int completed;
  int cancelled;
  int total;

  DoctorScoreCountModel({
    this.upcoming = 0,
    this.completed = 0,
    this.cancelled = 0,
    this.total = 0,
  });

  factory DoctorScoreCountModel.fromJson(Map<String, dynamic> json) =>
      DoctorScoreCountModel(
        upcoming: json["upcoming"] ?? 0,
        completed: json["completed"] ?? 0,
        cancelled: json["cancelled"] ?? 0,
        total: json["total"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "upcoming": upcoming,
        "completed": completed,
        "cancelled": cancelled,
        "total": total,
      };
}
