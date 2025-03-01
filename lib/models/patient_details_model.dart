import 'dart:io';

class PatientDetailsModel {
  final String name;
  final int age;
  final String dob;
  final String problem;
  final String gender;
  final List<File> images;

  PatientDetailsModel({
    required this.name,
    required this.age,
    required this.dob,
    required this.problem,
    required this.gender,
    required this.images,
  });
}

class CardDetailsModel {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cvv;

  CardDetailsModel({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cvv,
  });
}
