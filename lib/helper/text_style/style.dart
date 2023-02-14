import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle? openSansHeadingStyle(
    {Color? color,
    FontWeight? fontWeight,
    String? fontFamily,
    double? fontSize}) {
  return TextStyle(
      fontSize: fontSize ?? 14.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Colors.white,
      fontFamily: fontFamily ?? FontFamliyO.REGULAR);
}

TextStyle? montserratHeadingStyle(
    {Color? color,
    FontWeight? fontWeight,
    String? fontFamily,
    double? fontSize}) {
  return TextStyle(
      fontSize: fontSize ?? 12.sp,
      overflow: TextOverflow.visible,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Colors.white,
      fontFamily: fontFamily ?? FontFamliyM.SEMIBOLD);
}

TextStyle montserratHeading1Style = TextStyle(
    fontSize: 36.sp,
    color: SecondaryColor.greyColor,
    fontFamily: FontFamliyM.SEMIBOLD,
    fontWeight: FontWeight.w600);

TextStyle montserratHeading4tyle = TextStyle(
    fontSize: 16.sp,
    color: SecondaryColor.greyColor,
    fontFamily: FontFamliyM.SEMIBOLD,
    fontWeight: FontWeight.w600);
TextStyle? poppinsHeadingStyle(
    {Color? color,
    FontWeight? fontWeight,
    String? fontFamily,
    double? fontSize}) {
  return TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: fontSize ?? 12.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Colors.white,
      fontFamily: fontFamily ?? FontFamilyP.REGULAR);
}

TextStyle openSansHeading36Style = TextStyle(
    color: NeutralColor.lightBlueColor,
    fontFamily: FontFamliyO.REGULAR,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.visible,
    fontSize: 36.sp);
