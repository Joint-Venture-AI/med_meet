// {
//     "_id": "67bbdc69f5468869dad140c8",
//     "status": "Upcoming",
//     "doctorNote": "take no medicine just dsfdsfds chill",
//     "prescription": "/docs/screencapture-fiverr-inbox-kirohd782-2025-02-24-13_45_42-gz6ni-25-2-2025.pdf",
//     "name": "Dr. edddeeeedsfsfsfe",
//     "image": "/images/67b2cde6ce9fca819dcde237.png",
//     "specialist": "Cardiology",
//     "avgRating": 3.3,
//     "consultationFee": 150,
//     "startTime": "13:30",
//     "endTime": "14:00"
// }

class PrescriptionModel {
  final String id;
  final String status;
  final String doctorNote;
  final String prescription;
  final String name;
  final String image;
  final String specialist;
  final double avgRating;
  final int consultationFee;
  final String startTime;
  final String endTime;

  PrescriptionModel({
    required this.id,
    required this.status,
    required this.doctorNote,
    required this.prescription,
    required this.name,
    required this.image,
    required this.specialist,
    required this.avgRating,
    required this.consultationFee,
    required this.startTime,
    required this.endTime,
  });

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionModel(
      id: json['_id'] ?? '',
      status: json['status'] ?? 'Unknown',
      doctorNote: json['doctorNote'] ?? '',
      prescription: json['prescription'] ?? '',
      name: json['name'] ?? 'Unknown',
      image: json['image'] ?? '',
      specialist: json['specialist'] ?? 'General',
      avgRating: (json['avgRating'] ?? 0.0).toDouble(),
      consultationFee: json['consultationFee'] ?? 0,
      startTime: json['startTime'] ?? '00:00',
      endTime: json['endTime'] ?? '00:00',
    );
  }
}
