// ignore_for_file: body_might_complete_normally_nullable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_application_1/helper/text_style/style.dart';
import 'package:flutter_application_1/routes/routes_const.dart';
import 'package:flutter_application_1/screens/notification_screen/notification_screen_controller.dart';

import 'package:flutter_application_1/utils/assets/assets_util.dart';
import 'package:flutter_application_1/widget/custom_button_widget/custom_button.dart';
import 'package:flutter_application_1/widget/custom_text_widget/large_text.dart';
import 'package:flutter_application_1/widget/rich_text_widget/rich_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NotificationScreenNew extends StatefulWidget {
  const NotificationScreenNew({super.key});

  @override
  State<NotificationScreenNew> createState() => _NotificationScreenNewState();
}

var dummyNotification = [
  {
    "status": "unread",
    "name": "Rexon hassan",
    "msg": " given access to modify Evelyn record's",
    "period": "5h ago"
  },
  {
    "status": "unread",
    "name": "Garry Simon",
    "msg": " given access to modify Olivia record's",
    "period": "8h ago"
  },
  {
    "status": "seen",
    "name": "Richard demon",
    "msg": " given access to edit nick record's",
    "period": "1day ago"
  },
];

class _NotificationScreenNewState extends State<NotificationScreenNew> {
  final NotificationScreenController ncontroller =
      Get.find<NotificationScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black, size: 30.sp),
          backgroundColor: Colors.transparent,
          title: LargeText(
            text: 'Notifications',
            color: CustomPrimaryColor.blackColor,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  log('1');
                  ncontroller.NotificationData();
                },
                child: Text(
                  'Clear All',
                  style: TextStyle(color: CustomSematicColor.redColor),
                ),
              ),
            )
          ],
        ),
        body: Obx(
          () => ncontroller.isLoading.value
              ? Center(
                  child: Lottie.asset(AssetsUtils.ASSETS_LOADING_DOTDOT,
                      height: 50.h, width: 50.w, animate: true),
                )
              : SingleChildScrollView(
                  child: ncontroller.notification.value.data == null
                      ? Container(
                          height: MediaQuery.of(context).size.height / 1.5.sp,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 60.sp),
                                child: Image.asset(
                                  AssetsUtils.ASSETS_NO_NOTIFICATION,
                                ),
                              ),
                              Text(
                                "No Notification Right Now!",
                                style: openSansHeadingStyle(
                                    color: CustomPrimaryColor.blackColor,
                                    fontFamily: FontFamliyO.REGULAR,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 22.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text('When you have notification '),
                              Text('you’ll see them here'),
                              SizedBox(
                                height: 18.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: AppButton(
                                  text: 'Go Back',
                                  width: 140.w,
                                  height: 40.h,
                                  radius: 10.sp,
                                ),
                              )
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            ListView.builder(
                                primary: false,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount:
                                    ncontroller.notification.value.data!.length,
                                //physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  deleteDailog() {
                                    return AlertDialog(
                                      content: Text(
                                          "Are you sure you want to delete these notification?"),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color: NeutralColor.whiteColor),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(),
                                          child: Text(
                                            "Delete",
                                            style: TextStyle(
                                                color: NeutralColor.whiteColor),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              dummyNotification.removeAt(index);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Notification dismissed')));
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  }

                                  return InkWell(
                                    onTap: () {
                                      navigateToVaccineRecordScreen(
                                        ncontroller.notification.value
                                            .data![index].childCode
                                            .toString(),
                                        ncontroller.notification.value
                                            .data![index].childCode
                                            .toString(),
                                      );
                                    },
                                    onLongPress: () {
                                      log('hi');
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return deleteDailog();
                                          });
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Dismissible(
                                            key: UniqueKey(),
                                            // only allows the user swipe from right to left
                                            direction:
                                                DismissDirection.endToStart,

                                            // In production enviroment, you may want to send some request to delete it on server side
                                            onDismissed: (_) {
                                              setState(() {
                                                //dummyNotification.removeAt(index);
                                              });
                                            },
                                            confirmDismiss: (direction) async {
                                              if (direction ==
                                                  DismissDirection.endToStart) {
                                                bool res = await showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return deleteDailog();
                                                    });
                                                return res;
                                              }
                                            },
                                            // It is a red background and a trash icon
                                            background: Container(
                                              color: Colors.red,
                                              child: Align(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.delete,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      " Delete",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                  ],
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                              ),
                                            ),

                                            child: ListTile(
                                              leading: Stack(
                                                clipBehavior: Clip.none,
                                                alignment: Alignment.topLeft,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        AssetsUtils
                                                            .ASSETS_BABY1_ICON),
                                                  ),
                                                  if (ncontroller
                                                          .notification
                                                          .value
                                                          .data![index]
                                                          .status ==
                                                      false)
                                                    Positioned(
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            SecondaryColor
                                                                .whiteColor,
                                                        radius: 7.sp,
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              CustomAccentColor
                                                                  .darkBlueColor,
                                                          radius: 5.sp,
                                                        ),
                                                      ),
                                                    )
                                                ],
                                              ),
                                              title: CustomRichText(
                                                ncontroller.notification.value
                                                    .data![index].description,
                                                dummyNotification[index]["msg"],
                                              ),
                                              subtitle: Text(
                                                  dummyNotification[index]
                                                      ["period"]!),
                                            ),
                                          ),
                                          Divider(
                                              color: SecondaryColor.greyColor),
                                        ],
                                      ),
                                    ),
                                  );
                                })
                          ],
                        )),
        ));
  }
}

Future<dynamic>? navigateToVaccineRecordScreen(String name, String childCode) {
  return Get.toNamed(VACCINE_RECORD_SCREEN_ROUTE, arguments: [name, childCode]);
}
