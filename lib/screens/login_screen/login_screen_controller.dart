import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/routes/routes_const.dart';

import 'package:flutter_application_1/services/api_endpoints.dart';
import 'package:flutter_application_1/widget/custom_dailog/custom_dailog_result.dart';
import 'package:flutter_application_1/widget/custom_loading.dart/progress.dart';
import 'package:flutter_application_1/widget/pop_up.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  //variable used to make password obsecure.
  RxBool hiddenPassword = true.obs;

  //Form key for login page
  final loginFormKey = GlobalKey<FormState>();

  //controller to handle Email
  final emailLoginPageController = TextEditingController();

  //controller to handle Password
  final passwordLoginPageController = TextEditingController();

  String? deviceToken;

  @override
  void onInit() {
    emailLoginPageController.text = "a@gmail.com";
    passwordLoginPageController.text = "Adi@1234";
    getDeviceToken();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getDeviceToken() {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging.getToken().then((token) {
      deviceToken = token;
      update();
    });
  }

  //Function to call login Api
  Future<void> loginUserWithEmail() async {
    if (loginFormKey.currentState!.validate()) {
      try {
        log(deviceToken!);
        showCustomLoadingDialog(); //Custom Dailog
        var headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        };
        var url =
            Uri.parse(ApiEndPoint.baseUrl + ApiEndPoint.authEndPoint.login);
        Map body = {
          'email': emailLoginPageController.text.trim(),
          'password': passwordLoginPageController.text.toString().trim(),
          "fcm_token": deviceToken.toString(),
          "device_type": Platform.operatingSystem.toString(),
        };
        print(body.toString());
        //ApplicationUtils.openDialog();
        http.Response response =
            await http.post(url, body: jsonEncode(body), headers: headers);

        final data = jsonDecode(response.body);

        if (data['status'] == true) {
          clearTextFields(); //Function to clear field
          closeCustomLoadingDialog();

          String token = data['data']['token'];
          print('------$token');

          final prefs = await SharedPreferences.getInstance();
          prefs.setString('token', token);
          //ApplicationUtils.closeDialog();
          showDialog(
              barrierDismissible: true,
              barrierLabel: '',
              barrierColor: Colors.black38,
              context: Get.context!,
              builder: (BuildContext context) {
                return CustomDialogBox(
                  heading: "Success",
                  icon: Icon(Icons.done),
                  backgroundColor: CustomAccentColor.lightGreenColor,
                  title: "Login Successfull",
                  descriptions: "", //
                  btn1Text: "",
                  btn2Text: "",
                );
              });
          await Future.delayed(const Duration(milliseconds: 500))
              .then((value) => Get.offAllNamed(HOME_SCREEN_ROUTE));
        } else {
          //ApplicationUtils.closeDialog();
          clearTextFields();
          closeCustomLoadingDialog();
          //Get.back();
          var error = data['message'].toString().capitalizeFirst ?? "Verify";
          customErrorDialog("Verification", "$error");
        }
      } catch (e) {
        clearTextFields();
        closeCustomLoadingDialog();
        customErrorDialog("Error", "${e.toString()}");
        print(" Catch error :  ${e.toString()}");
      }
    }
  }

  //Function to clear TextField..
  void clearTextFields() {
    emailLoginPageController.clear();
    passwordLoginPageController.clear();
  }

//Function to Remove token got during Login
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    Get.offAllNamed(LOGIN_SCREEN_ROUTE);
  }

//Function to Store token got during login
  static Future<bool> checkUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null || token.isEmpty) {
      return false;
    }

    return true;
  }
}
