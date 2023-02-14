import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/screens/doctor_suggestion_screen/doctor_suggestion_screen.dart';
import 'package:flutter_application_1/screens/home_screen/home_screen.dart';
import 'package:flutter_application_1/screens/main_screen/main_screen_controller.dart';
import 'package:flutter_application_1/screens/profile_screen/profile_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MainScreen extends GetView<MainScreenController> {
  final MainScreenController maincontroller = Get.find<MainScreenController>();
  MainScreen({super.key});

  var PagesAll = [
    DoctorSuggestion(),
    HomeScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: maincontroller.tabIndex.value,
          backgroundColor: Colors.transparent,
          onTap: (index) {
            maincontroller.tabIndex.value = index;
          },
          height: 65.h,
          animationCurve: Curves.linearToEaseOut,
          color: NeutralColor.lightBlueColor,
          items: [
            Icon(
              Icons.supervisor_account,
              size: 30.sp,
              color: Colors.white,
            ),
            Icon(
              Icons.home,
              size: 30.sp,
              color: Colors.white,
            ),
            Icon(
              Icons.account_circle_outlined,
              size: 30.sp,
              color: Colors.white,
            )
          ],
        ),
        body: PagesAll[maincontroller.tabIndex.value]));
  }
}
