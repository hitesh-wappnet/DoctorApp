import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/widget/custom_button_widget/custom_button.dart';
import 'package:flutter_application_1/widget/custom_text_widget/large_text.dart';
import 'package:flutter_application_1/widget/text_form_widget/dailog_text_form_widget.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

TextEditingController dob = TextEditingController();

void showCustomDialog(bool isEdit) => showDialog(
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Row(
                  children: [
                    LargeText(
                      text: isEdit ? 'Modify Vaccine' : 'Add Vaccine',
                      color: CustomPrimaryColor.blackColor,
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.clear))
                  ],
                ),
              ),
              Divider(height: 1, color: SecondaryColor.greyColor),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Column(
                  children: [
                    DailogTextFormField(
                      txtHint: 'Vaccine name',
                      hint: 'Enter Vaccine',
                    ),
                    DailogTextFormField(
                      txtHint: 'Given Dose',
                      hint: 'Enter given dose no.',
                    ),
                    DailogTextFormField(
                      txtHint: 'Status',
                      hint: 'Upcoming',
                    ),
                    DailogTextFormField(
                      icon: IconButton(
                        icon: Icon(Icons.date_range_outlined),
                        onPressed: () {},
                      ),
                      readOnly: true,
                      onClicked: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2001),
                            lastDate: DateTime.now());
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);

                          dob.text =
                              formattedDate; //set foratted date to TextField value.

                        } else {
                          print("Date is not selected");
                        }
                      },
                      controller: dob,
                      hint: "DD/MM/YYYY",
                      txtHint: "Date",
                      //validation: emailValidator,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    AppButton(
                      text: 'Add',
                      height: 50.h,
                      width: 256.h,
                      radius: 12.sp,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      context: Get.context!,
      barrierDismissible: false,
    );
