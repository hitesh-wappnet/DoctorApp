// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/helper/color/custom_color.dart';
// import 'package:flutter_application_1/helper/font_family/font_family.dart';
// import 'package:flutter_application_1/screens/notification_screen/notification_screen_controller.dart';
// import 'package:flutter_application_1/utils/assets/assets_util.dart';
// import 'package:flutter_application_1/widget/custom_text_widget/large_text.dart';
// import 'package:flutter_application_1/widget/rich_text_widget/rich_text.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class NotificationScreen extends StatefulWidget {
//   NotificationScreen({super.key});

//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
 
//   var dummyUnreadNotification = [
//     {
//       "name": "Marvik Stone",
//       "msg": " given access to see Liam record's",
//       "period": "1h ago"
//     },
//     {
//       "name": "Garry Simon",
//       "msg": " given access to modify Olivia record's",
//       "period": "2h ago"
//     },
//   ];
//   var dummyRecentNotification = [
//     {
//       "status": "new",
//       "name": "Rexon hassan",
//       "msg": " given access to modify Evelyn record's",
//       "period": "5h ago"
//     },
//     {
//       "status": "new",
//       "name": "Garry Simon",
//       "msg": " given access to modify Olivia record's",
//       "period": "8h ago"
//     },
//     {
//       "status": "new",
//       "name": "Richard demon",
//       "msg": " given access to edit nick record's",
//       "period": "1day ago"
//     },
//   ];
//   var dummyAllNotification = [
//     {
//       "name": "Garry Simon",
//       "msg": " given access to modify Olivia record's",
//       "period": "2h ago"
//     },
//     {
//       "name": "Rexon hassan",
//       "msg": " given access to modify Evelyn record's",
//       "period": "1h ago"
//     },
//     {
//       "name": "Garry Simon",
//       "msg": " given access to modify Olivia record's",
//       "period": "2h ago"
//     },
//     {
//       "name": "Rexon hassan",
//       "msg": " given access to modify Evelyn record's",
//       "period": "1h ago"
//     },
//     {
//       "name": "Garry Simon",
//       "msg": " given access to modify Olivia record's",
//       "period": "2h ago"
//     },
//     // {
//     //   "name": "Rexon hassan",
//     //   "msg": " given access to modify Evelyn record's",
//     //   "period": "1h ago"
//     // },
//     // {
//     //   "name": "Garry Simon",
//     //   "msg": " given access to modify Olivia record's",
//     //   "period": "2h ago"
//     // },
//     // {
//     //   "name": "Rexon hassan",
//     //   "msg": " given access to modify Evelyn record's",
//     //   "period": "1h ago"
//     // },
//     // {
//     //   "name": "Garry Simon",
//     //   "msg": " given access to modify Olivia record's",
//     //   "period": "2h ago"
//     // },
//     // {
//     //   "name": "Richard demon",
//     //   "msg": " given access to edit nick record's",
//     //   "period": "1day ago"
//     // },
//     // {
//     //   "name": "Marvik Stone",
//     //   "msg": " given access to see Liam record's",
//     //   "period": "1h ago"
//     // },
//     // {
//     //   "name": "Garry Simon",
//     //   "msg": " given access to modify Olivia record's",
//     //   "period": "2h ago"
//     // },
//     // {
//     //   "name": "Rexon hassan",
//     //   "msg": " given access to modify Evelyn record's",
//     //   "period": "1h ago"
//     // },
//     // {
//     //   "name": "Garry Simon",
//     //   "msg": " given access to modify Olivia record's",
//     //   "period": "2h ago"
//     // },
//     {
//       "name": "Richard demon",
//       "msg": " given access to edit nick record's",
//       "period": "1day ago"
//     },
//   ];

//   notifications(index) {
//     if (index == 0) {
//       return dummyUnreadNotification;
//     } else if (index == 1) {
//       return dummyRecentNotification;
//     } else {
//       return dummyAllNotification;
//     }
//   }

//   List notification = [
//     'Unread',
//     'Recent',
//     'All',
//   ];

//   var currentIndex = 0;
//   var pageIndex = 0;

//   late final PageController _controller = PageController(initialPage: 0);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.black, size: 30.sp),
//         backgroundColor: Colors.transparent,
//         title: LargeText(
//           text: 'Notifications',
//           color: CustomPrimaryColor.blackColor,
//         ),
//       ),
//       body: Stack(children: [
//         // Positioned(
//         //   child: Badge(
//         //     badgeContent: Text(
//         //       '3',
//         //       style: TextStyle(color: NeutralColor.whiteColor, fontSize: 11.sp),
//         //     ),
//         //     badgeStyle: BadgeStyle(shape: BadgeShape.circle),
//         //   ),
//         // ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 23.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 22.sp),
//               child: Wrap(
//                 spacing: 35.sp,
//                 children: List.generate(3, (index) {
//                   return Container(
//                     padding: EdgeInsets.only(
//                       bottom: 5,
//                     ),
//                     decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(
//                       color: currentIndex == index
//                           ? CustomPrimaryColor.redColor
//                           : NeutralColor.whiteColor,
//                       width: 3.0, // Underline thickness
//                     ))),
//                     child: InkWell(
//                       onTap: () {
//                         setState(() {
//                           // print('ontap $index');
//                           // print(
//                           //     'currentIndex during page ontap: $currentIndex');
//                         });
//                       },
//                       child: Text(
//                         notification[index],
//                         style: TextStyle(fontFamily: FontFamliyO.REGULAR),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//             Divider(height: 1, color: SecondaryColor.greyColor),
//             Container(
//               height: MediaQuery.of(context).size.height / 1.3,
//               child: PageView.builder(
//                 controller: _controller,
//                 // primary: false,
//                 scrollDirection: Axis.horizontal,
//                 // shrinkWrap: true,
//                 itemCount: notification.length,
//                 // physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (BuildContext context, int index) {
//                   index = currentIndex;
//                   return ListView.builder(
//                       primary: false,
//                       scrollDirection: Axis.vertical,
//                       shrinkWrap: true,
//                       itemCount: notifications(currentIndex).length,
//                       //physics: NeverScrollableScrollPhysics(),
//                       itemBuilder: (BuildContext context, int index) {
//                         return Container(
//                           child: Column(
//                             children: [
//                               ListTile(
//                                 leading: CircleAvatar(
//                                     backgroundImage: AssetImage(
//                                         AssetsUtils.ASSETS_BABY1_ICON)),
//                                 title: CustomRichText(
//                                     notifications(currentIndex)[index]["name"],
//                                     notifications(currentIndex)[index]["msg"]),
//                                 subtitle: Text(
//                                     notifications(currentIndex)[index]
//                                         ["period"]!),
//                               ),
//                               Padding(
//                                 padding:
//                                     EdgeInsets.symmetric(horizontal: 20.sp),
//                                 child: Divider(color: SecondaryColor.greyColor),
//                               ),
//                             ],
//                           ),
//                         );
//                       });
//                 },
//                 onPageChanged: (index) {
//                   setState(() {
//                     // print('pageScroll $index');
//                     // print('currentIndex during page scroll: $currentIndex');
//                     currentIndex = index;
//                   });
//                 },
//               ),
//             )
//           ],
//         ),
//       ]),
//     );
//   }
// }
