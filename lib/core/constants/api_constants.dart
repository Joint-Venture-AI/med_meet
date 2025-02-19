class ApiConstants {
  static String baseUrl = "http://192.168.10.99:5010/api/v1";

  // Auth Feature End Points

  // Doctor End Points
  static String doctorLogin = "doctor/login";
  static String doctorUpdateProfile =
      "doctor/update-profile"; // doctor uploads credential docs here after opt verification
  static String doctorSignUp = "doctor";
  static String getSingleDoctor(docID) => "doctor/$docID";
}
