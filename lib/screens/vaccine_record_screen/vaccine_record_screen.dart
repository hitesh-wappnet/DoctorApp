// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/helper/color/custom_color.dart';
// import 'package:flutter_application_1/screens/vaccine_record_screen/vaccine_record_screen_controller.dart';
// import 'package:flutter_application_1/widget/custom_dailog/custom_dailog_result.dart';

// import 'package:flutter_application_1/widget/custom_dailog/custom_dailog_vaccine.dart';
// import 'package:flutter_application_1/widget/custom_text_widget/large_text.dart';
// import 'package:flutter_application_1/widget/rich_text_widget/rich_text.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class VaccineRecord extends GetView<VaccineRecordController> {
//   final VaccineRecordController vrController =
//       Get.find<VaccineRecordController>();

//   List vaccines = [
//     {
//       "vaccine": "Adenovirus",
//       "dose": "Dose 1",
//       "date": "26-01-2023",
//       "status": "Given"
//     },
//     {
//       "vaccine": "Vaxchora",
//       "dose": "Dose 1",
//       "date": "10-02-2023",
//       "status": "Given"
//     },
//     {
//       "vaccine": "DTap",
//       "dose": "Dose 1",
//       "date": "29-02-2023",
//       "status": "Given"
//     },
//     {
//       "vaccine": "HepA ",
//       "dose": "Dose 1",
//       "date": "10-03-2023",
//       "status": "Given"
//     },
//     {
//       "vaccine": "HepB",
//       "dose": "Dose 1",
//       "date": "01-04-2023",
//       "status": "Given"
//     },
//     {
//       "vaccine": "Hib",
//       "dose": "Dose 1",
//       "date": "14-05-2023",
//       "status": "Given"
//     },
//     {
//       "vaccine": "Fluvirin",
//       "dose": "Dose 1",
//       "date": "15-09-2023",
//       "status": "Given"
//     },
//   ];
//   List upcomingVaccines = [
//     {
//       "vaccine": "Adenovirus",
//       "dose": "Dose 2",
//       "date": "26-01-2024",
//       "status": "Given"
//     },
//     {
//       "vaccine": "Vaxchora",
//       "dose": "Dose 2",
//       "date": "10-02-2024",
//       "status": "Given"
//     },
//     {
//       "vaccine": "DTap",
//       "dose": "Dose 2",
//       "date": "29-02-2024",
//       "status": "Given"
//     },
//     {
//       "vaccine": "HepA ",
//       "dose": "Dose 2",
//       "date": "10-03-2024",
//       "status": "Given"
//     },
//     {
//       "vaccine": "HepB",
//       "dose": "Dose 2",
//       "date": "01-04-2024",
//       "status": "Given"
//     },
//     {
//       "vaccine": "Hib",
//       "dose": "Dose 2",
//       "date": "14-05-2024",
//       "status": "Given"
//     },
//     {
//       "vaccine": "Fluvirin",
//       "dose": "Dose 2",
//       "date": "15-09-2024",
//       "status": "Given"
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     //Get data from Previous Page
//     var data = Get.arguments;
//     return Scaffold(
//       backgroundColor: NeutralColor.whiteColor,
//       appBar: AppBar(
//         toolbarHeight: 54.h,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.black, size: 30.sp),
//         backgroundColor: Colors.transparent,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.w),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 20.h,
//               ),
//               Card(
//                   margin: EdgeInsets.zero,
//                   elevation: 6,
//                   child: Container(
//                     height: 125.h,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 15.w, vertical: 10.h),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           LargeText(
//                             text: 'Vaccine Record',
//                             color: CustomPrimaryColor.blackColor,
//                             size: 16.sp,
//                           ),
//                           SizedBox(
//                             height: 10.h,
//                           ),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CircleAvatar(
//                                 radius: 28.sp,
//                                 backgroundImage: AssetImage(data[0]),
//                               ),
//                               SizedBox(
//                                 width: 10.w,
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   CustomRichText(
//                                     "Name:",
//                                     data[1].toString(),
//                                   ),
//                                   SizedBox(
//                                     height: 5.h,
//                                   ),
//                                   CustomRichText(
//                                     "Child Code: ",
//                                     data[2].toString(),
//                                   ),
//                                 ],
//                               ),
//                               Spacer(),
//                               InkWell(
//                                 onTap: () {
//                                   showCustomDialog(false);
//                                 },
//                                 child: CircleAvatar(
//                                   radius: 15.sp,
//                                   child: Icon(
//                                     Icons.add,
//                                     size: 16,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   )),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Obx(
//                 () => Card(
//                   elevation: 6,
//                   margin: EdgeInsets.zero,
//                   child: Container(
//                     child: Column(
//                       children: [
//                         SizedBox(height: 10),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Container(
//                               height: 28.h,
//                               width: 118.w,
//                               child: Center(
//                                 child: InkWell(
//                                   onTap: () {
//                                     vrController.isGiven.value = true;
//                                   },
//                                   child: LargeText(
//                                     text: 'Given',
//                                     weights: FontWeight.w500,
//                                     color: vrController.isGiven.value
//                                         ? Colors.white
//                                         : Colors.blue,
//                                     size: 14.sp,
//                                   ),
//                                 ),
//                               ),
//                               decoration: BoxDecoration(
//                                   color: vrController.isGiven.value
//                                       ? Colors.blue
//                                       : Colors.white,
//                                   border: Border.all(color: Colors.black12),
//                                   borderRadius: BorderRadius.circular(7.sp)),
//                             ),
//                             Container(
//                               height: 28.h,
//                               width: 118.w,
//                               child: Center(
//                                 child: InkWell(
//                                   onTap: () {
//                                     vrController.isGiven.value = false;
//                                   },
//                                   child: LargeText(
//                                     text: 'Upcoming',
//                                     size: 14.sp,
//                                     weights: FontWeight.w500,
//                                     color: vrController.isGiven.value
//                                         ? Colors.blue
//                                         : Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               decoration: BoxDecoration(
//                                   color: vrController.isGiven.value
//                                       ? Colors.white
//                                       : Colors.blue,
//                                   border: Border.all(color: Colors.black12),
//                                   borderRadius: BorderRadius.circular(7.sp)),
//                             )
//                           ],
//                         ),
//                         Divider(color: SecondaryColor.greyColor),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 22.sp),
//                           child: ListView.builder(
//                               primary: false,
//                               scrollDirection: Axis.vertical,
//                               shrinkWrap: true,
//                               itemCount: vaccines.length,
//                               physics: NeverScrollableScrollPhysics(),
//                               itemBuilder: (BuildContext context, int index) {
//                                 return ListTileTheme(
//                                     tileColor: CustomPrimaryColor.CardColor,
//                                     child: Container(
//                                       height: 114.h,
//                                       child: Obx(
//                                         () => Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Text(
//                                                   vrController.isGiven.value
//                                                       ? vaccines[index]
//                                                           ['vaccine']
//                                                       : upcomingVaccines[index]
//                                                           ['vaccine'],
//                                                   style: TextStyle(
//                                                       color: CustomPrimaryColor
//                                                           .blackColor,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5.sp,
//                                                 ),
//                                                 Text('|'),
//                                                 SizedBox(
//                                                   width: 5.sp,
//                                                 ),
//                                                 Text(
//                                                   vrController.isGiven.value
//                                                       ? vaccines[index]['dose']
//                                                       : upcomingVaccines[index]
//                                                           ['dose'],
//                                                   style: TextStyle(
//                                                       color: vrController
//                                                               .isGiven.value
//                                                           ? CustomPrimaryColor
//                                                               .darkGreenColor
//                                                           : CustomPrimaryColor
//                                                               .redColor),
//                                                 )
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height: 10.sp,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 CustomRichText(
//                                                     'Date: ',
//                                                     vrController.isGiven.value
//                                                         ? vaccines[index]
//                                                             ['date']
//                                                         : upcomingVaccines[
//                                                             index]['date']),
//                                                 Row(
//                                                   children: [
//                                                     if (vrController
//                                                             .isGiven.value !=
//                                                         true)
//                                                       Container(
//                                                         height: 24.h,
//                                                         width: 24.w,
//                                                         decoration: BoxDecoration(
//                                                             color: Colors.blue,
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         5.sp)),
//                                                         child: InkWell(
//                                                           onTap: () {
//                                                             showCustomDialog(
//                                                                 true);
//                                                           },
//                                                           child: Icon(
//                                                             Icons.edit,
//                                                             color: NeutralColor
//                                                                 .whiteColor,
//                                                             size: 18.sp,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     SizedBox(
//                                                       width: 20.w,
//                                                     ),
//                                                     Container(
//                                                       height: 24.h,
//                                                       width: 24.w,
//                                                       decoration: BoxDecoration(
//                                                           color: Colors.blue,
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       5.sp)),
//                                                       child: Center(
//                                                         child: InkWell(
//                                                           onTap: () {
//                                                             showDialog(
//                                                                 context:
//                                                                     context,
//                                                                 builder:
//                                                                     (BuildContext
//                                                                         context) {
//                                                                   return CustomDialogBox(
//                                                                     backgroundColor:
//                                                                         CustomPrimaryColor
//                                                                             .redColor,
//                                                                     icon: Icon(
//                                                                       Icons
//                                                                           .delete_outline_outlined,
//                                                                       size:
//                                                                           45.sp,
//                                                                     ),
//                                                                     heading:
//                                                                         "Delete",
//                                                                     title:
//                                                                         "You're about to delete record",
//                                                                     descriptions:
//                                                                         "These will delete your vaccine record\n Are you sure?",
//                                                                     btn1Text:
//                                                                         "Delete",
//                                                                     btn2Text:
//                                                                         "Cancel",
//                                                                   );
//                                                                 });
//                                                           },
//                                                           child: Icon(
//                                                             Icons.delete,
//                                                             color: Colors.white,
//                                                             size: 18.sp,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height: 10.sp,
//                                             ),
//                                             Container(
//                                               height: 26.h,
//                                               width: 88.w,
//                                               child: Center(
//                                                 child: LargeText(
//                                                   text:
//                                                       vrController.isGiven.value
//                                                           ? 'Given'
//                                                           : 'Upcoming',
//                                                   color:
//                                                       vrController.isGiven.value
//                                                           ? CustomSematicColor
//                                                               .darkGreenColor
//                                                           : CustomSematicColor
//                                                               .redColor,
//                                                   size: 14.sp,
//                                                 ),
//                                               ),
//                                               decoration: BoxDecoration(
//                                                   color:
//                                                       vrController.isGiven.value
//                                                           ? CustomSematicColor
//                                                               .lightGreenColor
//                                                           : CustomSematicColor
//                                                               .skinColor,
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           5.sp)),
//                                             ),
//                                             Divider(
//                                                 color:
//                                                     SecondaryColor.greyColor),
//                                           ],
//                                         ),
//                                       ),
//                                     ));
//                               }),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
