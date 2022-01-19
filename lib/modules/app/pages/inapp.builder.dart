import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meow_app/core/utils/sizer.dart';
import 'package:meow_app/modules/app/controller/app.controller.dart';
import 'package:meow_app/modules/app/controller/inapp.controller.dart';
import 'package:meow_app/core/themes/colors.dart';

class InAppBuilder extends GetWidget<InAppController> {
  const InAppBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        pageSnapping: true,
        controller: controller.pageController,
        children: List.generate(
            controller.pages.length, (i) => controller.pages[i]['widget']),
      ),
      bottomNavigationBar: Obx(
        () => ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(17.sp),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(17.sp),
              ),
              color: AppController.instance.isDarkMode.value
                  ? AppColors.backgroundLight
                  : AppColors.backgroundDark,
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackText.withOpacity(0.2),
                  offset: Offset(0, -3),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  controller.pages.length,
                  (index) {
                    Map item = controller.pages[index];
                    return InkWell(
                      onTap: () {
                        controller.changePage(index);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: Get.mediaQuery.viewPadding.bottom + 3.h,
                          top: 3.h,
                          left: 2.w,
                          right: 2.w,
                        ),
                        child: Icon(
                          item['icon'],
                          size: 20.sp,
                          color: controller.tabIndex.value == index
                              ? AppColors.primaryColor
                              : AppController.instance.isDarkMode.value
                                  ? AppColors.blackText
                                  : AppColors.whiteText,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
