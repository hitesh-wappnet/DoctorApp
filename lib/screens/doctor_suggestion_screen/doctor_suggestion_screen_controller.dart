import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/services/api_endpoints.dart';
import 'package:flutter_application_1/widget/pop_up.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widget/custom_dailog/custom_dailog_result.dart';
import '../../widget/custom_loading.dart/progress.dart';

import 'package:http/http.dart' as http;

class DoctorScreenController extends GetxController {
  RxBool hiddenPassword = true.obs;
  //Controller to handle Suggestion TextField..
  final suggestionPageController = TextEditingController();

  final SuggestionformKey = GlobalKey<FormState>();
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

  Future<void> DoctorSuggestion() async {
    if (SuggestionformKey.currentState!.validate())
      try {
        showCustomLoadingDialog();
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('token');
        var headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Token $token'
        };
        var url = Uri.parse(
            ApiEndPoint.baseUrl + ApiEndPoint.doctorEndPoint.suggestion);
        Map body = {
          "suggestion": suggestionPageController.text.toString().trim(),
        };
        print(body.toString());
        //ApplicationUtils.openDialog();
        http.Response response =
            await http.post(url, body: jsonEncode(body), headers: headers);

        final data = jsonDecode(response.body);

        if (data['status'] == true) {
          clearTextFields(); //Function to clear field
          closeCustomLoadingDialog();

          //ApplicationUtils.closeDialog();
          showDialog(
              barrierDismissible: true,
              barrierLabel: '',
              barrierColor: Colors.black38,
              context: Get.context!,
              builder: (BuildContext context) {
                return CustomDialogBox(
                  heading: "",
                  icon: Icon(Icons.done),
                  backgroundColor: CustomAccentColor.lightGreenColor,
                  title: data['message'],
                  descriptions: "Thank you for your Suggestion.", //
                  btn1Text: "",
                  btn2Text: "",
                );
              });
        } else {
          //ApplicationUtils.closeDialog();

          closeCustomLoadingDialog();
          //Get.back();
          var error = data['message'].toString().capitalizeFirst ?? "Verify";
          customErrorDialog("Suggestion failed", "$error");
        }
      } catch (e) {}
  }

  void clearTextFields() {
    suggestionPageController.clear();
  }
}
