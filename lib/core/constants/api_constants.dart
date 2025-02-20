class ApiConstants {
  static String baseUrl = "192.168.10.99:5010";

  // Auth Feature End Points

  // Doctor End Points
  static String doctorLogin = "api/v2/doctor/login";
  static String doctorSignUp = "api/v2/doctor";
  static String doctorResendOTP = "api/v2/doctor/doctor-resend-otp";
  static String doctorVerifyEmail = "api/v2/doctor/verify-email";
  static String doctorUpdateProfile =
      "api/v1/doctor/update-profile"; // doctor uploads credential docs here after opt verification 
  static String apiName = "api/v1/";
  static String getSingleDoctor(docID) => "api/v1/doctor/$docID";
}
