// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';

class AppSmallText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  AppSmallText({
    Key? key,
    this.size = 20,
    required this.text,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.bold,
          fontFamily: FontFamliyM.REGULAR),
    );
  }
}
