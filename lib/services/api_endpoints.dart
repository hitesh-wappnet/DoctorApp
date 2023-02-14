// ignore_for_file: unused_element

class ApiEndPoint {
  static const String baseUrl = "http://192.168.10.148:8000/api/";
  static _AuthEndPoint authEndPoint = _AuthEndPoint();
  static _UserProfileEndPoint userProfileEndPoint = _UserProfileEndPoint();
  static _DoctorEndPoint doctorEndPoint = _DoctorEndPoint();
  static _NotificationEndPoint notificationEndPoint = _NotificationEndPoint();
}

class _AuthEndPoint {
  final String login = "auth/login/";
  final String registeration = "auth/doctor_register/";
  final String forgotPassword = "auth/forget-password/";
  final String verifyOtp = "auth/verify-otp/";
  final String resetPassword = "auth/reset-password/";
}

class _DoctorEndPoint {
  final String searchChild = "doctor/search/";
  final String connectedChild = "doctor/get_viewdata_approve_childrens/";
  final String suggestion = "doctor/suggestion/";
  final String requestAndViewData = "doctor/child_data/";
  final String recentRequest = "doctor/get_viewdata_all_childrens/";
  final String vaccineData = "doctor/get_upcoming_vaccine_childrens/";
}

class _UserProfileEndPoint {
  final String getUserProfile = "user_profile/profile/";
}

class _NotificationEndPoint {
  final String getNotification = "notification/get_notification/";
}
