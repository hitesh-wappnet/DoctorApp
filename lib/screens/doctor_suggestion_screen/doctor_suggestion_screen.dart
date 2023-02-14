import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/screens/doctor_suggestion_screen/doctor_suggestion_screen_controller.dart';
import 'package:flutter_application_1/utils/validation/validation.dart';
import 'package:flutter_application_1/widget/custom_button_widget/custom_button.dart';
import 'package:flutter_application_1/widget/custom_text_widget/large_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorSuggestion extends GetWidget<DoctorScreenController> {
  DoctorSuggestion({super.key});
  final DoctorScreenController suggestioncontroller =
      Get.put(DoctorScreenController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black, size: 30.sp),
          elevation: 0,
          toolbarHeight: 63.h,
          title: LargeText(
            text: 'Suggestions',
            color: CustomPrimaryColor.blackColor,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              Form(
                key: suggestioncontroller.SuggestionformKey,
                child: TextFormField(
                  validator: suggestionValidator,
                  controller: suggestioncontroller.suggestionPageController,
                  decoration: InputDecoration(
                    iconColor: SecondaryColor.greyColor,
                    hintText: "Enter your valuable feedback as doctor",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                        borderSide: BorderSide(
                            color: SecondaryColor.greyColor, width: 1.w)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                        borderSide: BorderSide(
                            color: SecondaryColor.greyColor, width: 1.w)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                        borderSide: BorderSide(
                            color: SecondaryColor.greyColor, width: 1.w)),
                  ),
                  minLines: 10,
                  maxLines: 20,
                  keyboardType: TextInputType.multiline,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              InkWell(
                onTap: () {
                  suggestioncontroller.DoctorSuggestion();
                },
                child: AppButton(
                  text: 'Suggest',
                  height: 45.h,
                  width: 144.w,
                  radius: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
