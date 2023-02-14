import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/constants/strings.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';

import 'package:flutter_application_1/screens/resigteration_screen/resigteration_screen_controller.dart';
import 'package:flutter_application_1/utils/assets/assets_util.dart';
import 'package:flutter_application_1/utils/validation/validation.dart';

import 'package:flutter_application_1/widget/custom_text_widget/large_text.dart';
import 'package:flutter_application_1/widget/text_form_widget/text_form_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:flutter_application_1/widget/custom_button_widget/custom_button.dart';

class RegisterationScreen extends GetWidget<RegisterationController> {
  final RegisterationController rcontroller =
      Get.find<RegisterationController>();
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
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height,
                  child: Form(
                      key: rcontroller.registrationFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 90.h,
                          ),
                          LargeText(
                            text: 'Register',
                            size: 39.sp,
                          ),
                          BuildTextFormField(
                            textType: TextInputType.name,
                            isObserve: false,
                            controller:
                                rcontroller.firstNameSignUpPageController,
                            leftIcon: FaIcon(Icons.person_outlined,
                                color: SecondaryColor.greyIconColor),
                            txtHint: FIRST_NAME,
                            validation: nameValidator,
                          ),
                          BuildTextFormField(
                            textType: TextInputType.name,
                            isObserve: false,
                            controller:
                                rcontroller.lastNameSignUpPageController,
                            leftIcon: FaIcon(Icons.person_outlined,
                                color: SecondaryColor.greyIconColor),
                            txtHint: LAST_NAME,
                            validation: nameValidator,
                          ),
                          BuildTextFormField(
                            textType: TextInputType.emailAddress,
                            isObserve: false,
                            controller: rcontroller.emailSignUpPageController,
                            leftIcon: FaIcon(Icons.mail_outlined,
                                color: SecondaryColor.greyIconColor),
                            txtHint: ENTER_EMAIL,
                            validation: emailValidator,
                          ),
                          Obx(() => BuildTextFormField(
                              isObserve: rcontroller.hiddenPasswords.value,
                              controller:
                                  rcontroller.passwordSignUpPageController,
                              leftIcon: FaIcon(Icons.lock_outlined,
                                  color: SecondaryColor.greyIconColor),
                              txtHint: ENTER_PASSWORD,
                              validation: passwordValidator,

                              // ignore: prefer_const_constructors
                              icon: IconButton(
                                  onPressed: () {
                                    rcontroller.hiddenPasswords.value =
                                        !rcontroller.hiddenPasswords.value;
                                  },
                                  icon: rcontroller.hiddenPasswords.value
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: SecondaryColor.greyIconColor,
                                        )
                                      : Icon(
                                          Icons.visibility,
                                          color: SecondaryColor.greyIconColor,
                                        )))),
                          Obx(() => BuildTextFormField(
                                isObserve: rcontroller.hiddenPasswords.value,
                                controller: rcontroller
                                    .repeatPasswordSignUpPageController,
                                leftIcon: FaIcon(Icons.lock_outlined,
                                    color: SecondaryColor.greyIconColor),
                                txtHint: CONFIRM_PASSWORD,
                                validation: confirmpasswordValidator,

                                // ignore: prefer_const_constructors
                              )),
                          BuildTextFormField(
                            textType: TextInputType.phone,
                            isObserve: false,
                            controller:
                                rcontroller.phoneNumberSignUpPageController,
                            leftIcon: FaIcon(Icons.phone,
                                color: SecondaryColor.greyIconColor),
                            txtHint: 'Phone number',
                            validation: isMobileNumberValid,
                          ),
                          BuildTextFormField(
                            textType: TextInputType.streetAddress,
                            isObserve: false,
                            controller: rcontroller.addressSignUpPageController,
                            leftIcon: FaIcon(Icons.badge_rounded,
                                color: SecondaryColor.greyIconColor),
                            txtHint: 'Address',
                            validation: isAddressValid,
                          ),
                          BuildTextFormField(
                            isObserve: false,
                            controller:
                                rcontroller.specializationSignUpPageController,
                            leftIcon: FaIcon(FontAwesomeIcons.stethoscope,
                                color: SecondaryColor.greyIconColor),
                            txtHint: 'Specialization',
                            validation: isSpecializationValid,
                          ),
                          BuildTextFormField(
                            isObserve: false,
                            controller:
                                rcontroller.qualificationSignUpPageController,
                            leftIcon: FaIcon(Icons.school,
                                color: SecondaryColor.greyIconColor),
                            txtHint: 'Qualification',
                            validation: isQualificationValid,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          InkWell(
                              onTap: () {
                                rcontroller.registerUserWithEmail();
                              },
                              child: AppButton(
                                text: REGISTER,
                                height: 55.h,
                              )),
                          SizedBox(
                            height: 30.h,
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Already have an account?",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            CustomPrimaryColor.darkGreenColor,
                                        fontFamily: FontFamliyO.REGULAR),
                                  ),
                                  TextSpan(
                                      text: 'Login',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              CustomAccentColor.darkBlueColor,
                                          fontFamily: FontFamliyO.REGULAR),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.back();
                                        }),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100.h,
                          )
                        ],
                      )),
                ),
                Positioned(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: SvgPicture.asset(
                          AssetsUtils.ASSETS_STETHOSCOPE_UP_ICON)),
                ),
                Positioned(
                  right: 0.0,
                  left: 0.0,
                  bottom: 0.0,
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: SvgPicture.asset(
                          AssetsUtils.ASSETS_STETHOSCOPE_ICON)),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
