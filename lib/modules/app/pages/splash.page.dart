import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meow_app/global_witgets/loading_cat.widget.dart';
import 'package:meow_app/core/utils/sizer.dart';
import 'package:meow_app/modules/app/controller/splash.controller.dart';

class SplashPage extends GetWidget<SplashController> {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'MeowApp',
                  style: TextStyle(
                      fontSize: 30.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Hero(
              tag: 'loading_cat_0',
              child: LoadingCat(key: Key('loading_cat_0'),),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
