import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/screens/vaccine_record_screen/model/all_vaccine_record_child.dart';
import 'package:flutter_application_1/screens/vaccine_record_screen/model/vaccine_record_model.dart';
import 'package:flutter_application_1/services/api_endpoints.dart';
import 'package:flutter_application_1/widget/custom_dailog/custom_dailog_result.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class VaccineRecordController extends GetxController {
  var isReadmore = false.obs;
  //it will use to track tab index
  var currentTabIndex = 0.obs;
  //it will use to initiallyExpanded tile to hide and show
  var currentIndex = 0.obs;
  //it will use to get child name and id
  var getAllVaccineDetails = Get.arguments;
  var childName = "".obs;
  var childCode = "".obs;

  final childrenVaccineRecords = getAllChildVaccineRecords().obs;
  final allVaccineDetail = VaccineDetail().obs;

  //show loading
  var isLoading = false.obs;

  @override
  void onInit() async {
    childName.value = getAllVaccineDetails[0].toString();
    childCode.value = getAllVaccineDetails[1].toString();
    // await fetchAllChildVaccineRecords()
    //     .then((value) => childrenVaccineRecords.value);
    await fetchUpcommingAndCompleteChildVaccineRecords(" ")
        .then((value) => childrenVaccineRecords.value);
    // log(childName.value);
    // log(childCode.value);
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

  Future<void> fetchAllChildVaccineRecords() async {
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
          ApiEndPoint.doctorEndPoint.requestAndViewData +
          "?child_code=$childCode");

      http.Response response = await http.post(url, headers: headers);
      var data = jsonDecode(response.body);
      if (data['status'] == true) {
        log(response.statusCode.toString());

        childrenVaccineRecords.value =
            getAllChildVaccineRecords.fromJson(json.decode(response.body));

        log(childrenVaccineRecords.value.data!.vaccine![0].vaccineName
            .toString());

        log(url.toString());
        isLoading.value = false;
      } else if (response.statusCode == 400) {
        isLoading.value = false;
        log(response.statusCode.toString());
        Get.snackbar(
          'Request',
          data['errors'],
          backgroundColor: CustomAccentColor.lightBlueColor,
        );
        log(url.toString());
        update();
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

  Future<void> fetchUpcommingAndCompleteChildVaccineRecords(
      String status) async {
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
          ApiEndPoint.doctorEndPoint.vaccineData +
          "?child_code=${childCode}&vaccine_status=${status}");

      http.Response response = await http.get(url, headers: headers);

      log(url.toString());

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        allVaccineDetail.value =
            VaccineDetail.fromJson(json.decode(response.body));

        isLoading.value = false;
        update();
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
