import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/constants/strings.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_application_1/helper/text_style/style.dart';
import 'package:flutter_application_1/routes/routes_const.dart';
import 'package:flutter_application_1/screens/forgot_password_screen/forgot_password_controller.dart';
import 'package:flutter_application_1/utils/validation/validation.dart';
import 'package:flutter_application_1/widget/custom_button_widget/custom_button.dart';
import 'package:flutter_application_1/widget/text_form_widget/text_form_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  //Intialize Controller
  final ForgetPasswordController fcontroller =
      Get.find<ForgetPasswordController>();
  ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Forgot Password",
          style: openSansHeadingStyle(
              color: CustomPrimaryColor.blackColor,
              fontFamily: FontFamliyO.REGULAR,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.sp),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Text(FORGOT_PASSWORD, style: openSansHeading36Style),
              SizedBox(
                height: 30.h,
              ),
              Text('Enter Email to contact you to forgot your password',
                  textAlign: TextAlign.center,
                  style: montserratHeadingStyle(
                      color: CustomPrimaryColor.blackColor,
                      fontSize: 14.sp,
                      fontFamily: FontFamliyM.SEMIBOLD,
                      fontWeight: FontWeight.bold)),
              Form(
                key: fcontroller.forgetScreenFormKey,
                child: BuildTextFormField(
                  isObserve: false,
                  controller: fcontroller.emailForgetPageController,
                  leftIcon: FaIcon(
                    Icons.mail,
                    color: SecondaryColor.greyIconColor,
                  ),
                  txtHint: EMAIL,
                  validation: emailValidator,
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  fcontroller.forgetPasswordWithEmail();
                },
                child: AppButton(
                  //Custom Button
                  text: CONTINUE,
                  height: 54.h,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
