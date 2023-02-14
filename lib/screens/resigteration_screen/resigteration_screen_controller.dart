import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/routes/routes_const.dart';
import 'package:flutter_application_1/services/api_endpoints.dart';
import 'package:flutter_application_1/widget/custom_dailog/custom_dailog_result.dart';
import 'package:flutter_application_1/widget/custom_loading.dart/progress.dart';
import 'package:flutter_application_1/widget/pop_up.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterationController extends GetxController {
  RxBool hiddenPasswords = true.obs;

  final registrationFormKey = GlobalKey<FormState>();
  // final nameSignUpPageController = TextEditingController();
  final emailSignUpPageController = TextEditingController();
  final passwordSignUpPageController = TextEditingController();
  final repeatPasswordSignUpPageController = TextEditingController();
  final phoneNumberSignUpPageController = TextEditingController();
  final addressSignUpPageController = TextEditingController();
  final specializationSignUpPageController = TextEditingController();
  final qualificationSignUpPageController = TextEditingController();
  final firstNameSignUpPageController = TextEditingController();
  final lastNameSignUpPageController = TextEditingController();
  RxBool chekBox = false.obs;
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

  Future registerUserWithEmail() async {
    if (registrationFormKey.currentState!.validate()) {
      showCustomLoadingDialog();
      try {
        var headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        };
        var url = Uri.parse(
            ApiEndPoint.baseUrl + ApiEndPoint.authEndPoint.registeration);
        Map body = {
          "first_name": firstNameSignUpPageController.text.trim(),
          "last_name": lastNameSignUpPageController.text.trim(),
          "email": emailSignUpPageController.text.trim(),
          "password": passwordSignUpPageController.text.toString().trim(),
          "extra_details": {
            "phone": phoneNumberSignUpPageController.text.trim(),
            "address": addressSignUpPageController.text.trim(),
            "specialization": specializationSignUpPageController.text.trim(),
            "degree": qualificationSignUpPageController.text.trim(),
          }
        };
        print(body.toString());
        http.Response response =
            await http.post(url, body: jsonEncode(body), headers: headers);
        final data = jsonDecode(response.body);

        if (data['status'] == true) {
          closeCustomLoadingDialog();
          clearTextFields();

          showDialog(
              context: Get.context!,
              builder: (BuildContext context) {
                return CustomDialogBox(
                  heading: "Success",
                  icon: Icon(Icons.done),
                  backgroundColor: CustomAccentColor.lightGreenColor,
                  title: "Registeration Successfull",
                  descriptions: "", //
                  btn1Text: "",
                  btn2Text: "",
                );
              });
          await Future.delayed(const Duration(milliseconds: 500))
              .then((value) => Get.offAndToNamed(LOGIN_SCREEN_ROUTE));
        } else {
          clearTextFields();
          closeCustomLoadingDialog();
          var error = data['errors']['email'][0].toString().capitalizeFirst;
          customErrorDialog("Error", "$error");
        }
      } catch (e) {
        closeCustomLoadingDialog();
        clearTextFields();
        customErrorDialog("Error", "${e.toString()}");
      }
    }
  }

  void clearTextFields() {
    // firstNameSignUpPageController.clear();
    // lastNameSignUpPageController.clear();
    // emailSignUpPageController.clear();
    passwordSignUpPageController.clear();
    repeatPasswordSignUpPageController.clear();
    // phoneNumberSignUpPageController.clear();
    // addressSignUpPageController.clear();
    // specializationSignUpPageController.clear();
    // qualificationSignUpPageController.clear();

    chekBox.value = false;
  }
}
