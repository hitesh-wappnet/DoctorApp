import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_application_1/helper/text_style/style.dart';
import 'package:flutter_application_1/routes/routes_const.dart';
import 'package:flutter_application_1/utils/validation/validation.dart';
import 'package:flutter_application_1/widget/custom_button_widget/custom_button.dart';
import 'package:flutter_application_1/widget/text_form_widget/text_form_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  final ResetPasswordController resetcontroller =
      Get.find<ResetPasswordController>();
  ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: NeutralColor.whiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Get.offAllNamed(LOGIN_SCREEN_ROUTE);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: CustomPrimaryColor.blackColor,
              )),
          title: Text(
            "Reset Password",
            style: openSansHeadingStyle(
                color: CustomPrimaryColor.blackColor,
                fontFamily: FontFamliyO.REGULAR,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: resetcontroller.resetPassWordFormKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.sp),
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          Text("Create New Password",
                              style: openSansHeading36Style),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      BuildTextFormField(
                        isObserve: false,
                        controller: resetcontroller.passwordResetPageController,
                        leftIcon: FaIcon(
                          Icons.lock,
                          color: SecondaryColor.greyIconColor,
                        ),
                        txtHint: 'Enter new password',
                        validation: passwordValidator,
                      ),
                      BuildTextFormField(
                        isObserve: false,
                        controller:
                            resetcontroller.confirmPasswordResetPageController,
                        leftIcon: FaIcon(
                          Icons.lock,
                          color: SecondaryColor.greyIconColor,
                        ),
                        txtHint: 'Confirm your new password',
                        validation: confirmpasswordResetValidator,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      InkWell(
                        onTap: () {
                          resetcontroller.resetPass();
                        },
                        child: AppButton(
                          text: 'Submit',
                          height: 54.h,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
