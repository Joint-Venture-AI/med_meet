class SingleUserModel {
  final String id;
  final String name;
  final String role;
  final String email;
  final String country;
  final String status;
  final bool verified;
  final bool isAllFieldsFilled;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final DateTime dob;
  final String gender;
  final String address;
  final String image;
  final String phoneNumber;

  SingleUserModel({
    this.id = '', // Default to empty string if null
    this.name = '', // Default to empty string if null
    this.role = 'User', // Default to 'User' role if null
    this.email = '', // Default to empty string if null
    this.country = 'Not specified', // Default to 'Not specified'
    this.status = 'Inactive', // Default to 'Inactive' if null
    this.verified = false, // Default to false if null
    this.isAllFieldsFilled = false, // Default to false if null
    DateTime? createdAt,
    DateTime? updatedAt,
    this.v = 0, // Default to 0 for version field
    DateTime? dob,
    this.gender = 'Not specified', // Default to 'Not specified'
    this.address = 'Not specified', // Default to empty string if null
    this.image = '', // Default to empty string if null
    this.phoneNumber = '', // Default to empty string if null
  })  : createdAt =
            createdAt ?? DateTime.now(), // Default to current date and time
        updatedAt =
            updatedAt ?? DateTime.now(), // Default to current date and time
        dob = dob ?? DateTime.now(); // Default to current date if null

  /// Factory method to create an instance from a JSON map
  factory SingleUserModel.fromJson(Map<String, dynamic> json) {
    return SingleUserModel(
      id: json['_id'] ?? json['id'] ?? '', // Default to empty string if null
      name: json['name'] ?? '', // Default to empty string if null
      role: json['role'] ?? 'User', // Default to 'User' if null
      email: json['email'] ?? '', // Default to empty string if null
      country: json['country'] ??
          'Not specified', // Default to 'Not specified' if null
      status: json['status'] ?? 'Inactive', // Default to 'Inactive' if null
      verified: json['verified'] ?? false, // Default to false if null
      isAllFieldsFilled:
          json['isAllFieldsFilled'] ?? false, // Default to false if null
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(), // Default to current date if null
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(), // Default to current date if null
      v: json['__v'] ?? json['v'] ?? 0, // Default to 0 if null
      dob: json['dob'] != null
          ? DateTime.parse(json['dob'])
          : DateTime.now(), // Default to current date if null
      gender: json['gender'] ??
          'Not specified', // Default to 'Not specified' if null
      address:
          json['address'] ?? 'Not specified', // Default to empty string if null
      image: json['image'] ?? '', // Default to empty string if null
      phoneNumber: json['phoneNumber'] ?? '', // Default to empty string if null
    );
  }

  /// Method to create a copy of SingleUserModel with modified fields
  SingleUserModel copyWith({
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
      SingleUserModel(
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
