class MedicalRecordModel {
  final String id;
  final String name;
  final int age;
  final String gender;
  final String medicalHistory;
  final String prespription;
  final String userID;

  MedicalRecordModel({
    this.id = 'No ID',
    this.name = 'No Name',
    this.age = 0,
    this.gender = 'Unknown',
    this.medicalHistory = 'No medical history available',
    this.prespription = 'No prescription available',
    this.userID = 'No user ID',
  });

  factory MedicalRecordModel.fromJson(Map<String, dynamic> json) {
    return MedicalRecordModel(
      id: json['_id'] ?? 'No ID',
      name: json['name'] ?? 'No Name',
      age: json['age'] ?? 0,
      gender: json['gender'] ?? 'Unknown',
      medicalHistory: json['medicalHistory'] ?? 'No medical history available',
      prespription: json['prescription'] ?? 'No prescription available',
      userID: json['user'] ?? 'No user ID',
    );
  }
}
