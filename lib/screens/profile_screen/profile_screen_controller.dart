// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_application_1/screens/profile_screen/model/profile_screen_model.dart';
import 'package:flutter_application_1/services/api_endpoints.dart';

class ProfileScreenController extends GetxController {
  // final profile = UserProfile().obs;
  UserProfile? profile;

  var isApiLoad = false.obs;
  @override
  void onInit() async {
    super.onInit();
    await fetchUserProfile();
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

  Future<void> fetchUserProfile() async {
    try {
      //showCustomLoadingDialog();
      isApiLoad.value = true;
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Token $token'
      };
      var url = Uri.parse(
          ApiEndPoint.baseUrl + ApiEndPoint.userProfileEndPoint.getUserProfile);

      http.Response response = await http.get(url, headers: headers);

      final data = jsonDecode(response.body);
      print("-------$data");

      if (response.statusCode == 200) {
        isApiLoad.value = false;
        profile = UserProfile.fromJson(json.decode(response.body));
        log("Degree:${profile?.data?.degree}");
        update();

        // print('Aditya ----${userProfile!.data.type}');
        // print('body ----${response.body}');
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load user profile');
      }
    } catch (e) {
      isApiLoad.value = true;

      print("${e.toString()}");
    }
  }
}
