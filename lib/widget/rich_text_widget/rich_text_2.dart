import 'package:flutter/material.dart';

import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_application_1/helper/text_style/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget CustomRichText2(String? t1, String? t2, Color? colors, Color? colors2,
    double? sizes, double? sizes2) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: t1,
          style: openSansHeadingStyle(
            color: colors,
            fontFamily: FontFamliyO.REGULAR,
            fontWeight: FontWeight.w700,
            fontSize: sizes ?? 12.sp,
          ),
        ),
        TextSpan(
          text: t2,
          style: openSansHeadingStyle(
              color: colors2,
              fontFamily: FontFamliyO.REGULAR,
              fontWeight: FontWeight.w700,
              fontSize: sizes2),
        ),
      ],
    ),
  );
}
