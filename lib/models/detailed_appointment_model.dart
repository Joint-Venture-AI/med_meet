class DetailedAppointmentModel {
  String id;
  Doctor doctor;
  User user;
  PatientDetails patientDetails;
  List<String> attachmentImage;
  List<String> attachmentPdf;
  String status;
  Review review;
  DateTime date;
  String startTime;
  String endTime;

  DetailedAppointmentModel({
    this.id = "",
    Doctor? doctor,
    User? user,
    PatientDetails? patientDetails,
    List<String>? attachmentImage,
    List<String>? attachmentPdf,
    this.status = "pending",
    Review? review,
    DateTime? date,
    this.startTime = "00:00",
    this.endTime = "00:00",
  })  : doctor = doctor ?? Doctor(),
        user = user ?? User(),
        patientDetails = patientDetails ?? PatientDetails(),
        attachmentImage = attachmentImage ?? [],
        attachmentPdf = attachmentPdf ?? [],
        review = review ?? Review(),
        date = date ?? DateTime.now();

  factory DetailedAppointmentModel.fromJson(Map<String, dynamic> json) =>
      DetailedAppointmentModel(
        id: json["_id"] ?? "",
        doctor:
            json["doctor"] == null ? Doctor() : Doctor.fromJson(json["doctor"]),
        user: json["user"] == null ? User() : User.fromJson(json["user"]),
        patientDetails: json["patientDetails"] == null
            ? PatientDetails()
            : PatientDetails.fromJson(json["patientDetails"]),
        attachmentImage: json["attachmentImage"] == null
            ? []
            : List<String>.from(json["attachmentImage"].map((x) => x)),
        attachmentPdf: json["attachmentPdf"] == null
            ? []
            : List<String>.from(json["attachmentPdf"].map((x) => x)),
        status: json["status"] ?? "pending",
        review:
            json["review"] == null ? Review() : Review.fromJson(json["review"]),
        date: json["date"] == null
            ? DateTime.now()
            : DateTime.parse(json["date"]),
        startTime: json["startTime"] ?? "00:00",
        endTime: json["endTime"] ?? "00:00",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "doctor": doctor.toJson(),
        "user": user.toJson(),
        "patientDetails": patientDetails.toJson(),
        "attachmentImage": List<dynamic>.from(attachmentImage.map((x) => x)),
        "attachmentPdf": List<dynamic>.from(attachmentPdf.map((x) => x)),
        "status": status,
        "review": review.toJson(),
        "date": date.toIso8601String(),
        "startTime": startTime,
        "endTime": endTime,
      };
}

class Doctor {
  String name;
  String image;
  String country;
  String aboutDoctor;
  String clinic;
  String clinicAddress;
  int experience;
  String specialist;
  int consultationFee;

  Doctor({
    this.name = "Unknown",
    this.image = "",
    this.country = "Unknown",
    this.aboutDoctor = "No details available",
    this.clinic = "Unknown",
    this.clinicAddress = "Unknown",
    this.experience = 0,
    this.specialist = "General",
    this.consultationFee = 0,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        name: json["name"] ?? "Unknown",
        image: json["image"] ?? "",
        country: json["country"] ?? "Unknown",
        aboutDoctor: json["aboutDoctor"] ?? "No details available",
        clinic: json["clinic"] ?? "Unknown",
        clinicAddress: json["clinicAddress"] ?? "Unknown",
        experience: json["experience"] ?? 0,
        specialist: json["specialist"] ?? "General",
        consultationFee: json["consultationFee"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "country": country,
        "aboutDoctor": aboutDoctor,
        "clinic": clinic,
        "clinicAddress": clinicAddress,
        "experience": experience,
        "specialist": specialist,
        "consultationFee": consultationFee,
      };
}

class PatientDetails {
  String fullName;
  String gender;
  int age;
  String problemDescription;

  PatientDetails({
    this.fullName = "Unknown",
    this.gender = "Unknown",
    this.age = 0,
    this.problemDescription = "No details provided",
  });

  factory PatientDetails.fromJson(Map<String, dynamic> json) => PatientDetails(
        fullName: json["fullName"] ?? "Unknown",
        gender: json["gender"] ?? "Unknown",
        age: json["age"] ?? 0,
        problemDescription: json["problemDescription"] ?? "No details provided",
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "gender": gender,
        "age": age,
        "problemDescription": problemDescription,
      };
}

class Review {
  int rating;
  String review;
  DateTime createdAt;

  Review({
    this.rating = 0,
    this.review = "No review",
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"] ?? 0,
        review: json["review"] ?? "No review",
        createdAt: json["createdAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "review": review,
        "createdAt": createdAt.toIso8601String(),
      };
}

class User {
  String name;
  String country;
  String phoneNumber;
  String image;

  User({
    this.name = "Unknown",
    this.country = "Unknown",
    this.phoneNumber = "0000000000",
    this.image = "",
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] ?? "Unknown",
        country: json["country"] ?? "Unknown",
        phoneNumber: json["phoneNumber"] ?? "0000000000",
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "country": country,
        "phoneNumber": phoneNumber,
        "image": image,
      };
}
