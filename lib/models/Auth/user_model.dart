class DoctorModel {
  final String id;
  final String name;
  final String role;
  final String email;
  final String country;
  final String doctorId;
  final String status;
  final bool verified;
  final String approvedStatus;
  final bool isAllFieldsFilled;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String aboutDoctor;
  final String clinic;
  final String clinicAddress;
  final int consultationFee;
  final DateTime dob;
  final int experience;
  final String gender;
  final String image;
  final String medicalLicense;
  final String phoneNumber;
  final String professionalIdBack;
  final String professionalIdFront;
  final String specialist;
  final bool subscription;

  DoctorModel({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.country,
    required this.doctorId,
    required this.status,
    required this.verified,
    required this.approvedStatus,
    required this.isAllFieldsFilled,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.aboutDoctor,
    required this.clinic,
    required this.clinicAddress,
    required this.consultationFee,
    required this.dob,
    required this.experience,
    required this.gender,
    required this.image,
    required this.medicalLicense,
    required this.phoneNumber,
    required this.professionalIdBack,
    required this.professionalIdFront,
    required this.specialist,
    required this.subscription,
  });
  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      email: json['email'] as String,
      country: json['country'] as String,
      doctorId: json['doctorId'] as String,
      status: json['status'] as String,
      verified: json['verified'] as bool,
      approvedStatus: json['approvedStatus'] as String,
      isAllFieldsFilled: json['isAllFieldsFilled'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: json['v'] as int,
      aboutDoctor: json['aboutDoctor'] as String,
      clinic: json['clinic'] as String,
      clinicAddress: json['clinicAddress'] as String,
      consultationFee: json['consultationFee'] as int,
      dob: DateTime.parse(json['dob'] as String),
      experience: json['experience'] as int,
      gender: json['gender'] as String,
      image: json['image'] as String,
      medicalLicense: json['medicalLicense'] as String,
      phoneNumber: json['phoneNumber'] as String,
      professionalIdBack: json['professionalIdBack'] as String,
      professionalIdFront: json['professionalIdFront'] as String,
      specialist: json['specialist'] as String,
      subscription: json['subscription'] as bool,
    );
  }
}
