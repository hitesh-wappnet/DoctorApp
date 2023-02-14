import 'package:flutter_application_1/screens/child_search_screen/child_search_screen_controller.dart';
import 'package:flutter_application_1/screens/doctor_suggestion_screen/doctor_suggestion_screen_controller.dart';
import 'package:flutter_application_1/screens/forgot_password_screen/forgot_password_controller.dart';
import 'package:flutter_application_1/screens/home_screen/home_screen_controller.dart';
import 'package:flutter_application_1/screens/login_screen/login_screen_controller.dart';
import 'package:flutter_application_1/screens/main_screen/main_screen_controller.dart';
import 'package:flutter_application_1/screens/notification_screen/notification_screen_controller.dart';

import 'package:flutter_application_1/screens/profile_screen/profile_screen_controller.dart';
import 'package:flutter_application_1/screens/reset_password/reset_password_controller.dart';
import 'package:flutter_application_1/screens/resigteration_screen/resigteration_screen_controller.dart';
import 'package:flutter_application_1/screens/vaccine_record_screen/vaccine_record_screen_controller.dart';
import 'package:flutter_application_1/screens/verify_otp_screen/verify_otp_controller.dart';

import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterationController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => VaccineRecordController());
    Get.lazyPut(() => DoctorScreenController());
    Get.lazyPut(() => NotificationScreenController());
    Get.lazyPut(() => ChildSearchScreenController());
    Get.lazyPut(() => ForgetPasswordController());
    Get.lazyPut(() => ResetPasswordController());
    Get.lazyPut(() => VerifyOtpScreenController());
    Get.lazyPut(() => MainScreenController());

    Get.lazyPut(
      () => ProfileScreenController(),
      fenix: true,
    );
    //Get.lazyPut(() => pinController());
  }
}
