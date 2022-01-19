import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meow_app/common/config.dart';
import 'package:meow_app/core/themes/colors.dart';
import 'package:meow_app/core/utils/sizer.dart';
import 'package:meow_app/data/models/cat.model.dart';
import 'package:meow_app/global_witgets/cat_card.widget.dart';
import 'package:meow_app/global_witgets/shimmer.widget.impl.dart';
import 'package:meow_app/modules/app/controller/app.controller.dart';
import 'package:meow_app/modules/cat/controller/cat.controller.dart';

class CatPage extends GetWidget<CatController> {
  CatPage({Key? key}) : super(key: key);
  CatModel cat = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer(
        linearGradient: AppController.instance.isDarkMode.value
            ? AppColors.shimmerGradientDark
            : AppColors.shimmerGradient,
        child: Stack(
          children: [
            Hero(
              tag: 'cat' + cat.id!,
              child: CatCard(
                width: 100.w,
                height: 100.h,
                rouded: false,
                gif: '${Config.BASE_URL}/cat/${cat.id}?width=${100.w}',
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: true,
            ),
          ],
        ),
      ),
    );
  }
}
