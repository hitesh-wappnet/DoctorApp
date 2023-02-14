import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/constants/strings.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_application_1/helper/text_style/style.dart';
import 'package:flutter_application_1/screens/verify_otp_screen/verify_otp_controller.dart';
import 'package:flutter_application_1/utils/validation/validation.dart';
import 'package:flutter_application_1/widget/custom_button_widget/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

// ignore: use_key_in_widget_constructors
class VerifyOtpScreen extends StatelessWidget {
  final VerifyOtpScreenController vController =
      Get.find<VerifyOtpScreenController>();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: TextStyle(
          fontSize: 20.sp,
          color: CustomPrimaryColor.blackColor,
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: NeutralColor.lightBlueColor),
        borderRadius: BorderRadius.circular(10.sp),
      ),
    );

    // ignore: unused_local_variable
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: NeutralColor.lightBlueColor),
      borderRadius: BorderRadius.circular(10.sp),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: NeutralColor.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: CustomPrimaryColor.blackColor,
            )),
        title: Text(
          "Verify Otp",
          style: openSansHeadingStyle(
              color: CustomPrimaryColor.blackColor,
              fontFamily: FontFamliyO.REGULAR,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.sp),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            //  height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(VERIFY_OTP, style: openSansHeading36Style),
                  SizedBox(
                    height: 30.h,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "The code has been sent to your mail id. ",
                          style: openSansHeadingStyle(
                              fontFamily: FontFamliyO.REGULAR,
                              fontWeight: FontWeight.w600,
                              color: CustomPrimaryColor.blackColor,
                              fontSize: 16.sp),
                        ),
                        TextSpan(
                          // text: '${fcontroller.emailForgetPageController.text}',
                          style: openSansHeadingStyle(
                              fontFamily: FontFamliyO.REGULAR,
                              fontWeight: FontWeight.w600,
                              color: NeutralColor.lightBlueColor,
                              fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Form(
                    key: vController.VerifyFormKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Pinput(
                        length: 4,
                        forceErrorState: true,
                        controller: vController.pinController,
                        //defaultPinTheme: defaultPinTheme,
                        // focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,

                        showCursor: true,
                        onCompleted: (pin) => print(pin.toString()),

                        validator: otpValidator,
                        autofocus: true,
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  InkWell(
                      onTap: () {
                        vController.otpVerify();
                      },
                      child: AppButton(
                        text: "Verify",
                        height: 54.h,
                        width: 150.w,
                      )),
                  SizedBox(
                    height: 20.sp,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
