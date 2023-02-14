// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_application_1/helper/text_style/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildTextFormField extends StatefulWidget {
  final FaIcon? leftIcon;
  final String? txtHint;
  bool isObserve = false;
  bool? readOnly = false;
  final IconButton? icon;
  String? Function(String?)? validation;
  TextEditingController? controller;
  final VoidCallback? onClicked;
  TextInputType? textType;
  //Text Form Widget
  BuildTextFormField({
    Key? key,
    this.leftIcon,
    this.txtHint,
    required this.isObserve,
    this.icon,
    this.validation,
    this.controller,
    this.onClicked,
    this.readOnly,
    this.textType,
  }) : super(key: key);

  @override
  State<BuildTextFormField> createState() => _BuildTextFormFieldState();
}

class _BuildTextFormFieldState extends State<BuildTextFormField> {
  bool isError = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.sp),
      child: TextFormField(
        onChanged: (value) {
          widget.validation == null;
          setState(() {
            isError = false;
          });
        },
        keyboardType: widget.textType,
        validator: widget.validation,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onTap: widget.onClicked,
        readOnly: widget.readOnly ?? false,
        obscureText: widget.isObserve,
        cursorColor: CustomPrimaryColor.blackColor,
        controller: widget.controller,
        style: montserratHeadingStyle(
            color: CustomPrimaryColor.blackColor,
            fontSize: 16.sp,
            fontFamily: FontFamliyM.REGULAR),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          suffixIcon: widget.icon,
          prefixIcon: Padding(
            padding: EdgeInsets.all(10.0.sp),
            child: SizedBox(child: widget.leftIcon),
          ),
          contentPadding:
              EdgeInsets.only(top: 10.sp, left: 15.sp, bottom: 10.sp),
          border: InputBorder.none,
          isDense: false,
          labelText: widget.txtHint,
          errorStyle: TextStyle(color: CustomSematicColor.redColor),
          labelStyle: montserratHeading4tyle,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.sp),
              borderSide: BorderSide(
                  color: isError
                      ? SecondaryColor.greyColor
                      : CustomSematicColor.darkGreenColor,
                  width: 1.w)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.sp),
              borderSide:
                  BorderSide(color: SecondaryColor.greyColor, width: 1.w)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.sp),
              borderSide: BorderSide(
                  color: CustomSematicColor.orangeColor, width: 1.w)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.sp),
              borderSide:
                  BorderSide(color: CustomSematicColor.redColor, width: 1.w)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.sp),
              borderSide:
                  BorderSide(color: CustomSematicColor.redColor, width: 1.w)),
        ),
      ),
    );
  }
}
