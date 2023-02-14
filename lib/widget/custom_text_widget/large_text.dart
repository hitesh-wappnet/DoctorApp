// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

//import 'package:co_vaccine/utils/font_family.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';

//Text Widget

class LargeText extends StatelessWidget {
  double? size;
  final String text;
  final Color color;
  final TextDecoration? decoration;
  FontWeight? weights;
  LargeText({
    Key? key,
    this.size,
    required this.text,
    this.color = CustomAccentColor.mediumBlueColor,
    this.decoration,
    this.weights,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          decoration: decoration,
          color: color,
          fontSize: size,
          fontWeight: FontWeight.bold,
          fontFamily: FontFamliyO.REGULAR),
    );
  }
}
