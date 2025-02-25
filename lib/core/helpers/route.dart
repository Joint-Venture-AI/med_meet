import 'package:get/get.dart';
import 'package:med_meet_flutter/doctor_app.dart';
import 'package:med_meet_flutter/user_app.dart';
import 'package:med_meet_flutter/views/appointments/create_prescription.dart';
import 'package:med_meet_flutter/views/appointments/notes_screen.dart';
import 'package:med_meet_flutter/views/auth/doctor/doctor_details_auth.dart';
import 'package:med_meet_flutter/views/auth/doctor/doctor_forget_pass.dart';
import 'package:med_meet_flutter/views/auth/doctor/doctor_new_pass.dart';
import 'package:med_meet_flutter/views/auth/doctor/doctor_sign_in.dart';
import 'package:med_meet_flutter/views/auth/doctor/doctor_sign_up.dart';
import 'package:med_meet_flutter/views/auth/doctor/verify_progress_doctor.dart';
import 'package:med_meet_flutter/views/auth/user/user_forgot_password.dart';
import 'package:med_meet_flutter/views/auth/user/user_new_password.dart';
import 'package:med_meet_flutter/views/select_country_screen.dart';
import 'package:med_meet_flutter/views/auth/user/user_sign_in.dart';
import 'package:med_meet_flutter/views/auth/splash_screen.dart';
import 'package:med_meet_flutter/views/auth/user/complete_profile.dart';
import 'package:med_meet_flutter/views/auth/user/user_sign_up.dart';
import 'package:med_meet_flutter/views/auth/who_are_you_screen.dart';
import 'package:med_meet_flutter/views/booking/book_card_details.dart';
import 'package:med_meet_flutter/views/booking/book_patient_detials.dart';
import 'package:med_meet_flutter/views/booking/book_review_summary.dart';
import 'package:med_meet_flutter/views/booking/book_schedule_screen.dart';
import 'package:med_meet_flutter/views/common/doctor_details_for_doctor.dart';
import 'package:med_meet_flutter/views/doctor_or_patient.dart';
import 'package:med_meet_flutter/views/home/doctor/doctor_all_appointment_list.dart';
import 'package:med_meet_flutter/views/appointments/appointment_details_screen.dart';
import 'package:med_meet_flutter/views/home/doctor/doctor_home.dart';
import 'package:med_meet_flutter/views/home/notification.dart';
import 'package:med_meet_flutter/views/common/doctors_details_for_user.dart';
import 'package:med_meet_flutter/views/home/doctors_list_user.dart';
import 'package:med_meet_flutter/views/home/user/home_user.dart';
import 'package:med_meet_flutter/views/appointments/review_appointment.dart';
import 'package:med_meet_flutter/views/home/user/search_user.dart';
import 'package:med_meet_flutter/views/home/user/specialty_list_user.dart';
import 'package:med_meet_flutter/views/home/user/specialty_user.dart';
import 'package:med_meet_flutter/views/appointments/user_appointment_screen.dart';
import 'package:med_meet_flutter/views/message_calls/call_screen.dart';
import 'package:med_meet_flutter/views/message_calls/chat_screen.dart';
import 'package:med_meet_flutter/views/message_calls/messages.dart';
import 'package:med_meet_flutter/views/profile/about_us.dart';
import 'package:med_meet_flutter/views/profile/change_password.dart';
import 'package:med_meet_flutter/views/profile/doctor/doctor_details.dart';
import 'package:med_meet_flutter/views/profile/doctor/doctor_earnings.dart';
import 'package:med_meet_flutter/views/profile/doctor/doctor_personal_information.dart';
import 'package:med_meet_flutter/views/profile/doctor/doctor_review_profile.dart';
import 'package:med_meet_flutter/views/profile/doctor/doctor_schedule.dart';
import 'package:med_meet_flutter/views/profile/doctor/doctor_withdraw.dart';
import 'package:med_meet_flutter/views/profile/user/user_personal_information.dart';
import 'package:med_meet_flutter/views/profile/privacy_policy.dart';
import 'package:med_meet_flutter/views/profile/settings.dart';
import 'package:med_meet_flutter/views/profile/terms_of_services.dart';
import 'package:med_meet_flutter/views/profile/user/add_medical_records.dart';
import 'package:med_meet_flutter/views/profile/user/medical_records.dart';
import 'package:med_meet_flutter/views/profile/user/prescription_list.dart';
import 'package:med_meet_flutter/views/profile/user/prescription.dart';

