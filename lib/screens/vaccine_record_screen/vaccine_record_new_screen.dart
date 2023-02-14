import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_application_1/helper/text_style/style.dart';
import 'package:flutter_application_1/routes/routes_const.dart';
import 'package:flutter_application_1/screens/vaccine_record_screen/vaccine_record_screen_controller.dart';
import 'package:flutter_application_1/utils/assets/assets_util.dart';

import 'package:flutter_application_1/widget/custom_dailog/custom_dailog_vaccine.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

var currentIndex = 0.obs;
List vaccineRecord = [
  'All',
  'Completed',
  'Upcoming',
];

class VaccineRecordNewScreen extends StatefulWidget {
  @override
  State<VaccineRecordNewScreen> createState() => _VaccineRecordNewScreenState();
}

class _VaccineRecordNewScreenState extends State<VaccineRecordNewScreen> {
  final VaccineRecordController vaccineRecordController =
      Get.find<VaccineRecordController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: NeutralColor.whiteColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Get.offAllNamed(HOME_SCREEN_ROUTE);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: CustomPrimaryColor.blackColor,
                  )),
              title: Text(
                vaccineRecordController.childName.value,
                style: openSansHeadingStyle(
                    color: CustomPrimaryColor.blackColor,
                    fontFamily: FontFamliyO.REGULAR,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 22.sp),
                  child: InkWell(
                    onTap: () {
                      showCustomDialog(false);
                    },
                    child: CircleAvatar(
                      radius: 12.sp,
                      child: Icon(
                        Icons.add,
                        size: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.sp),
                      child: Wrap(
                        spacing: 35.sp,
                        children: List.generate(3, (index) {
                          return Container(
                            width: 90.w,
                            padding: EdgeInsets.only(
                              bottom: 5,
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: currentIndex == index
                                  ? CustomPrimaryColor.blueColor
                                  : NeutralColor.whiteColor,
                              width: 3.0, // Underline thickness
                            ))),
                            child: InkWell(
                              onTap: () {
                                currentIndex.value = index;

                                if (vaccineRecord[index] == "Completed") {
                                  vaccineRecordController
                                      .fetchUpcommingAndCompleteChildVaccineRecords(
                                          "1");
                                } else if (vaccineRecord[index] == "Upcoming") {
                                  vaccineRecordController
                                      .fetchUpcommingAndCompleteChildVaccineRecords(
                                          "0");
                                } else {
                                  vaccineRecordController
                                      .fetchUpcommingAndCompleteChildVaccineRecords(
                                          "");
                                }
                              },
                              child: Center(
                                child: Text(
                                  vaccineRecord[index],
                                  style: TextStyle(
                                      fontFamily: FontFamliyO.REGULAR),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Divider(height: 1, color: SecondaryColor.greyColor),
                    vaccineRecordController.isLoading.value
                        ? Center(
                            child: Lottie.asset(
                                AssetsUtils.ASSETS_LOADING_DOTDOT,
                                height: 150.h,
                                width: 150.w,
                                animate: true),
                          )
                        : Visibility(
                            visible: vaccineRecordController
                                    .allVaccineDetail.value.data !=
                                null,
                            replacement: Column(
                              children: [
                                SizedBox(
                                  height: 80.w,
                                ),
                                Center(
                                    child: Text(
                                  "No vaccine details available...",
                                  style: openSansHeadingStyle(
                                      color: CustomPrimaryColor.blackColor,
                                      fontFamily: FontFamliyO.REGULAR,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22.sp),
                                )),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.sp,
                              ),
                              child: SingleChildScrollView(
                                child: ListView.builder(
                                  key: Key(
                                      'selected ${vaccineRecordController.currentIndex.value}}'),
                                  primary: false,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: vaccineRecordController
                                          .allVaccineDetail
                                          .value
                                          .data
                                          ?.length ??
                                      0,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Theme(
                                          data: Theme.of(Get.context!).copyWith(
                                              dividerColor: Colors.transparent),
                                          child: ExpansionTile(
                                              key: Key(index.toString()),
                                              initiallyExpanded: index ==
                                                  vaccineRecordController
                                                      .currentIndex.value,
                                              onExpansionChanged: (value) {
                                                vaccineRecordController
                                                    .currentIndex.value = index;
                                                vaccineRecordController
                                                    .isReadmore.value = false;
                                              },
                                              backgroundColor:
                                                  NeutralColor.whiteColor,
                                              title: _buildTitle(index),
                                              trailing: vaccineRecordController
                                                          .allVaccineDetail
                                                          .value
                                                          .data![index]
                                                          .isVaccineted ==
                                                      true
                                                  ? null
                                                  : GestureDetector(
                                                      onTap: () {},
                                                      child: Image.asset(
                                                        AssetsUtils
                                                            .ASSETS_DELETE,
                                                        height: 25.h,
                                                        width: 25.w,
                                                      ),
                                                    ),
                                              children: <Widget>[
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 35.w,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border:
                                                                RDottedLineBorder(
                                                              left: BorderSide(
                                                                color: SecondaryColor
                                                                    .greyColor,
                                                              ),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              SizedBox(
                                                                width: 25.w,
                                                              ),
                                                              Container(
                                                                width: 230.w,
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 15
                                                                            .sp,
                                                                        right: 15
                                                                            .sp,
                                                                        left: 15
                                                                            .sp),
                                                                decoration: BoxDecoration(
                                                                    color: CustomPrimaryColor
                                                                        .VaccineDetailContainerColor,
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(5.sp))),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "Vaccine Info : ",
                                                                      style: openSansHeadingStyle(
                                                                          color: CustomPrimaryColor
                                                                              .blackColor,
                                                                          fontFamily: FontFamliyO
                                                                              .REGULAR,
                                                                          fontSize: 14
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.w900),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10.h,
                                                                    ),
                                                                    Obx(() => buildText(
                                                                        "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...sNeque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
                                                                        index)),
                                                                    Padding(
                                                                      padding: EdgeInsets
                                                                          .all(10
                                                                              .sp),
                                                                      child:
                                                                          Align(
                                                                        alignment:
                                                                            Alignment.bottomRight,
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            vaccineRecordController.isReadmore.value =
                                                                                !vaccineRecordController.isReadmore.value;
                                                                            log(vaccineRecordController.isReadmore.value.toString());
                                                                            log(vaccineRecordController.currentIndex.value.toString());
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            (vaccineRecordController.isReadmore.value
                                                                                ? 'View Less'
                                                                                : 'View More'),
                                                                            style: openSansHeadingStyle(
                                                                                color: NeutralColor.darkBlueColor,
                                                                                fontFamily: FontFamliyO.REGULAR,
                                                                                fontSize: 12.sp,
                                                                                fontWeight: FontWeight.w900),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 22.sp,
                                                          right: 22.sp,
                                                          top: 10.sp,
                                                          bottom: 20.sp),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 10.sp),
                                                            height: 36.h,
                                                            width: 36.w,
                                                            decoration: BoxDecoration(
                                                                color: CustomPrimaryColor
                                                                    .containerColor,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            6.sp))),
                                                            child: Image.asset(
                                                              AssetsUtils
                                                                  .ASSETS_SCHEDULE,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 12.w,
                                                          ),
                                                          Text(
                                                            "Date : ",
                                                            style: poppinsHeadingStyle(
                                                                fontSize: 12.sp,
                                                                fontFamily:
                                                                    FontFamilyP
                                                                        .REGULAR,
                                                                color: CustomSematicColor
                                                                    .redColor),
                                                          ),
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          Text(
                                                            vaccineRecordController
                                                                    .allVaccineDetail
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .dateOfVaccine ??
                                                                "",
                                                            style: poppinsHeadingStyle(
                                                                fontSize: 12.sp,
                                                                fontFamily:
                                                                    FontFamilyP
                                                                        .REGULAR,
                                                                color: CustomPrimaryColor
                                                                    .blackColor),
                                                          ),
                                                          Spacer(),
                                                          Image.asset(AssetsUtils
                                                              .ASSETS_VACCINATION),
                                                          Text('Mark as Given',
                                                              style: poppinsHeadingStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontFamily:
                                                                      FontFamilyP
                                                                          .REGULAR,
                                                                  color: CustomPrimaryColor
                                                                      .redColor))
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                        ),
                                        Divider(
                                            color: SecondaryColor.greyColor),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            )));
  }

//to create view more function
  Widget buildText(String text, int index) {
    // if read more is false then show only 3 lines from text
    // else show full text
    final lines = vaccineRecordController.isReadmore.value ? null : 3;
    return Text(
      text,
      style: openSansHeadingStyle(
          color: CustomPrimaryColor.blackColor,
          fontFamily: FontFamliyO.REGULAR,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500),
      maxLines: lines,
      // overflow properties is used to show 3 dot in text widget
      // so that user can understand there are few more line to read.
      overflow: vaccineRecordController.isReadmore.value
          ? TextOverflow.visible
          : TextOverflow.ellipsis,
    );
  }

  Widget _buildTitle(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.sp),
              height: 36.h,
              width: 36.w,
              decoration: BoxDecoration(
                  color: CustomPrimaryColor.containerColor,
                  borderRadius: BorderRadius.all(Radius.circular(6.sp))),
              child: Image.asset(
                AssetsUtils.ASSETS_VACCINEE,
                height: 20.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Vaccine:${index + 1} ",
                          style: openSansHeadingStyle(
                              color: CustomSematicColor.orangeColor,
                              fontFamily: FontFamliyO.REGULAR,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: vaccineRecordController
                              .allVaccineDetail.value.data![index].vaccineName,
                          style: openSansHeadingStyle(
                              color: CustomPrimaryColor.blackColor,
                              fontFamily: FontFamliyO.REGULAR,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Check the details below ",
                          style: openSansHeadingStyle(
                              color: CustomPrimaryColor.blackColor,
                              fontFamily: FontFamliyO.REGULAR,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: 'Click',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 3.sp,
                              color: CustomSematicColor.orangeColor,
                              fontSize: 12.sp,
                              fontFamily: FontFamilyP.REGULAR,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
                width: 74.w,
                padding: EdgeInsets.symmetric(horizontal: 2.sp, vertical: 3.sp),
                decoration: BoxDecoration(
                    color: vaccineRecordController.allVaccineDetail.value
                                .data![index].isVaccineted ==
                            true
                        ? CustomSematicColor.lightGreenColor
                        : CustomSematicColor.lightSkinColor,
                    borderRadius: BorderRadius.all(Radius.circular(5.sp))),
                child: Center(
                  child: Text(
                      vaccineRecordController.allVaccineDetail.value
                                  .data![index].isVaccineted ==
                              true
                          ? "Given"
                          : "Upcoming",
                      style: montserratHeadingStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w900,
                        color: vaccineRecordController.allVaccineDetail.value
                                    .data![index].isVaccineted ==
                                true
                            ? CustomSematicColor.darkGreenColor
                            : CustomSematicColor.orangeColor,
                      )),
                )),
          ],
        ),
      ],
    );
  }
}

// Future<dynamic>? navigateToEditPage(String? childCode, String? firstName,
//     String? middleName, String? lastName, String? dob, String? gender) {
//   return Get.toNamed(ADD_CHILDREN_SCREEN_ROUTE,
//       arguments: [childCode, firstName, middleName, lastName, dob, gender]);
// }
