class UserModel {
  final String? id;
  final String? name;
  final String? role;
  final String? email;
  final String? country;
  final String? status;
  final bool? verified;
  final bool? isAllFieldsFilled;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final DateTime? dob;
  final String? gender;
  final String? address;
  final String? image;
  final String? phoneNumber;

  UserModel({
    this.id,
    this.name,
    this.role,
    this.email,
    this.country,
    this.status,
    this.verified,
    this.isAllFieldsFilled,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.dob,
    this.gender,
    this.address,
    this.image,
    this.phoneNumber,
  });

  /// Factory method to create an instance from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? json['id'], // Handling MongoDB's `_id` field
      name: json['name'],
      role: json['role'],
      email: json['email'],
      country: json['country'],
      status: json['status'],
      verified: json['verified'],
      isAllFieldsFilled: json['isAllFieldsFilled'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      v: json['__v'] ?? json['v'],
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      gender: json['gender'],
      address: json['address'],
      image: json['image'] ?? "",
      phoneNumber: json['phoneNumber'],
    );
  }

  /// Method to create a copy of UserModel with modified fields
  UserModel copyWith({
    String? id,
    String? name,
    String? role,
    String? email,
    String? country,
    String? status,
    bool? verified,
    bool? isAllFieldsFilled,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    DateTime? dob,
    String? gender,
    String? address,
    String? image,
    String? phoneNumber,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        role: role ?? this.role,
        email: email ?? this.email,
        country: country ?? this.country,
        status: status ?? this.status,
        verified: verified ?? this.verified,
        isAllFieldsFilled: isAllFieldsFilled ?? this.isAllFieldsFilled,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        dob: dob ?? this.dob,
        gender: gender ?? this.gender,
        address: address ?? this.address,
        image: image ?? this.image,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );
}
