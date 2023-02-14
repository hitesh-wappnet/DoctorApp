import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/routes/routes_const.dart';
import 'package:flutter_application_1/screens/forgot_password_screen/forgot_password_controller.dart';
import 'package:flutter_application_1/services/api_endpoints.dart';
import 'package:flutter_application_1/widget/custom_dailog/custom_dailog_result.dart';
import 'package:flutter_application_1/widget/custom_loading.dart/progress.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VerifyOtpScreenController extends GetxController {
  GlobalKey<FormState> VerifyFormKey = GlobalKey<FormState>();

  final ForgetPasswordController fcontroller =
      Get.find<ForgetPasswordController>();

  final pinController = TextEditingController();

  RxString userToken = "".obs;

  @override
  void onInit() {
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

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> otpVerify() async {
    if (VerifyFormKey.currentState!.validate()) {
      try {
        showCustomLoadingDialog();
        var headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        };
        var url =
            Uri.parse(ApiEndPoint.baseUrl + ApiEndPoint.authEndPoint.verifyOtp);
        Map body = {
          "email": fcontroller.emailForgetPageController.text,
          "otp": pinController.text
        };
        print(body.toString());
        http.Response response =
            await http.post(url, body: jsonEncode(body), headers: headers);

        final data = jsonDecode(response.body);

        if (data['status'] == true) {
          closeCustomLoadingDialog();
          var token = data['data']['token'];
          var message = data['message'];
          print(token);
          userToken.value = token;
          showDialog(
              context: Get.context!,
              builder: (BuildContext context) {
                return CustomDialogBox(
                  heading: "Success",
                  icon: Icon(Icons.done),
                  backgroundColor: CustomAccentColor.lightGreenColor,
                  title: "Otp Verification Successfull",
                  descriptions: message,
                  btn1Text: "",
                  btn2Text: "Ok",
                );
              });
          await Future.delayed(const Duration(seconds: 2)).then((value) =>
              Get.offAndToNamed(RESET_PASSWORD_SCREEN_ROUTE, arguments: token));
        } else {
          closeCustomLoadingDialog();

          var error = data['errors']['message'][0].toString().capitalizeFirst ??
              "Unknow Error Occured";

          showDialog(
              context: Get.context!,
              builder: (BuildContext context) {
                return CustomDialogBox(
                  heading: "Error",
                  icon: Icon(Icons.clear),
                  backgroundColor: CustomSematicColor.redColor,
                  title: error,
                  descriptions: "", //
                  btn1Text: "",
                  btn2Text: "Ok",
                );
              });
        }
      } catch (e) {
        clearTextFields();
        closeCustomLoadingDialog();

        showDialog(
            context: Get.context!,
            builder: (BuildContext context) {
              return CustomDialogBox(
                heading: "Error",
                icon: Icon(Icons.clear),
                backgroundColor: CustomSematicColor.redColor,
                title: "${e.toString()}",
                descriptions: "", //
                btn1Text: "",
                btn2Text: "Ok",
              );
            });
      }
    }
  }

  void clearTextFields() {
    pinController.clear();
  }
}
