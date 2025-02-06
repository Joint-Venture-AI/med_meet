import 'package:get/get.dart';
import 'package:med_meet_flutter/app.dart';
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
import 'package:med_meet_flutter/views/doctor_or_patient.dart';
import 'package:med_meet_flutter/views/home/notification.dart';
import 'package:med_meet_flutter/views/home/user/doctors_details_user.dart';
import 'package:med_meet_flutter/views/home/user/doctors_list_user.dart';
import 'package:med_meet_flutter/views/home/user/home_user.dart';
import 'package:med_meet_flutter/views/home/user/search_user.dart';
import 'package:med_meet_flutter/views/home/user/specialty_list_user.dart';
import 'package:med_meet_flutter/views/home/user/specialty_user.dart';

enum OTPTYPE { doctor, forgetPass, user }

class AppRoutes {
  static String app = '/app';

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
  // Home feature
  static String homeUser = "/home_user";
  static String notifications = "/notifications";
  static String searchUser = "/search_user";
  static String specialtyUser = "/specialty";
  static String specialtyListUser = "/specialty_lsit";
  static String doctorListUser = "/doctor_list_user";
  static String doctorDetailsUser = "/doctor_details_user";
  // Messages feature
  static String messages = "/messages";
  static String chatScreen = "/chatscreen";

  static List<GetPage> pages = [
    GetPage(name: app, page: () => const App()),

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
    GetPage(name: doctorListUser, page: () => const DoctorsListUserView()),
    GetPage(
        name: doctorDetailsUser, page: () => const DoctorsDetailsUserView()),
    GetPage(name: userOrDoctor, page: () => const DoctorOrPatient()),
    // Messages feature
    GetPage(
        name: messages,
        page: () => const MessagesView(),
        transition: Transition.noTransition),
    GetPage(name: chatScreen, page: () => const ChatScreenView()),
  ];
}
