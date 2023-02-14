import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_application_1/helper/text_style/style.dart';

Widget CustomRichText(String? t1, String? t2) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: t1,
          style: openSansHeadingStyle(
              color: Colors.black,
              fontFamily: FontFamliyM.BOLD,
              fontWeight: FontWeight.w700),
        ),
        TextSpan(
          text: t2,
          style: openSansHeadingStyle(
              color: CustomPrimaryColor.blackColor,
              fontFamily: FontFamliyM.REGULAR,
              fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}
