// ignore_for_file: unused_element, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/constants/strings.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_application_1/helper/text_style/style.dart';
import 'package:flutter_application_1/routes/routes_const.dart';
import 'package:flutter_application_1/screens/child_search_screen/child_search_screen.dart';
import 'package:flutter_application_1/screens/home_screen/home_screen_controller.dart';

import 'package:flutter_application_1/utils/assets/assets_util.dart';
import 'package:flutter_application_1/widget/custom_drawer/custom_drawer.dart';
import 'package:flutter_application_1/widget/custom_searchbar/custom_search_bar.dart';
import 'package:flutter_application_1/widget/custom_text_widget/large_text.dart';
import 'package:flutter_application_1/widget/rich_text_widget/rich_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DrawController extends GetxController {
  //key to handle Drawer
  var scaffoldKey = GlobalKey<ScaffoldState>();

  //Function to Open Drawer..
  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  //Function to Close Drawer..
  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}

//Dummy Data
var childList = [
  {
    "name": " Olivia",
    "dob": "01/01/2023",
    "code": "0548",
    "status": "Approved",
    "Requesttime": "Requested 1 day ago"
  },
  {
    "name": "Liam",
    "dob": "25/011/2022",
    "code": "0228",
    "status": "Approved",
    "Requesttime": "Requested 3 day ago"
  },
  {
    "name": "Evelyn",
    "dob": "15/06/2021",
    "code": "0148",
    "status": "Approved",
    "Requesttime": "Requested 4 day ago"
  },
  {
    "name": "Charlotte",
    "dob": "01/04/1996",
    "code": "0374",
    "status": "Pending",
    "Requesttime": "Requested 3 day ago"
  },
  {
    "name": " Mason",
    "dob": "01/04/1996",
    "code": "0592",
    "status": "Pending",
    "Requesttime": "Requested 3 day ago"
  },
  {
    "name": "Aditya 3",
    "dob": "01/04/1996",
    "code": "0143",
    "status": "Pending",
    "Requesttime": "Requested 3 day ago"
  }
];

List babyImages = [
  AssetsUtils.ASSETS_BABY1_ICON,
  AssetsUtils.ASSETS_BABY2_ICON,
  AssetsUtils.ASSETS_BABY3_ICON,
  AssetsUtils.ASSETS_BABY4_ICON,
  AssetsUtils.ASSETS_BABY5_ICON,
  AssetsUtils.ASSETS_BABY6_ICON,
];

