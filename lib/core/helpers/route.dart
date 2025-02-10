import 'package:get/get.dart';
import 'package:med_meet_flutter/doctor_app.dart';
import 'package:med_meet_flutter/user_app.dart';
import 'package:med_meet_flutter/views/appointments/create_prescription.dart';
import 'package:med_meet_flutter/views/appointments/notes_screen.dart';
import 'package:med_meet_flutter/views/auth/views/doctor/doctor_details_auth.dart';
import 'package:med_meet_flutter/views/auth/views/doctor/sign_up.dart';
import 'package:med_meet_flutter/views/auth/views/doctor/verify_progress_doctor.dart';
import 'package:med_meet_flutter/views/auth/views/forgot_password.dart';
import 'package:med_meet_flutter/views/auth/views/new_password.dart';
import 'package:med_meet_flutter/views/auth/views/select_country_screen.dart';
import 'package:med_meet_flutter/views/auth/views/sign_in.dart';
import 'package:med_meet_flutter/views/auth/views/splash_screen.dart';
import 'package:med_meet_flutter/views/auth/views/user/complete_profile.dart';
import 'package:med_meet_flutter/views/auth/views/user/sign_up.dart';
import 'package:med_meet_flutter/views/auth/views/verify_otp.dart';
import 'package:med_meet_flutter/views/booking/book_card_details.dart';
import 'package:med_meet_flutter/views/booking/book_patient_detials.dart';
import 'package:med_meet_flutter/views/booking/book_review_summary.dart';
import 'package:med_meet_flutter/views/booking/book_schedule_screen.dart';
import 'package:med_meet_flutter/views/doctor_or_patient.dart';
import 'package:med_meet_flutter/views/home/doctor/doctor_all_appointment_list.dart';
import 'package:med_meet_flutter/views/appointments/appointment_details_screen.dart';
import 'package:med_meet_flutter/views/home/doctor/doctor_home.dart';
import 'package:med_meet_flutter/views/home/notification.dart';
import 'package:med_meet_flutter/views/home/user/doctors_details_user.dart';
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
import 'package:med_meet_flutter/views/profile/doctor/doctor_review_profile.dart';
import 'package:med_meet_flutter/views/profile/doctor/doctor_schedule.dart';
import 'package:med_meet_flutter/views/profile/doctor/doctor_withdraw.dart';
import 'package:med_meet_flutter/views/profile/personal_information.dart';
import 'package:med_meet_flutter/views/profile/privacy_policy.dart';
import 'package:med_meet_flutter/views/profile/settings.dart';
import 'package:med_meet_flutter/views/profile/terms_of_services.dart';
import 'package:med_meet_flutter/views/profile/user/medical_records.dart';
import 'package:med_meet_flutter/views/profile/user/prescription.dart';

enum OTPTYPE { doctor, forgetPass, user }

class AppRoutes {
  static String userApp = '/user_app';
  static String doctorApp = '/doctor_app';

  // Auth feature
  static String splashScreen = "/splash_screen";
  static String selectCountryScreen = "/select_country_screen";
  static String signIn = "/sign_in";
  static String signUpUser = "/sign_up_user";
  static String verifOtp = "/verify_otp";
  static String forgetPass = "/forget_pass";
  static String newPassword = "/new_password";
  static String completeProfile = "/complete_profile";
  static String signUpDoctor = "/sign_up_doctor";
  static String doctorDetails = "/doctor_details";
  static String verifyProgressDoctor = "/verify_progress_doctor";
  // TEmp
  static String userOrDoctor = "/user_or_doctor";
  // Home User feature
  static String homeUser = "/home_user";
  static String notifications = "/notifications";
  static String searchUser = "/search_user";
  static String specialtyUser = "/specialty";
  static String specialtyListUser = "/specialty_lsit";
  static String doctorListUser = "/doctor_list_user";
  static String doctorDetailsUser = "/doctor_details_user";

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
  static String personalInformation = '/personal_information';
  static String medicalRecords = '/medical_records';
  static String prescription = '/prescription';

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
    GetPage(name: splashScreen, page: () => const SplashView()),
    GetPage(name: selectCountryScreen, page: () => const SelectCountryScreen()),
    GetPage(name: signIn, page: () => const SignInView()),
    GetPage(name: signUpUser, page: () => const SignupUserView()),
    GetPage(name: verifOtp, page: () => const VerifyOtpView()),
    GetPage(name: forgetPass, page: () => const ForgotPassView()),
    GetPage(name: newPassword, page: () => const NewPassView()),
    GetPage(name: completeProfile, page: () => const CompletePRofileView()),
    GetPage(name: signUpDoctor, page: () => const SingupDoctorView()),
    GetPage(name: doctorDetails, page: () => const DoctorDetailsAuthView()),
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
        name: doctorDetailsUser, page: () => const DoctorsDetailsUserView()),
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
      name: personalInformation,
      page: () => const PersonalInformation(),
    ),
    GetPage(name: doctorDetailsProfile, page: () => DoctorDetails()),
    GetPage(name: doctorWithdraw, page: () => DoctorWithdraw()),
    GetPage(name: doctorEarnings, page: () => DoctorEarnings()),
    GetPage(name: doctorSchedule, page: () => DoctorSchedule()),
    GetPage(name: doctorReviewsProfile, page: () => DoctorReviewProfile()),
    GetPage(name: medicalRecords, page: () => MedicalRecords()),
    GetPage(name: prescription, page: () => Prescription()),
    GetPage(name: settings, page: () => const Settings()),
    GetPage(name: changePassword, page: () => const ChangePassword()),
    GetPage(name: privaryPolicy, page: () => const PrivacyPolicy()),
    GetPage(name: termsOfServices, page: () => const TermsOfServices()),
    GetPage(name: aboutUs, page: () => const AboutUs()),
  ];
}
