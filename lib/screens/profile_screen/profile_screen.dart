// ignore_for_file: unused_element, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';

import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_application_1/helper/text_style/style.dart';
import 'package:flutter_application_1/screens/login_screen/login_screen_controller.dart';
import 'package:flutter_application_1/screens/profile_screen/profile_screen_controller.dart';
import 'package:flutter_application_1/utils/assets/assets_util.dart';

import 'package:flutter_application_1/widget/custom_dailog/custom_dailog_result.dart';
import 'package:flutter_application_1/widget/profile_widget/profile_widget.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileScreenController pController =
      Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black, size: 30.sp),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout_sharp,
              size: 24.sp,
              color: CustomPrimaryColor.blackColor,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogBox(
                        heading: "Logout",
                        title: "Are you sure you want to Logout ?",
                        descriptions: "",
                        btn1Text: "Logout",
                        icon: Icon(Icons.logout_sharp),
                        btn2Text: "Cancel",
                        onClicked: () {
                          LoginController.logout();
                        });
                  });
            },
          ),
        ],
      ),
      body: GetBuilder<ProfileScreenController>(
        init: ProfileScreenController(),
        builder: (controller) {
          return GetX<ProfileScreenController>(
            builder: (_) {
              if (controller.isApiLoad.value) {
                return Center(
                    child: Lottie.asset('assets/images/profile_loading.json'));
              } else {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            Image(
                                height: 200.h,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    AssetsUtils.ASSETS_BACKGROUND_ICON)),
                            Positioned(
                              bottom: -50.sp,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50.sp,
                                child: ProfileWidget(
                                  imagePath: AssetsUtils.ASSETS_DOCTOR_ICON,
                                  isEdit: true,
                                  onClicked: () {
                                    print('photoclick');
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 15.sp, bottom: 15.sp),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  backgroundColor: NeutralColor.lightBlueColor,
                                  radius: 15.sp,
                                  child: Icon(
                                    Icons.add_a_photo,
                                    size: 15.sp,
                                    color: SecondaryColor.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 75.h,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  pController.profile?.data?.firstName ?? "",
                                  style: poppinsHeadingStyle(
                                      fontSize: 24.sp,
                                      color: CustomPrimaryColor.blackColor),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  pController.profile?.data?.lastName ?? "",
                                  style: poppinsHeadingStyle(
                                      fontSize: 24.sp,
                                      color: CustomPrimaryColor.blackColor),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              pController.profile?.data?.email ?? "",
                              style: openSansHeadingStyle(
                                  color: SecondaryColor.greyIconColor,
                                  fontFamily: FontFamliyO.REGULAR,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            color: SecondaryColor.whiteColors,
                            borderRadius: BorderRadius.circular(30.sp)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 21.sp, horizontal: 27.sp),
                              child: Row(
                                children: [
                                  Icon(Icons.phone_outlined),
                                  SizedBox(
                                    width: 17.sp,
                                  ),
                                  Text(
                                    'Hospital Contact',
                                    style: poppinsHeadingStyle(
                                        fontSize: 12.sp,
                                        color: CustomPrimaryColor.blackColor),
                                  ),
                                  Spacer(),
                                  Text(
                                    '${pController.profile?.data?.phone} ',
                                    style: poppinsHeadingStyle(
                                        fontSize: 10.sp,
                                        color: CustomPrimaryColor.blackColor),
                                  ),
                                ],
                              ),
                            ),
                            Divider(height: 1, color: SecondaryColor.greyColor),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 21.sp, horizontal: 27.sp),
                              child: Row(
                                children: [
                                  Icon(Icons.badge),
                                  SizedBox(
                                    width: 17.sp,
                                  ),
                                  Text(
                                    'Hospital Address',
                                    style: poppinsHeadingStyle(
                                        fontSize: 12.sp,
                                        color: CustomPrimaryColor.blackColor),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    width: 100.w,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          pController.profile?.data?.address ??
                                              "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: poppinsHeadingStyle(
                                              fontSize: 10.sp,
                                              color: CustomPrimaryColor
                                                  .blackColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(height: 1, color: SecondaryColor.greyColor),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 21.sp, horizontal: 27.sp),
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.stethoscope,
                                    size: 21.sp,
                                  ),
                                  SizedBox(
                                    width: 17.sp,
                                  ),
                                  Text(
                                    'Specialization',
                                    style: poppinsHeadingStyle(
                                        fontSize: 12.sp,
                                        color: CustomPrimaryColor.blackColor),
                                  ),
                                  Spacer(),
                                  Text(
                                    pController.profile?.data?.specialization ??
                                        "",
                                    style: poppinsHeadingStyle(
                                        fontSize: 10.sp,
                                        color: CustomPrimaryColor.blackColor),
                                  ),
                                ],
                              ),
                            ),
                            Divider(height: 1, color: SecondaryColor.greyColor),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 21.sp, horizontal: 27.sp),
                              child: Row(
                                children: [
                                  Icon(Icons.school_outlined),
                                  SizedBox(
                                    width: 17.sp,
                                  ),
                                  Text(
                                    'Degree',
                                    style: poppinsHeadingStyle(
                                        fontSize: 12.sp,
                                        color: CustomPrimaryColor.blackColor),
                                  ),
                                  Spacer(),
                                  Text(
                                    pController.profile?.data?.degree ?? "",
                                    style: poppinsHeadingStyle(
                                        fontSize: 10.sp,
                                        color: CustomPrimaryColor.blackColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
