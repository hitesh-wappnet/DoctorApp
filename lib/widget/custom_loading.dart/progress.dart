import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

SimpleFontelicoProgressDialog _dialog =
    SimpleFontelicoProgressDialog(context: Get.context!);

void showCustomLoadingDialog() async {
  _dialog.show(
      backgroundColor: SecondaryColor.whiteColor,
      indicatorColor: CustomAccentColor.lightBlueColor,
      message: 'Please Wait...',
      radius: 10,
      type: SimpleFontelicoProgressDialogType.hurricane);
}

Future<void> closeCustomLoadingDialog() async {
  _dialog.hide();
}