enum OTPTYPE { userSignUp, userForgetPass, doctorSignup, doctorForgetPass }

class AppRoutes {
  static String userApp = '/user_app';
  static String doctorApp = '/doctor_app';

  // Auth feature
  // User
  static String userSignIn = "/user_sign_in";
  static String selectCountryScreen = "/select_country_screen";
  static String signUpUser = "/sign_up_user";
  static String userVerifOtp = "/user_verify_otp";
  static String userForgetPass = "/user_forget_pass";
  static String userNewPassword = "/user_new_password";
  static String completeProfile = "/complete_profile";
  // Doctor
  static String doctorSignIn = "/doctor_sign_in";
  static String signUpDoctor = "/sign_up_doctor";
  static String doctorDetails = "/doctor_details";
  static String verifyProgressDoctor = "/verify_progress_doctor";
  static String doctorForgetpass = "/doctor_forget_pass";
  static String doctorVerifyOTP = "/doctor_verify_otp";
  static String doctorNewPass = "/doctor_new_ass";
  // Common
  static String whoAreYouScreen = "/who-are-you";
  static String splashScreen = "/splash_screen";

  // common

  static String doctorDetailsForUser = "/doctor_details_user";
  static String doctorDetailsForDoctor = "/doctor_details_doctor";
  // TEmp
  static String userOrDoctor = "/user_or_doctor";
  // Home User feature
  static String homeUser = "/home_user";
  static String notifications = "/notifications";
  static String searchUser = "/search_user";
  static String specialtyUser = "/specialty";
  static String specialtyListUser = "/specialty_lsit";
  static String doctorListUser = "/doctor_list_user";

  // Home Doctor feature
  static String homeDoctor = "/home_doctor";
  static String doctorAllApointmentLists = "/doctor_all_appointmetns";

  // Appointment Features
  static String appointmentDetails = "/doctor_appointment_details";
  static String reviewAppointment = "/review_appointment";
  static String userAppointmentScreen = "/user_appointment_screen";
  static String notesScreen = "/note_screen";
  static String createPrescription = "/create_prescription";
  static String submitPrescription = "/submit_prescription";

  // Messages feature
  static String messages = "/messages";
  static String chatScreen = "/chatscreen";
  static String callScreen = "/call_screen";
  // Book appointmets
  static String bookingScreen = '/booking_screen';
  static String bookPatientDetails = '/book_patient_details';
  static String bookReviewSummary = '/book_reviwe_summary';
  static String bookScheduleSummary = '/book_schedule_summary';
  static String bookCardDetails = '/book_card_details';

  // Profile
  static String userPersonalInformation = '/user_personal_information';
  static String doctorPersonalInformation = '/doctor_personal_information';
  static String prescriptionList = '/prescription_list';
  static String prescription = '/prescription';
  static String medicalRecords = '/medical_records';
  static String addMedicalRecords = '/add_medical_records';

  static String doctorDetailsProfile = '/doctor_details_profile';
  static String doctorReviewsProfile = '/doctor_reviews_profile';
  static String doctorEarnings = '/doctor_earnings';
  static String doctorWithdraw = '/doctor_withdraw';
  static String doctorSchedule = '/doctor_schedule';

  static String settings = '/settings';
  static String changePassword = '/change_password';
  static String privaryPolicy = '/privary_policy';
  static String termsOfServices = '/terms_of_services';
  static String aboutUs = '/about_us';

