// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DailogTextFormField extends StatelessWidget {
  final FaIcon? leftIcon;
  final String? txtHint;

  bool? readOnly = false;
  final IconButton? icon;
  String? Function(String?)? validation;
  TextEditingController? controller;
  final VoidCallback? onClicked;
  String? hint;

  //Text Form Widget
  DailogTextFormField({
    Key? key,
    this.leftIcon,
    this.txtHint,
    this.icon,
    this.validation,
    this.controller,
    this.onClicked,
    this.readOnly,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.sp),
      child: TextFormField(
        validator: validation,
        onTap: onClicked,
        readOnly: readOnly ?? false,
        cursorColor: SecondaryColor.greyColor,
        controller: controller,
        style: TextStyle(
            fontSize: 16.sp,
            color: SecondaryColor.greyColor,
            fontFamily: FontFamilyP.REGULAR,
            fontWeight: FontWeight.w600),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          suffixIcon: icon,
          prefixIcon: Padding(
            padding: EdgeInsets.all(10.0.sp),
            child: SizedBox(child: leftIcon),
          ),
          contentPadding:
              EdgeInsets.only(top: 10.sp, left: 15.sp, bottom: 10.sp),
          border: InputBorder.none,
          isDense: false,
          label: Text(
            txtHint!,
            style: TextStyle(
                fontFamily: FontFamilyP.REGULAR,
                color: CustomPrimaryColor.blackColor),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          labelStyle: TextStyle(
              fontSize: 16.sp,
              color: SecondaryColor.greyColor,
              fontFamily: FontFamilyP.REGULAR,
              fontWeight: FontWeight.w600),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.sp),
              borderSide:
                  BorderSide(color: SecondaryColor.greyColor, width: 1.w)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.sp),
              borderSide:
                  BorderSide(color: SecondaryColor.greyColor, width: 1.w)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.sp),
              borderSide:
                  BorderSide(color: SecondaryColor.greyColor, width: 1.w)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.sp),
              borderSide:
                  BorderSide(color: SecondaryColor.greyColor, width: 1.w)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.sp),
              borderSide:
                  BorderSide(color: SecondaryColor.greyColor, width: 1.w)),
        ),
      ),
    );
  }
}
