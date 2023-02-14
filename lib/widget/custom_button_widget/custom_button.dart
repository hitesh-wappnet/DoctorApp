// ignore_for_file: public_member_api_docs, sort_constructors_first, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable

//Button Widget
// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  bool? isResponsive;
  Color? mycolor;
  double? width;
  double? height;
  String text;
  double? radius;
  double? sizes;
  AppButton({
    Key? key,
    this.isResponsive = false,
    this.mycolor,
    this.width,
    this.height,
    required this.text,
    this.radius,
    this.sizes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isResponsive == true ? double.maxFinite : width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 20),
          color: mycolor ?? CustomAccentColor.lightBlueColor),
      child: Row(
        mainAxisAlignment: isResponsive == true
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          isResponsive == true
              ? Container(
                  margin: EdgeInsets.only(left: 30.sp),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: sizes ?? 20.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamliyO.REGULAR),
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: sizes ?? 20.sp,
                      fontWeight: FontWeight.w900,
                      fontFamily: FontFamliyO.REGULAR),
                ),
        ],
      ),
    );
  }
}
