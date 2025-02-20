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
  final DateTime? dob;
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
      id: json['id'] as String?, // Use as String? for nullable fields
      name: json['name'] as String?,
      role: json['role'] as String?,
      email: json['email'] as String?,
      country: json['country'] as String?,
      doctorId: json['doctorId'] as String?,
      status: json['status'] as String?,
      verified: json['verified'] as bool?,
      approvedStatus: json['approvedStatus'] as String?,
      isAllFieldsFilled: json['isAllFieldsFilled'] as bool?,
      createdAt: json['createdAt']!= null? DateTime.parse(json['createdAt'] as String): null, // Handle potential nulls
      updatedAt: json['updatedAt']!= null? DateTime.parse(json['updatedAt'] as String): null,
      v: json['v'] as int?,
      aboutDoctor: json['aboutDoctor'] as String?,
      clinic: json['clinic'] as String?,
      clinicAddress: json['clinicAddress'] as String?,
      consultationFee: json['consultationFee'] as int?,
      dob: json['dob']!= null? DateTime.parse(json['dob'] as String): null,
      experience: json['experience'] as int?,
      gender: json['gender'] as String?,
      image: json['image'] as String?,
      medicalLicense: json['medicalLicense'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      professionalIdBack: json['professionalIdBack'] as String?,
      professionalIdFront: json['professionalIdFront'] as String?,
      specialist: json['specialist'] as String?,
      subscription: json['subscription'] as bool?,
    );
  }


  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'role': role,
    'email': email,
    'country': country,
    'doctorId': doctorId,
    'status': status,
    'verified': verified,
    'approvedStatus': approvedStatus,
    'isAllFieldsFilled': isAllFieldsFilled,
    'createdAt': createdAt?.toIso8601String(), // Use?. for nullable DateTime
    'updatedAt': updatedAt?.toIso8601String(),
    'v': v,
    'aboutDoctor': aboutDoctor,
    'clinic': clinic,
    'clinicAddress': clinicAddress,
    'consultationFee': consultationFee,
    'dob': dob?.toIso8601String(),
    'experience': experience,
    'gender': gender,
    'image': image,
    'medicalLicense': medicalLicense,
    'phoneNumber': phoneNumber,
    'professionalIdBack': professionalIdBack,
    'professionalIdFront': professionalIdFront,
    'specialist': specialist,
    'subscription': subscription,
  };
}