  static List<GetPage> pages = [
    GetPage(name: userApp, page: () => const UserApp()),
    GetPage(name: doctorApp, page: () => const Doctorapp()),

    // Auth feature

    // user
    GetPage(name: selectCountryScreen, page: () => const SelectCountryScreen()),
    GetPage(name: userSignIn, page: () => const UserSignIn()),
    GetPage(name: signUpUser, page: () => SignupUserView()),
    GetPage(name: userForgetPass, page: () => const UserForgotPassView()),
    GetPage(name: userNewPassword, page: () => const UserNewPassView()),
    GetPage(name: completeProfile, page: () => CompletePRofileView()),

    // doctor

    GetPage(name: doctorSignIn, page: () => DoctorSignIn()),
    GetPage(name: signUpDoctor, page: () => SingupDoctorView()),
    GetPage(name: doctorDetails, page: () => DoctorDetailsAuthView()),
    GetPage(name: doctorForgetpass, page: () => DoctorForgetPass()),
    // GetPage(name: doctorVerifyOTP, page: () => const DoctorVerifyOtp()),
    GetPage(name: doctorNewPass, page: () => DoctorNewPass()),

    // common

    GetPage(name: splashScreen, page: () => SplashView()),
    GetPage(name: whoAreYouScreen, page: () => const WhoAreYouScreen()),
    GetPage(
        name: verifyProgressDoctor,
        page: () => const VerifyProgressDoctorView()),

    // Home feature
    GetPage(
        name: homeUser,
        page: () => const HomeUserView(),
        transition: Transition.noTransition),
    GetPage(name: notifications, page: () => const NotificationView()),
    GetPage(name: searchUser, page: () => const SearchUserView()),
    GetPage(name: specialtyUser, page: () => const SpecialtyUserView()),
    GetPage(name: specialtyListUser, page: () => const SpecialtyListUserView()),
    GetPage(name: doctorListUser, page: () => const DoctorsListView()),
    GetPage(
        name: doctorDetailsForUser, page: () => const DoctorsDetailsForUser()),
    GetPage(
        name: doctorDetailsForDoctor,
        page: () => const DoctorDetailsForDoctor()),
    GetPage(name: userOrDoctor, page: () => const DoctorOrPatient()),

    // Home Doctor feature
    GetPage(name: homeDoctor, page: () => const DoctorHomeView()),
    GetPage(
        name: doctorAllApointmentLists,
        page: () => const DoctorAllAppointmentList()),

    // Appointment Features
    GetPage(
        name: appointmentDetails, page: () => const AppointmentDetailsView()),
    GetPage(name: reviewAppointment, page: () => const ReviewAppointmentView()),
    GetPage(
        name: userAppointmentScreen,
        page: () => const UserAppointmentScreenView()),
    GetPage(name: notesScreen, page: () => const NotesScreenView()),
    GetPage(
        name: createPrescription, page: () => const CreatePrescriptionView()),

    // Messages feature
    GetPage(
        name: messages,
        page: () => const MessagesView(),
        transition: Transition.noTransition),
    GetPage(name: chatScreen, page: () => const ChatScreenView()),
    GetPage(name: callScreen, page: () => const CallScreenView()),
    // Booking Feature
    GetPage(name: bookingScreen, page: () => const BookScheduleScreenView()),
    GetPage(name: bookCardDetails, page: () => const BookCardDetailsView()),
    GetPage(
        name: bookPatientDetails, page: () => const BookPatientDetialsView()),
    GetPage(name: bookReviewSummary, page: () => const BookReviewSummaryView()),

    // Profile
    GetPage(
      name: userPersonalInformation,
      page: () => const UserPersonalInformation(),
    ),
    GetPage(
      name: doctorPersonalInformation,
      page: () => const DoctorPersonalInformation(),
    ),
    GetPage(name: doctorDetailsProfile, page: () => DoctorDetails()),
    GetPage(name: doctorWithdraw, page: () => DoctorWithdraw()),
    GetPage(name: doctorEarnings, page: () => DoctorEarnings()),
    GetPage(name: doctorSchedule, page: () => DoctorSchedule()),
    GetPage(name: doctorReviewsProfile, page: () => DoctorReviewProfile()),
    GetPage(name: prescriptionList, page: () => PrescriptionList()),
    GetPage(name: prescription, page: () => Prescription()),
    GetPage(name: medicalRecords, page: () => MedicalRecords()),
    GetPage(name: addMedicalRecords, page: () => AddMedicalRecords()),
    GetPage(name: settings, page: () => const Settings()),
    GetPage(name: changePassword, page: () => const ChangePassword()),
    GetPage(name: privaryPolicy, page: () => const PrivacyPolicy()),
    GetPage(name: termsOfServices, page: () => const TermsOfServices()),
    GetPage(name: aboutUs, page: () => const AboutUs()),
  ];
}
