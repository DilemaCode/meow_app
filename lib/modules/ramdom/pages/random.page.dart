import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meow_app/common/config.dart';
import 'package:meow_app/core/themes/colors.dart';
import 'package:meow_app/core/utils/sizer.dart';
import 'package:meow_app/global_witgets/cat_card.widget.dart';
import 'package:meow_app/global_witgets/header.widget.dart';
import 'package:meow_app/global_witgets/shimmer.widget.impl.dart';
import 'package:meow_app/modules/app/controller/app.controller.dart';
import 'package:meow_app/modules/ramdom/controller/random.controller.dart';

class RandomPage extends GetWidget<RandomController> {
  const RandomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Obx(
          () => Column(
            children: [
              AppHeaderWidget(
                title: 'Random Cats',
              ),
              SizedBox(height: 2.h),
              Shimmer(
                linearGradient: AppController.instance.isDarkMode.value
                    ? AppColors.shimmerGradientDark
                    : AppColors.shimmerGradient,
                child: Expanded(
                  child: controller.cat.value.id?.isNotEmpty ?? false
                      ? CatCard(
                          width: 90.w,
                          gif:
                              '${Config.BASE_URL}/cat/${controller.cat.value.id}?width=300',
                        )
                      : Center(
                          child: Text('Press Meow for see a random cat'),
                        ),
                ),
              ),
              SizedBox(height: 4.h),
              MaterialButton(
                minWidth: 90.w,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 2.h),
                onPressed: controller.isLoading.value
                    ? null
                    : () {
                        AppController.instance.playMeow();
                        controller.fetchRandomGif();
                      },
                child: Text(
                  'Meow',
                  style: TextStyle(color: AppColors.whiteText),
                ),
                color: Get.theme.primaryColor,
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
