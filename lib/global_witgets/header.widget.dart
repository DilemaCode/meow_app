import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meow_app/core/utils/sizer.dart';

class AppHeaderWidget extends StatelessWidget {
  const AppHeaderWidget({
    Key? key,
    required this.title,
    this.titleSize,
    this.padding,
    this.showDivider,
  }) : super(key: key);
  final String title;
  final double? titleSize;
  final EdgeInsets? padding;
  final bool? showDivider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: SizedBox(
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.mediaQuery.viewPadding.top + 2.h),
            Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: titleSize ?? 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (showDivider ?? false) Divider(),
            SizedBox(height: 1.h),
          ],
        ),
      ),
    );
  }
}
