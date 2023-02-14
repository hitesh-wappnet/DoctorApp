import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/screens/notification_screen/model/notification_model.dart';
import 'package:flutter_application_1/services/api_endpoints.dart';
import 'package:flutter_application_1/widget/custom_dailog/custom_dailog_result.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NotificationScreenController extends GetxController {
  final isLoading = false.obs;

  final notification = Notifications().obs;
  void onInit() async {
    await NotificationData();
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

  Future<void> NotificationData() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Token $token'
      };
      var url = Uri.parse(ApiEndPoint.baseUrl +
          ApiEndPoint.notificationEndPoint.getNotification);

      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        notification.value = Notifications.fromJson(json.decode(response.body));

        isLoading.value = false;
      } else {
        isLoading.value = false;
        showDialog(
            context: Get.context!,
            builder: (BuildContext context) {
              return CustomDialogBox(
                heading: "Error",
                icon: Icon(Icons.clear),
                backgroundColor: CustomSematicColor.redColor,
                title: "Something went wrong please try again",

                descriptions: "", //
                btn1Text: "",
                btn2Text: "Ok",
              );
            });
        print(response.statusCode);
      }
    } catch (e) {
      isLoading.value = false;
    }
  }
}
