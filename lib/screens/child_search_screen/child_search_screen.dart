import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/helper/constants/strings.dart';
import 'package:flutter_application_1/helper/font_family/font_family.dart';
import 'package:flutter_application_1/helper/text_style/style.dart';
import 'package:flutter_application_1/routes/routes_const.dart';
import 'package:flutter_application_1/screens/child_search_screen/child_search_screen_controller.dart';
import 'package:flutter_application_1/screens/vaccine_record_screen/vaccine_record_screen_controller.dart';

import 'package:flutter_application_1/utils/assets/assets_util.dart';
import 'package:flutter_application_1/widget/custom_button_widget/custom_button.dart';
import 'package:flutter_application_1/widget/rich_text_widget/rich_text.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  //dummy data
  List babyImagesS = [
    AssetsUtils.ASSETS_BABY1_ICON,
    AssetsUtils.ASSETS_BABY2_ICON,
    AssetsUtils.ASSETS_BABY3_ICON,
    AssetsUtils.ASSETS_BABY4_ICON,
    AssetsUtils.ASSETS_BABY5_ICON,
    AssetsUtils.ASSETS_BABY1_ICON,
    AssetsUtils.ASSETS_BABY2_ICON,
    AssetsUtils.ASSETS_BABY3_ICON,
    AssetsUtils.ASSETS_BABY6_ICON,
    AssetsUtils.ASSETS_BABY1_ICON,
    AssetsUtils.ASSETS_BABY2_ICON,
    AssetsUtils.ASSETS_BABY3_ICON,
  ];

  final ChildSearchScreenController sController =
      Get.put(ChildSearchScreenController());

  //boolean variable used to toggle between All and Completed tab.
  bool isAll = true;

  //Function to Clear Search TextField
  clearSearch() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => sController.searchController.clear());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: NeutralColor.whiteColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black, size: 30.sp),
          elevation: 0,
          title: TextField(
            autofocus: true,
            controller: sController.searchController,
            decoration: InputDecoration(
              hintText: 'child name or code...',
              hintStyle: TextStyle(color: Colors.black12),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: CustomPrimaryColor.blackColor,
                ),
                onPressed: () {
                  clearSearch();
                },
              ),
            ),
            onChanged: (value) {
              sController.ConnectedChildrensList(
                  sController.searchController.value.text);

              setState(() {});
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isAll = true;
                    });
                  },
                  child: Container(
                    width: 78.w,
                    padding: EdgeInsets.only(
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: isAll
                          ? CustomPrimaryColor.blueColor
                          : NeutralColor.whiteColor,
                      width: 3.0, // Underline thickness
                    ))),
                    child: Center(
                      child: Text(
                        ALL,
                        style: poppinsHeadingStyle(
                            color: isAll
                                ? CustomPrimaryColor.blackColor
                                : CustomPrimaryColor.blackText,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150.w,
                  padding: EdgeInsets.only(
                    bottom: 5,
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: isAll
                        ? NeutralColor.whiteColor
                        : CustomPrimaryColor.blueColor,
                    width: 3.0, // Underline thickness
                  ))),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isAll = false;
                          sController.searchController.clear();
                          sController.isLoading = false.obs;
                        });
                      },
                      child: Text(
                        CONNECTED,
                        style: poppinsHeadingStyle(
                            color: isAll
                                ? CustomPrimaryColor.blackText
                                : CustomPrimaryColor.blackColor,
                            fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            Center(
              child: Container(
                width: 272.w,
                child: Column(
                  children: [
                    Text(
                      "Quick search for children and send request to view",
                      style: poppinsHeadingStyle(
                          fontSize: 10.sp, color: CustomPrimaryColor.blackText),
                    ),
                    Text(
                      "vaccine record",
                      style: poppinsHeadingStyle(
                          fontSize: 10.sp, color: CustomPrimaryColor.blackText),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
                padding: EdgeInsets.only(left: 22.sp),
                height: 21.h,
                width: double.maxFinite,
                color: CustomPrimaryColor.containerColor,
                child: Obx(
                  () => sController.isLoading == true
                      ? Row(
                          children: [
                            Text(
                              'Search result"${sController.searchController.value.text}" ',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ],
                        )
                      : Text(
                          CONNECTED,
                          style: poppinsHeadingStyle(
                              color: CustomPrimaryColor.blackText,
                              fontFamily: FontFamilyP.REGULAR),
                        ),
                )),
            Obx(
              () => sController.isLoading.value
                  ? sController.searchChildren.data == null
                      ? Center(
                          child: Column(
                          children: [
                            SizedBox(
                              height: 100.h,
                            ),
                            Text("No child exist with this child code."),
                          ],
                        ))
                      : Card(
                          child: Container(
                              height: 54.h,
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 22.w,
                                  ),
                                  Text(
                                    "Child Code:${sController.searchChildren?.data?.childCode}",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: FontFamilyP.REGULAR),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      VaccineRecordController()
                                          .fetchAllChildVaccineRecords();
                                    },
                                    child: AppButton(
                                      height: 20.h,
                                      width: 74.w,
                                      text: 'Request',
                                      sizes: 10.sp,
                                      radius: 1.sp,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          sController.searchController.clear();
                                          sController.isLoading = false.obs;
                                        });
                                      },
                                      icon: Icon(Icons.clear))
                                ],
                              )))
                  : sController.isLoadingConnected.value
                      ? Center(
                          child: Lottie.asset(AssetsUtils.ASSETS_LOADING_DOTDOT,
                              height: 50.h, width: 50.w, animate: true),
                        )
                      : Visibility(
                          visible: sController.connectedChildren.value.data !=
                                  "" &&
                              sController.connectedChildren.value.data != null,
                          replacement: Column(
                            children: [
                              SizedBox(
                                height: 80.w,
                              ),
                              Center(
                                  child: Text(
                                "No Connected Children...",
                                style: openSansHeadingStyle(
                                    color: CustomPrimaryColor.blackColor,
                                    fontFamily: FontFamliyO.REGULAR,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 22.sp),
                              )),
                            ],
                          ),
                          child: ListView.builder(
                              primary: false,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: isAll
                                  ? 1
                                  : sController
                                      .connectedChildren.value.data?.length,
                              //physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    navigateToVaccineRecordScreen(
                                        sController.connectedChildren.value
                                            .data![index].child
                                            .toString(),
                                        sController.connectedChildren.value
                                            .data![index].childId
                                            .toString());
                                  },
                                  child: Card(
                                      elevation: 2,
                                      child: Center(
                                        child: Container(
                                          height: 89.h,
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              radius: 28.sp,
                                              foregroundImage: AssetImage(
                                                  babyImagesS[index]),
                                            ),
                                            title: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 11.h,
                                                ),
                                                CustomRichText(
                                                  "Name:",
                                                  sController.connectedChildren
                                                      .value.data![index].child,
                                                ),
                                                CustomRichText(
                                                  "Child Code: ",
                                                  sController
                                                      .connectedChildren
                                                      .value
                                                      .data![index]
                                                      .childId,
                                                ),
                                                CustomRichText(
                                                  "dob: ",
                                                  sController.connectedChildren
                                                      .value.data![index].dob,
                                                )
                                              ],
                                            ),
                                            trailing: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: 25.h,
                                                  width: 87.w,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Colors.black12),
                                                      color: CustomSematicColor
                                                          .lightGreenColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.sp)),
                                                  child: Center(
                                                    child: Text('Approved',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily:
                                                                FontFamliyM
                                                                    .SEMIBOLD,
                                                            color: CustomSematicColor
                                                                .darkGreenColor)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 13.h,
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    height: 22.h,
                                                    width: 22.w,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: SecondaryColor
                                                              .greyColor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.sp),
                                                      color: CustomSematicColor
                                                          .lightGreenColor,
                                                    ),
                                                    child: Center(
                                                        child: Icon(
                                                      Icons.navigate_next,
                                                      color: CustomAccentColor
                                                          .lightGreenColor,
                                                      size: 20.sp,
                                                    )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              }),
                        ),
            ),
            Padding(
                padding: EdgeInsets.only(right: 22.0.sp, top: 10.sp),
                child: isAll
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  isAll = !isAll;
                                });
                              },
                              child: Obx(
                                () => Text(
                                  sController.isLoading == true
                                      ? ""
                                      : 'View More',
                                  style: poppinsHeadingStyle(
                                      color: CustomPrimaryColor.blackText,
                                      fontSize: 14.sp),
                                ),
                              ))
                        ],
                      )
                    : null)
          ],
        )),
      ),
    );
  }
}

Future<dynamic>? navigateToVaccineRecordScreen(String name, String childCode) {
  return Get.toNamed(VACCINE_RECORD_SCREEN_ROUTE, arguments: [name, childCode]);
}

// Future<dynamic>? sendRequest(String childcode){
//   return 
// }          