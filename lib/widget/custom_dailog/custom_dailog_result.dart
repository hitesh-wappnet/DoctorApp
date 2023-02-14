import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_application_1/helper/text_style/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDialogBox extends StatefulWidget {
  final String? heading, title, descriptions, btn1Text, btn2Text;
  final Image? img;
  final Color? backgroundColor;
  final Icon? icon;

  final VoidCallback? onClicked;

  const CustomDialogBox(
      {Key? key,
      this.title,
      this.descriptions,
      this.heading,
      this.btn1Text,
      this.btn2Text,
      this.img,
      this.icon,
      this.backgroundColor,
      this.onClicked})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sp),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(Get.context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: 20.sp, top: 65.sp, right: 20.sp, bottom: 20.sp),
          margin: EdgeInsets.only(top: 45.sp),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: SecondaryColor.whiteColor,
            borderRadius: BorderRadius.circular(15.sp),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.heading ?? "",
                style: openSansHeadingStyle(
                    color: CustomPrimaryColor.blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamliyO.REGULAR),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 7.h,
              ),
              Text(
                widget.title ?? "",
                style: openSansHeadingStyle(
                    color: CustomPrimaryColor.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: FontFamilyP.REGULAR),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 7.h,
              ),
              Text(
                widget.descriptions!,
                style: openSansHeadingStyle(
                    color: SecondaryColor.greyColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamilyP.REGULAR),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 7.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.btn1Text == ""
                      ? SizedBox()
                      : SizedBox(
                          height: 40.h,
                          width: 130.w,
                          child: ElevatedButton(
                            onPressed: () {
                              widget.onClicked!();
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.sp)),
                                backgroundColor: widget.backgroundColor ??
                                    CustomSematicColor.redColor),
                            child: Text(
                              widget.btn1Text!,
                              style: poppinsHeadingStyle(
                                  fontFamily: FontFamilyP.REGULAR,
                                  fontSize: 12.sp),
                            ),
                          ),
                        ),
                  SizedBox(
                    width: 10.w,
                  ),
                  widget.btn1Text == ""
                      ? SizedBox()
                      : SizedBox(
                          height: 40.h,
                          width: 130.w,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.sp)),
                                backgroundColor: SecondaryColor.greyColor),
                            child: Text(
                              widget.btn2Text!,
                              style: poppinsHeadingStyle(
                                  fontFamily: FontFamilyP.REGULAR,
                                  fontSize: 12.sp),
                            ),
                          ),
                        ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          left: 20.sp,
          right: 20.sp,
          child: CircleAvatar(
            backgroundColor: SecondaryColor.whiteColor,
            radius: 47.sp,
            child: CircleAvatar(
              backgroundColor:
                  widget.backgroundColor ?? CustomSematicColor.redColor,
              radius: 45.sp,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: widget.icon ??
                    Icon(
                      Icons.delete_forever_rounded,
                      size: 50.sp,
                    ),
                color: SecondaryColor.whiteColor,
                onPressed: () {},
              ),
            ),
          ),
        )
      ],
    );
  }
}
