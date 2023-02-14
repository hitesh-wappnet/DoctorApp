import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/routes/routes_const.dart';
import 'package:flutter_application_1/services/api_endpoints.dart';
import 'package:flutter_application_1/widget/custom_dailog/custom_dailog_result.dart';
import 'package:flutter_application_1/widget/custom_loading.dart/progress.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForgetPasswordController extends GetxController {
  //Form Key for Forget Password Screen
  GlobalKey<FormState> forgetScreenFormKey = GlobalKey<FormState>();

  //Controller to handle Forget Password TextField.
  final emailForgetPageController = TextEditingController();

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
    emailForgetPageController.dispose();
    super.dispose();
  }

//Api call for ForgetPassword
  Future<void> forgetPasswordWithEmail() async {
    //check validation before calling ForgetPassword Api..
    if (forgetScreenFormKey.currentState!.validate()) {
      try {
        //Custom Dailog
        showCustomLoadingDialog();
        var headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        };
        var url = Uri.parse(
            ApiEndPoint.baseUrl + ApiEndPoint.authEndPoint.forgotPassword);
        Map body = {
          'email': emailForgetPageController.text,
        };
        print(body.toString());
        http.Response response =
            await http.post(url, body: jsonEncode(body), headers: headers);

        final data = jsonDecode(response.body);

        if (data['status'] == true) {
          //Custom Dailog
          closeCustomLoadingDialog();
          String message = data['message'];
          showDialog(
              context: Get.context!,
              builder: (BuildContext context) {
                return CustomDialogBox(
                  heading: "Success",
                  icon: Icon(Icons.done),
                  backgroundColor: CustomAccentColor.lightGreenColor,
                  title: "Otp Sent Successfull",
                  descriptions: message, //
                  btn1Text: "",
                  btn2Text: "",
                );
              });
          await Future.delayed(const Duration(milliseconds: 500)).then((value) {
            Get.back();
            Get.toNamed(VERIFY_OTP_SCREEN_ROUTE);
          });
        } else {
          //Function for clear TextField
          clearTextFields();
          //Custom Dailog
          closeCustomLoadingDialog();

          var error = data['errors']['message'][0].toString().capitalizeFirst ??
              "Unknow Error Occured";
          //Custom Dailog to Show Results.
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
        //Function to Clear TextField
        clearTextFields();
        //Custom Dailog
        closeCustomLoadingDialog();

        //Custom Dailog to Show Results.
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

  //Function to clear TextField
  void clearTextFields() {
    emailForgetPageController.clear();
  }
}
