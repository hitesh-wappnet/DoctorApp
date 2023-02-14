import 'package:flutter_application_1/helper/bindings/binding.dart';
import 'package:flutter_application_1/routes/routes_const.dart';
import 'package:flutter_application_1/screens/child_search_screen/child_search_screen.dart';
import 'package:flutter_application_1/screens/doctor_suggestion_screen/doctor_suggestion_screen.dart';
import 'package:flutter_application_1/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:flutter_application_1/screens/home_screen/home_screen.dart';
import 'package:flutter_application_1/screens/login_screen/login_screen.dart';
import 'package:flutter_application_1/screens/main_screen/main_screen.dart';
import 'package:flutter_application_1/screens/notification_screen/notification_new_Screen.dart';

import 'package:flutter_application_1/screens/profile_screen/profile_screen.dart';
import 'package:flutter_application_1/screens/reset_password/reset_password_screen.dart';
import 'package:flutter_application_1/screens/resigteration_screen/resigteration_screen.dart';
import 'package:flutter_application_1/screens/vaccine_record_screen/vaccine_record_new_screen.dart';

import 'package:flutter_application_1/screens/verify_otp_screen/verify_otp_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  AppRoute._();
  static final route = [
    GetPage(
        name: REGISTERATION_SCREEN_ROUTE,
        page: () => RegisterationScreen(),
        binding: Binding()),
    GetPage(
        name: LOGIN_SCREEN_ROUTE,
        page: () => LoginScreen(),
        binding: Binding()),
    GetPage(
        name: HOME_SCREEN_ROUTE, page: () => HomeScreen(), binding: Binding()),
    GetPage(
        name: VACCINE_RECORD_SCREEN_ROUTE,
        page: () => VaccineRecordNewScreen(),
        binding: Binding()),
    GetPage(
        name: NOTIFICATION_SCREEN_ROUTE,
        page: () => NotificationScreenNew(),
        binding: Binding()),
    GetPage(
        name: SEARCH_SCREEN_ROUTE,
        page: () => SearchScreen(),
        binding: Binding()),
    GetPage(
        name: PROFILE_SCREEN_ROUTE,
        page: () => ProfileScreen(),
        binding: Binding()),
    GetPage(
        name: DOCTOR_SUGGESTION_SCREEN_ROUTE,
        page: () => DoctorSuggestion(),
        binding: Binding()),
    GetPage(
        name: FORGET_PASSWORD_SCREEN_ROUTE,
        page: () => ForgetPasswordScreen(),
        binding: Binding()),
    GetPage(
        name: VERIFY_OTP_SCREEN_ROUTE,
        page: () => VerifyOtpScreen(),
        binding: Binding()),
    GetPage(
        name: RESET_PASSWORD_SCREEN_ROUTE,
        page: () => ResetPasswordScreen(),
        binding: Binding()),
    GetPage(
        name: MAIN_SCREEN_ROUTE, page: () => MainScreen(), binding: Binding()),
  ];
}
