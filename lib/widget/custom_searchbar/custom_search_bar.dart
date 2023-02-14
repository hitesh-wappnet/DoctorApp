import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/color/custom_color.dart';
import 'package:flutter_application_1/widget/custom_text_widget/large_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.sp,
      decoration: BoxDecoration(
        border: Border.all(color: CustomPrimaryColor.darkGreenColor),
        borderRadius: BorderRadius.circular(50.sp),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LargeText(
              text: 'Search',
              color: CustomPrimaryColor.blackColor,
              size: 14.sp,
            ),
            Icon(
              Icons.search,
            )
          ],
        ),
      ),
    );
  }
}