final List dummyList = List.generate(1000, (index) {
  return {
    "id": index,
    "title": "Name : $index",
    "subtitle": "Child Code $index",
    "subtitle2": "DOB: $index"
  };
});

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenController hController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: NeutralColor.whiteColor,
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black, size: 30.sp),
          backgroundColor: Colors.transparent,
          actions: [
            Stack(children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: CustomAccentColor.darkBlueColor,
                  )),
              Positioned(
                  right: 3.0.sp,
                  left: 15,
                  bottom: 17,
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.toNamed(NOTIFICATION_SCREEN_ROUTE);
                        },
                        icon: CircleAvatar(
                          radius: 6.sp,
                          backgroundColor: NeutralColor.whiteColor,
                          child: Icon(
                            Icons.brightness_1,
                            color: CustomAccentColor.darkBlueColor,
                            size: 10.0.sp,
                          ),
                        ),
                      )
                    ],
                  ))
            ])
          ],
        ),
        drawer: NavigationDrawer1(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 15.sp,
                          backgroundImage:
                              AssetImage(AssetsUtils.ASSETS_DOCTOR_ICON)),
                      SizedBox(
                        width: 23.sp,
                      ),
                      LargeText(
                        text: 'Hi, john',
                        size: 18.sp,
                        color: CustomPrimaryColor.blackColor,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 33.h,
                ),
                InkWell(
                    onTap: () {
                      Get.to(SearchScreen(),
                          duration: Duration(milliseconds: 200),
                          transition: Transition.fadeIn);
                    },
                    child: CustomSearchBar()),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        LargeText(
                          text: 'Recent',
                          size: 20.sp,
                          color: CustomPrimaryColor.blackColor,
                        ),
                      ],
                    ),
                    Container(
                      width: 66.w,
                      height: 2.h,
                      color: CustomPrimaryColor.blackColor,
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Obx(
                  () => hController.isLoading.value == true
                      ? Center(
                          child: Lottie.asset(AssetsUtils.ASSETS_LOADING_DOTDOT,
                              height: 50.h, width: 50.w, animate: true),
                        )
                      : SingleChildScrollView(
                          child: hController.recentStatus.value.data!.isEmpty
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 200.h,
                                    ),
                                    Text(NO_RECENT_REQUEST),
                                  ],
                                )
                              : ListView.builder(
                                  primary: false,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemExtent: 120.h,
                                  itemCount: hController
                                      .recentStatus.value.data!.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        navigateToVaccineRecordScreen(
                                            hController.recentStatus.value
                                                .data![index].child
                                                .toString(),
                                            hController.recentStatus.value
                                                .data![index].childCodeChildCode
                                                .toString());
                                      },
                                      child: Card(
                                          elevation: 2,
                                          child: Center(
                                            child: Container(
                                              height: 89.h,
                                              child: ListTile(
                                                leading: CircleAvatar(
                                                  radius: 28.sp,
                                                  foregroundImage: AssetImage(
                                                      babyImages[index]),
                                                ),
                                                title: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    hController
                                                                .recentStatus
                                                                .value
                                                                .data?[index]
                                                                .permission ==
                                                            true
                                                        ? SizedBox(
                                                            height: 11.h,
                                                          )
                                                        : SizedBox(
                                                            height: 21.sp,
                                                          ),
                                                    if (hController
                                                            .recentStatus
                                                            .value
                                                            .data?[index]
                                                            .permission ==
                                                        true)
                                                      CustomRichText(
                                                        "Name:",
                                                        hController
                                                            .recentStatus
                                                            .value
                                                            .data![index]
                                                            .child,
                                                      ),
                                                    CustomRichText(
                                                      "Child Code: ",
                                                      hController
                                                          .recentStatus
                                                          .value
                                                          .data![index]
                                                          .childCodeChildCode,
                                                    ),
                                                    hController
                                                                .recentStatus
                                                                .value
                                                                .data?[index]
                                                                .permission ==
                                                            true
                                                        ? CustomRichText(
                                                            "dob: ",
                                                            hController
                                                                .recentStatus
                                                                .value
                                                                .data![index]
                                                                .dob,
                                                          )
                                                        : Text(
                                                            childList[index][
                                                                "Requesttime"]!,
                                                            style: openSansHeadingStyle(
                                                                color: CustomPrimaryColor
                                                                    .blackColor),
                                                          )
                                                  ],
                                                ),
                                                trailing: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      height: 25.h,
                                                      width: 87.w,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black12),
                                                          color: hController
                                                                      .recentStatus
                                                                      .value
                                                                      .data?[
                                                                          index]
                                                                      .permission ==
                                                                  true
                                                              ? CustomSematicColor
                                                                  .lightGreenColor
                                                              : CustomSematicColor
                                                                  .lightSkinColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.sp)),
                                                      child: Center(
                                                        child: Text(
                                                            hController
                                                                        .recentStatus
                                                                        .value
                                                                        .data?[
                                                                            index]
                                                                        .permission ==
                                                                    true
                                                                ? 'Approved'
                                                                : 'Pending',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  FontFamliyM
                                                                      .SEMIBOLD,
                                                              color: hController
                                                                          .recentStatus
                                                                          .value
                                                                          .data?[
                                                                              index]
                                                                          .permission ==
                                                                      true
                                                                  ? CustomSematicColor
                                                                      .darkGreenColor
                                                                  : CustomSematicColor
                                                                      .orangeColor,
                                                            )),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 13.h,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        navigateToVaccineRecordScreen(
                                                            hController
                                                                .recentStatus
                                                                .value
                                                                .data![index]
                                                                .child
                                                                .toString(),
                                                            hController
                                                                .recentStatus
                                                                .value
                                                                .data![index]
                                                                .childCodeChildCode
                                                                .toString());
                                                      },
                                                      child: Container(
                                                        height: 22.h,
                                                        width: 22.w,
                                                        decoration: BoxDecoration(
                                                            border: hController
                                                                        .recentStatus
                                                                        .value
                                                                        .data?[
                                                                            index]
                                                                        .permission ==
                                                                    true
                                                                ? null
                                                                : Border.all(
                                                                    color: SecondaryColor
                                                                        .greyColor),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    5.sp),
                                                            color: hController
                                                                        .recentStatus
                                                                        .value
                                                                        .data?[
                                                                            index]
                                                                        .permission ==
                                                                    true
                                                                ? CustomSematicColor
                                                                    .lightGreenColor
                                                                : Colors.white),
                                                        child: Center(
                                                            child: Icon(
                                                          Icons.navigate_next,
                                                          color: hController
                                                                      .recentStatus
                                                                      .value
                                                                      .data?[
                                                                          index]
                                                                      .permission ==
                                                                  true
                                                              ? CustomAccentColor
                                                                  .lightGreenColor
                                                              : Colors.black26,
                                                          size: 20.sp,
                                                        )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                    );
                                  },
                                ),
                        ),
                )
              ],
            ),
          ),
        ));
  }
}

Future<dynamic>? navigateToVaccineRecordScreen(String name, String childCode) {
  return Get.toNamed(VACCINE_RECORD_SCREEN_ROUTE, arguments: [name, childCode]);
}
