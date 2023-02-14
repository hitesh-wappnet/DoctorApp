// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/screens/child_search_screen/model/children_search_model.dart';
import 'package:flutter_application_1/screens/child_search_screen/model/connected_child_model.dart';
import 'package:flutter_application_1/services/api_endpoints.dart';
import 'package:flutter_application_1/widget/custom_dailog/custom_dailog_result.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChildSearchScreenController extends GetxController {
  //Made Model Class Obserable to access another class ..
  dynamic searchChildren = SearchChildren().obs;

  final connectedChildren = ConnectedChild().obs;

  //Controller for Search Textfield..
  final searchController = TextEditingController();

  //declared variable will used in wait till Api Call.
  var isLoading = false.obs;
  var isLoadingConnected = false.obs;

  void onInit() async {
    await ConnectedChildrensList("");
    searchChild;
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

  //Api Call for Search Child.0
  Future<void> searchChild(String query) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Token $token'
      };

      var url = Uri.parse(ApiEndPoint.baseUrl +
          ApiEndPoint.doctorEndPoint.searchChild +
          "?child_code=$query");
      print(url);
      http.Response response = await http.get(url, headers: headers);

      print(response.statusCode);
      if (response.statusCode == 200) {
        isLoading.value = true;
        searchChildren = SearchChildren.fromJson(json.decode(response.body));
        print("ChildCode:${searchChildren.data?.name}");
        update();
      } else if (response.statusCode == 400) {
        isLoading.value = true;

        var error = json.decode(response.body);
        log(error["errors"].toString());
        searchChildren = SearchChildren.fromJson(json.decode(response.body));
        update();
      } else {
        isLoading.value = false;

        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load child search');
      }
    } catch (e) {
      print("${e.toString()}");
    }
  }

  Future<void> ConnectedChildrensList(String? query) async {
    isLoadingConnected.value = true;
    log("query:$query");
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Token $token'
      };
      var url = Uri.parse(ApiEndPoint.baseUrl +
          ApiEndPoint.doctorEndPoint.connectedChild +
          "?child_code=$query");
      log("url:$url");
      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        log("response:${response.body}");
        isLoadingConnected.value = false;
        var result = jsonDecode(response.body);
        print(result);
        connectedChildren.value =
            ConnectedChild.fromJson(json.decode(response.body));
        print(connectedChildren.value.data![0].child);
        update();
      } else if (response.statusCode == 404) {
        log(response.statusCode.toString());
        searchChild(query.toString());
        update();
      } else {
        isLoadingConnected.value = false;
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
      isLoadingConnected.value = false;
    }
  }
}
