import 'package:flutter_application_1/screens/reset_password/reset_password_controller.dart';
import 'package:flutter_application_1/screens/resigteration_screen/resigteration_screen_controller.dart';
import 'package:flutter_application_1/screens/verify_otp_screen/verify_otp_controller.dart';
import 'package:get/get.dart';

final RegisterationController rcontroller = Get.put(RegisterationController());
final ResetPasswordController resetcontroller =
    Get.put(ResetPasswordController());
final VerifyOtpScreenController vController =
    Get.put(VerifyOtpScreenController());

String? nameValidator(String? value) {
  String pattern = r'^[a-zA-Z_-]+$';
  RegExp regex = new RegExp(pattern);

  if (value!.isEmpty) {
    return 'This field must be filled';
  } else if (!regex.hasMatch(value)) {
    return 'Enter Alphabets only';
  }
  return null;
}

String? suggestionValidator(String? value) {
  if (value!.isEmpty) {
    return 'This field must be filled';
  }

  return null;
}

String? emailValidator(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);

  if (value!.isEmpty) {
    return 'This field must be filled';
  } else if (!regex.hasMatch(value)) {
    return 'Please enter valid email';
  }
  return null;
}

String? passwordValidator(String? value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = new RegExp(pattern);

  if (value!.isEmpty) {
    return 'This field must be filled';
  } else if (!regex.hasMatch(value)) {
    return 'Use 8 or more characters with a mix of capital & small letters, \nnumbers & symbols';
  }
  return null;
}

String? confirmpasswordValidator(String? value) {
  if (value!.isEmpty) {
    return 'This field must be filled';
  } else if (value != rcontroller.passwordSignUpPageController.text) {
    return 'Password and confirm password must be same';
  }
  return null;
}

String? confirmpasswordResetValidator(String? value) {
  if (value!.isEmpty) {
    return 'This field must be filled';
  } else if (value != resetcontroller.passwordResetPageController.text) {
    return 'Password and confirm password must be same';
  }
  return null;
}

String? checkBoxValidator(String? value) {
  if (rcontroller.chekBox.value != true) {
    return 'This field must be filled';
  }
  return null;
}

String? otpValidator(String? value) {
  if (value!.isEmpty) {
    return 'This field must be filled';
  } else if (vController.pinController.text.length <= 3) {
    return 'All field must be filled';
  }

  return null;
}

String? isMobileNumberValid(String? phoneNumber) {
  String regexPattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
  var regExp = new RegExp(regexPattern);

  if (phoneNumber!.isEmpty) {
    return "This field must be filled";
  } else if (regExp.hasMatch(phoneNumber)) {
    return null;
  }
  return 'please enter valid phone number';
}

String? isAddressValid(String? address) {
  String? regexPattern = r'^[#.0-9a-zA-Z\s,-]+$';
  var regExp = new RegExp(regexPattern);
  var aaa = address!.trim();
  print(aaa);
  if (address.trim().isEmpty) {
    return 'This field must be filled';
  } else if (regExp.hasMatch(aaa)) {
    return null;
  }
  return 'please enter valid address';
}

String? isSpecializationValid(String? value) {
  String? regexPattern = r'^[#.0-9a-zA-Z\s,-]+$';
  var regExp = new RegExp(regexPattern);
  var aaa = value!.trim();
  print(aaa);
  if (value.trim().isEmpty) {
    return 'This field must be filled';
  } else if (regExp.hasMatch(aaa)) {
    return null;
  }
  return 'please enter valid address';
}

String? isQualificationValid(String? value) {
  String? regexPattern = r'^[#.0-9a-zA-Z\s,-]+$';
  var regExp = new RegExp(regexPattern);
  var aaa = value!.trim();
  print(aaa);
  if (value.trim().isEmpty) {
    return 'This field must be filled';
  } else if (regExp.hasMatch(aaa)) {
    return null;
  }
  return 'please enter valid address';
}
