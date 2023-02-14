import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app_route.dart';
import 'package:flutter_application_1/routes/routes_const.dart';
import 'package:flutter_application_1/services/pushnotification/local_notification_service.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'screens/login_screen/login_screen_controller.dart';

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel', //title
//   'High Importance Notifications', // description

//   importance: Importance.max,
// );
Future<void> backgroundHandler(message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  await dotenv.load(fileName: "assets/.env_development");

  final isLoggedIn = await LoginController.checkUserLogin();
  // await PushNotificationService().setupInteractedMessage();

  // RemoteMessage? initialMessage =
  //     await FirebaseMessaging.instance.getInitialMessage();
  // if (initialMessage != null) {
  //   // App received a notification when it was killed
  // }
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  //getDeviceTokenToSendNotification();

  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging messaging = FirebaseMessaging.instance;

  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

  // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //   print('User granted permission');
  // } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
  //   print('User granted provisional permission');
  // } else {
  //   print('User declined or has not accepted permission');
  // }
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true, // Required to display a heads up notification
  //   badge: true,
  //   sound: true,
  // );
  LocalNotificationService.initialize();
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

// Future<void> getDeviceTokenToSendNotification() async {
//   final FirebaseMessaging _fcm = FirebaseMessaging.instance;

//   final token = await _fcm.getToken();

//   print(token);
// }

class MyApp extends StatefulWidget {
  final bool? isLoggedIn;
  const MyApp({Key? key, this.isLoggedIn}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
    FirebaseMessaging.onMessage.listen(
      (message) {
        print(
            "FirebaseMessaging.onMessage.listen ${message.notification!.title}");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        } else {
          print('else');
        }
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // initialRoute:
          //     widget.isLoggedIn! ? HOME_SCREEN_ROUTE : LOGIN_SCREEN_ROUTE,

          initialRoute: HOME_SCREEN_ROUTE,
          getPages: AppRoute.route,
        );
      },
    );
  }
}
