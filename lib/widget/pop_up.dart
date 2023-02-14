import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

Future<dynamic> customSuccessDialog(
    String title, String description, Future<dynamic>? nextScreen) {
  return AwesomeDialog(
    context: Get.context!,
    dialogType: DialogType.success,
    animType: AnimType.scale,
    title: title,
    desc: description,
    autoHide: Duration(seconds: 2),
    isDense: true,
    onDismissCallback: (Future) {
      nextScreen;
    },
  ).show();
}

Future<dynamic> customErrorDialog(String title, String description) {
  return AwesomeDialog(
    context: Get.context!,
    dialogType: DialogType.error,
    animType: AnimType.rightSlide,
    headerAnimationLoop: false,
    title: title,
    desc: description,
    btnOkOnPress: () {},
    //btnOkIcon: Icons.cancel,
    btnOkColor: Colors.red,
  ).show();
}
