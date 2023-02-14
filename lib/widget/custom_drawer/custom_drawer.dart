import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_application_1/helper/text_style/style.dart';
import 'package:flutter_application_1/routes/routes_const.dart';
import 'package:flutter_application_1/screens/login_screen/login_screen_controller.dart';
import 'package:flutter_application_1/utils/assets/assets_util.dart';
import 'package:flutter_application_1/widget/custom_dailog/custom_dailog_result.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFF4F4F4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.sp),
            child: createDrawerHeader(),
          ),
          SizedBox(
            height: 11.h,
          ),
          createDrawerBodyItem(
              icon: AssetsUtils.ASSETS_HOME,
              colors: CustomAccentColor.lightBlueColorO,
              text: 'Home',
              colort: CustomPrimaryColor.blueColor,
              onTap: () => Get.toNamed(HOME_SCREEN_ROUTE)),
          createDrawerBodyItem(
              icon: AssetsUtils.ASSETS_PROFILE,
              text: 'Profile',
              onTap: () => Get.offAndToNamed(PROFILE_SCREEN_ROUTE)),
          createDrawerBodyItem(
              icon: AssetsUtils.ASSETS_NOTIFICATION,
              text: 'Notification',
              onTap: () => Get.offAndToNamed(NOTIFICATION_SCREEN_ROUTE)),
          createDrawerBodyItem(
              icon: AssetsUtils.ASSETS_SUGGESTION,
              text: 'Doctor Suggestion',
              onTap: () => Get.offAndToNamed(DOCTOR_SUGGESTION_SCREEN_ROUTE)),
          Expanded(
              child:
                  Container()), // Add this to force the bottom items to the lowest point
          Divider(
            height: 2.sp,
            thickness: 2.sp,
          ),
          Padding(
            padding: EdgeInsets.all(20.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Sign Out",
                  style: poppinsHeadingStyle(
                      color: CustomAccentColor.darkBlueColor,
                      fontFamily: FontFamilyP.REGULAR,
                      fontSize: 16.sp),
                ),
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: CustomAccentColor.darkBlueColor,
                    size: 25.sp,
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createDrawerBodyItem(
      {String? icon,
      String? text,
      GestureTapCallback? onTap,
      Color? colors,
      Color? colort}) {
    return ListTile(
      tileColor: colors,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            icon ?? "",
            height: 20.sp,
            width: 20.sp,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text!,
              style: TextStyle(color: colort),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Color(0xFFF4F4F4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomRight,
              children: [
                SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(AssetsUtils.ASSETS_DOCTOR_ICON),
                    radius: 20.sp,
                  ),
                ),
                Positioned(
                  child: CircleAvatar(
                    backgroundColor: SecondaryColor.whiteColor,
                    radius: 13.sp,
                    child: CircleAvatar(
                      backgroundColor: CustomAccentColor.lightGreenColor,
                      radius: 10.sp,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "john Washington",
              style: poppinsHeadingStyle(
                  fontSize: 18.sp,
                  fontFamily: FontFamilyP.REGULAR,
                  color: CustomPrimaryColor.blackColor,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: CustomAccentColor.lightGreenColor,
                  radius: 9.sp,
                  child: Icon(
                    Icons.done,
                    size: 15.sp,
                  ),
                ),
                SizedBox(
                  width: 6.sp,
                ),
                Text(
                  'Verified Doctor',
                  style: poppinsHeadingStyle(
                      fontSize: 12.sp,
                      fontFamily: FontFamilyP.REGULAR,
                      color: CustomPrimaryColor.blackColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ));
  }
}
