import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/constants/strings.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_application_1/routes/routes_const.dart';
import 'package:flutter_application_1/screens/login_screen/login_screen_controller.dart';

import 'package:flutter_application_1/utils/assets/assets_util.dart';
import 'package:flutter_application_1/utils/validation/validation.dart';
import 'package:flutter_application_1/widget/custom_button_widget/custom_button.dart';
import 'package:flutter_application_1/widget/custom_text_widget/large_text.dart';
import 'package:flutter_application_1/widget/text_form_widget/text_form_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<LoginController> {
  //Intialize  Controller
  final LoginController lcontroller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: NeutralColor.whiteColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                child: Form(
                    key: lcontroller.loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 60.h,
                        ),
                        Center(
                          child: Image.asset(AssetsUtils.ASSETS_LOGIN_ICON),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        LargeText(
                          text: 'Welcome back !',
                          size: 39.sp,
                        ),
                        BuildTextFormField(
                          textType: TextInputType.emailAddress,
                          isObserve: false,
                          controller: lcontroller.emailLoginPageController,
                          leftIcon: FaIcon(Icons.person_outline_rounded,
                              color: SecondaryColor.greyIconColor),
                          txtHint: ENTER_EMAIL,
                          validation: emailValidator,
                        ),
                        Obx(() => BuildTextFormField(
                            isObserve: lcontroller.hiddenPassword.value,
                            controller: lcontroller.passwordLoginPageController,
                            leftIcon: FaIcon(Icons.lock_outlined,
                                color: SecondaryColor.greyIconColor),
                            txtHint: ENTER_PASSWORD,
                            //validation: passwordValidator,
                            icon: IconButton(
                                onPressed: () {
                                  lcontroller.hiddenPassword.value =
                                      !lcontroller.hiddenPassword.value;
                                },
                                icon: lcontroller.hiddenPassword.value
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: SecondaryColor.greyIconColor,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: SecondaryColor.greyIconColor,
                                      )))),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(FORGET_PASSWORD_SCREEN_ROUTE);
                              },
                              child: LargeText(
                                text: 'Forgot Password?',
                                size: 14.sp,
                                color: CustomPrimaryColor.darkGreenColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        InkWell(
                            onTap: () {
                              //lcontroller.registerUserWithEmail();
                              lcontroller.loginUserWithEmail();
                            },
                            child: AppButton(
                              text: SIGNIN,
                              height: 55.h,
                            )),
                        SizedBox(
                          height: 30.h,
                        ),
                        Column(
                          children: [
                            Center(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Create new account?",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              CustomPrimaryColor.darkGreenColor,
                                          fontFamily: FontFamliyO.REGULAR),
                                    ),
                                    TextSpan(
                                        text: 'Click here',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                CustomAccentColor.darkBlueColor,
                                            fontFamily: FontFamliyO.REGULAR),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.toNamed(
                                                REGISTERATION_SCREEN_ROUTE);
                                          }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
