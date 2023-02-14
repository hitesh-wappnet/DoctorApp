import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/routes/routes_const.dart';
import 'package:flutter_application_1/screens/verify_otp_screen/verify_otp_controller.dart';
import 'package:flutter_application_1/services/api_endpoints.dart';
import 'package:flutter_application_1/widget/custom_dailog/custom_dailog_result.dart';
import 'package:flutter_application_1/widget/custom_loading.dart/progress.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ResetPasswordController extends GetxController {
  GlobalKey<FormState> resetPassWordFormKey = GlobalKey<FormState>();

  final VerifyOtpScreenController vController =
      Get.find<VerifyOtpScreenController>();

  RxBool hiddenPass = true.obs;
  final passwordResetPageController = TextEditingController();
  final confirmPasswordResetPageController = TextEditingController();

  RxBool chekBox = false.obs;
  String? token;
  @override
  void onInit() {
    token = Get.arguments;
    print('Token :-- ${vController.userToken.value}');
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
    passwordResetPageController.dispose();
    confirmPasswordResetPageController.dispose();
    super.dispose();
  }

  Future<void> resetPass() async {
    if (resetPassWordFormKey.currentState!.validate()) {
      try {
        showCustomLoadingDialog();
        var headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Token ${vController.userToken.value}'
        };
        var url = Uri.parse(
            ApiEndPoint.baseUrl + ApiEndPoint.authEndPoint.resetPassword);
        Map body = {
          'password': passwordResetPageController.text,
        };
        print(body.toString());
        http.Response response =
            await http.post(url, body: jsonEncode(body), headers: headers);

        final data = jsonDecode(response.body);

        if (data['status'] == true) {
          clearTextFields();
          closeCustomLoadingDialog();
          var message = data['message'];
          showDialog(
              context: Get.context!,
              builder: (BuildContext context) {
                return CustomDialogBox(
                  heading: "Success",
                  icon: Icon(Icons.done),
                  backgroundColor: CustomAccentColor.lightGreenColor,
                  title: "Password Reset Successful",
                  descriptions: message,
                  btn1Text: "",
                  btn2Text: "Ok",
                );
              });
          await Future.delayed(const Duration(milliseconds: 500)).then((value) {
            Get.back();
            Get.offAllNamed(LOGIN_SCREEN_ROUTE);
          });
        } else {
          clearTextFields();
          closeCustomLoadingDialog();
          var error = data['detail'] ?? "Unknow Error Occured";
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
                  btn2Text: "",
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
    passwordResetPageController.clear();
    confirmPasswordResetPageController.clear();
  }
}
