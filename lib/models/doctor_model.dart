class DoctorModel {
  final String? id;
  final String? name;
  final String? role;
  final String? email;
  final String? country;
  final String? doctorId;
  final String? status;
  final bool? verified;
  final String? approvedStatus;
  final bool? isAllFieldsFilled;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? aboutDoctor;
  final String? clinic;
  final String? clinicAddress;
  final int? consultationFee;
  final String? dob;
  final int? experience;
  final String? gender;
  final String? image;
  final String? medicalLicense;
  final String? phoneNumber;
  final String? professionalIdBack;
  final String? professionalIdFront;
  final String? specialist;
  final bool? subscription;

  DoctorModel({
    this.id,
    this.name,
    this.role,
    this.email,
    this.country,
    this.doctorId,
    this.status,
    this.verified,
    this.approvedStatus,
    this.isAllFieldsFilled,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.aboutDoctor,
    this.clinic,
    this.clinicAddress,
    this.consultationFee,
    this.dob,
    this.experience,
    this.gender,
    this.image,
    this.medicalLicense,
    this.phoneNumber,
    this.professionalIdBack,
    this.professionalIdFront,
    this.specialist,
    this.subscription,
  });
  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['_id'],
      name: json['name'],
      role: json['role'],
      email: json['email'],
      country: json['country'],
      doctorId: json['doctorId'],
      status: json['status'],
      verified: json['verified'],
      approvedStatus: json['approvedStatus'],
      isAllFieldsFilled: json['isAllFieldsFilled'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      v: json['v'],
      aboutDoctor: json['aboutDoctor'],
      clinic: json['clinic'],
      clinicAddress: json['clinicAddress'],
      consultationFee: json['consultationFee'],
      dob: json['dob'],
      experience: json['experience'],
      gender: json['gender'],
      image: json['image'] ?? "",
      medicalLicense: json['medicalLicense'],
      phoneNumber: json['phoneNumber'],
      professionalIdBack: json['professionalIdBack'],
      professionalIdFront: json['professionalIdFront'],
      specialist: json['specialist'],
      subscription: json['subscription'],
    );
  }

  DoctorModel copyWith({
    String? id,
    String? name,
    String? role,
    String? email,
    String? country,
    String? doctorId,
    String? status,
    bool? verified,
    String? approvedStatus,
    bool? isAllFieldsFilled,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    String? aboutDoctor,
    String? clinic,
    String? clinicAddress,
    int? consultationFee,
    String? dob,
    int? experience,
    String? gender,
    String? image,
    String? medicalLicense,
    String? phoneNumber,
    String? professionalIdBack,
    String? professionalIdFront,
    String? specialist,
    bool? subscription,
  }) =>
      DoctorModel(
        id: id ?? this.id,
        name: name ?? this.name,
        role: role ?? this.role,
        email: email ?? this.email,
        country: country ?? this.country,
        doctorId: doctorId ?? this.doctorId,
        status: status ?? this.status,
        verified: verified ?? this.verified,
        approvedStatus: approvedStatus ?? this.approvedStatus,
        isAllFieldsFilled: isAllFieldsFilled ?? this.isAllFieldsFilled,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        aboutDoctor: aboutDoctor ?? this.aboutDoctor,
        clinic: clinic ?? this.clinic,
        clinicAddress: clinicAddress ?? this.clinicAddress,
        consultationFee: consultationFee ?? this.consultationFee,
        dob: dob ?? this.dob,
        experience: experience ?? this.experience,
        gender: gender ?? this.gender,
        image: image ?? this.image,
        medicalLicense: medicalLicense ?? this.medicalLicense,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        professionalIdBack: professionalIdBack ?? this.professionalIdBack,
        professionalIdFront: professionalIdFront ?? this.professionalIdFront,
        specialist: specialist ?? this.specialist,
        subscription: subscription ?? this.subscription,
      );
}
