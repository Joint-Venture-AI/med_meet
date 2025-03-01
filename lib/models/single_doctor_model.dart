class SingleDoctorModel {
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
  final String aboutDoctor;
  final String clinic;
  final String clinicAddress;
  final int consultationFee;
  final String dob;
  final int experience;
  final String gender;
  final String image;
  final String medicalLicense;
  final String phoneNumber;
  final String professionalIdBack;
  final String professionalIdFront;
  final SpecialistModel specialist;
  final double avgRating;
  final int totalPatientsCount;
  final List<ReviewModel> reviews;
  final List<RatingPercentageModel> ratingPercentage; // New field

  SingleDoctorModel({
    this.id = '',
    this.name = 'Unknown',
    this.role = 'Doctor',
    this.email = '',
    this.country = 'Not specified',
    this.doctorId = '',
    this.status = 'Inactive',
    this.verified = false,
    this.approvedStatus = 'Pending',
    this.isAllFieldsFilled = false,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.aboutDoctor = 'No information provided',
    this.clinic = 'Unknown Clinic',
    this.clinicAddress = 'Not available',
    this.consultationFee = 0,
    this.dob = 'Unknown',
    this.experience = 0,
    this.gender = 'Not specified',
    this.image = '',
    this.medicalLicense = 'Not provided',
    this.phoneNumber = 'Not available',
    this.professionalIdBack = '',
    this.professionalIdFront = '',
    SpecialistModel? specialist,
    this.avgRating = 0.0,
    this.totalPatientsCount = 0,
    List<ReviewModel>? reviews,
    List<RatingPercentageModel>? ratingPercentage, // New parameter
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now(),
        specialist = specialist ?? SpecialistModel(),
        reviews = reviews ?? [],
        ratingPercentage = ratingPercentage ?? []; // New field initialization

  factory SingleDoctorModel.fromJson(Map<String, dynamic> json) {
    return SingleDoctorModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? 'Unknown',
      role: json['role'] ?? 'Doctor',
      email: json['email'] ?? '',
      country: json['country'] ?? 'Not specified',
      doctorId: json['doctorId'] ?? '',
      status: json['status'] ?? 'Inactive',
      verified: json['verified'] ?? false,
      approvedStatus: json['approvedStatus'] ?? 'Pending',
      isAllFieldsFilled: json['isAllFieldsFilled'] ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
      aboutDoctor: json['aboutDoctor'] ?? 'No information provided',
      clinic: json['clinic'] ?? 'Unknown Clinic',
      clinicAddress: json['clinicAddress'] ?? 'Not available',
      consultationFee: json['consultationFee'] ?? 0,
      dob: json['dob'] ?? 'Unknown',
      experience: json['experience'] ?? 0,
      gender: json['gender'] ?? 'Not specified',
      image: json['image'] ?? '',
      medicalLicense: json['medicalLicense'] ?? 'Not provided',
      phoneNumber: json['phoneNumber'] ?? 'Not available',
      professionalIdBack: json['professionalIdBack'] ?? '',
      professionalIdFront: json['professionalIdFront'] ?? '',
      specialist: json['specialist'] != null
          ? SpecialistModel.fromJson(json['specialist'])
          : SpecialistModel(),
      avgRating: json['avgRating']?.toDouble() ?? 0.0,
      totalPatientsCount: json['TotalPatientsCount'] ?? 0,
      reviews: json['reviews'] != null
          ? (json['reviews'] as List)
              .map((review) => ReviewModel.fromJson(review))
              .toList()
          : [],
      ratingPercentage: json['ratingPercentage'] != null
          ? (json['ratingPercentage'] as List)
              .map((rating) => RatingPercentageModel.fromJson(rating))
              .toList()
          : [], // Parse ratingPercentage
    );
  }
}

class ReviewModel {
  final String id;
  final int rating;
  final String review;
  final DateTime createdAt;
  final String name;
  final String country;
  final String image;

  ReviewModel({
    this.id = '',
    this.rating = 0,
    this.review = 'No review provided',
    DateTime? createdAt,
    this.name = 'Anonymous',
    this.country = 'Not specified',
    this.image = '',
  }) : createdAt = createdAt ?? DateTime.now();

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['_id'] ?? '',
      rating: json['rating'] ?? 0,
      review: json['review'] ?? 'No review provided',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      name: json['name'] ?? 'Anonymous',
      country: json['country'] ?? 'Not specified',
      image: json['image'] ?? '',
    );
  }
}

class SpecialistModel {
  final String id;
  final String name;
  final String image;

  SpecialistModel({
    this.id = '',
    this.name = 'General',
    this.image = '',
  });

  factory SpecialistModel.fromJson(Map<String, dynamic> json) {
    return SpecialistModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? 'General',
      image: json['image'] ?? '',
    );
  }
}

// New model to handle the rating percentage
class RatingPercentageModel {
  final int rating;
  final double percentage;

  RatingPercentageModel({
    required this.rating,
    required this.percentage,
  });

  factory RatingPercentageModel.fromJson(Map<String, dynamic> json) {
    return RatingPercentageModel(
      rating: json['rating'] ?? 0,
      percentage: json['percentage']?.toDouble() ?? 0.0,
    );
  }
}
