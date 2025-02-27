class ApiConstants {
  static String baseUrl = "http://192.168.10.99:5010/api/v1";
  static String baseAssetUrl = "http://192.168.10.99:5010";

  // Auth Feature End Points

  // Doctor End Points
  static String doctorLogin = "/doctor/login";
  static String doctorSignUp = "/doctor";
  static String doctorResendOTP = "/doctor/doctor-resend-otp";
  static String doctorVerifyEmail = "/doctor/verify-email";
  static String doctorUpdateProfile =
      "/doctor/update-profile"; // doctor uploads credential docs here after opt verification
  static String doctorResetPassword = "/doctor/reset-password";

  // User End Points
  static String user = "/user";
  static String userLoign = "/user/login";
  static String userForgotPassword = "/user/forgot-password";
  static String userVerifyEmail = "/user/verify-email";
  static String userResetPass = "/user/reset-password";
  static String userSignUp = "/user";
  static String userResendOtp = "/user/user-resend-otp";

  // Home Features Endpoints

  // User End Points
  static String userGetProfile = "/user/profile";
  static String userGetAllDoctors = "/doctor";
  static String getSingleDoctor(docID) => "/doctor/$docID";
  static String getSpecialistDoctors(specialistID) =>
      "/doctor?specialist=$specialistID";

  // Doctor Endpoints
  static String doctorGetProfile = "/doctor/profile";
  static String doctorGetHisScore(docID) => "/appointment/doctor/count/$docID";
  static String getDoctorFilteredAppointment(docID, type) =>
      "/appointment/doctor/$docID?status=$type";
  static String getDoctorAllAppointment(docID) => "/appointment/doctor/$docID";

  // Book Appointments Endpoints

  // User Endpoints
  static String userGetAvailableTimeslots(doctorID, date) =>
      "/schedule/available-slots?doctorId=$doctorID&date=$date";

  // Appointment Features

  // User Endpoints
  static String userGetAllAppointment(userID) => "/appointment/user/$userID";
  static String userGetAppointmentDetauls(appointmentID) =>
      "/appointment/$appointmentID";
  static String userPostReview(appointmentID) =>
      "/appointment/review/$appointmentID";

  // Common Features
  static String getAllSpecialty = "/category";

  // Doctor Endpoints
  static String userUpdateProfile = "/user/update-profile";
}
