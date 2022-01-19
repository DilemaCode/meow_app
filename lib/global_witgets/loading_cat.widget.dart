import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meow_app/core/utils/sizer.dart';
import 'package:meow_app/modules/app/controller/app.controller.dart';

class LoadingCat extends StatelessWidget {
  const LoadingCat({Key? key, this.size, this.fit}) : super(key: key);
  final double? size;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Image.asset(
        AppController.instance.isDarkMode.value
            ? 'assets/img/cat-loading.gif'
            : 'assets/img/cat-loading-dark.gif',
        width: size ?? 20.h,
        height: size ?? 20.h,
        fit: fit ?? BoxFit.fitWidth,
      ),
    );
  }
}
