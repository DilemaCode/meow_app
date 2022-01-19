import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meow_app/core/themes/colors.dart';
import 'package:meow_app/core/utils/sizer.dart';
import 'package:meow_app/global_witgets/shimmer.widget.impl.dart';
import 'package:meow_app/modules/app/controller/app.controller.dart';

class CatCard extends StatelessWidget {
  const CatCard({
    Key? key,
    required this.gif,
    this.width,
    this.height,
    this.showLoading,
    this.rouded,
  }) : super(key: key);
  final String gif;
  final double? width;
  final double? height;
  final bool? showLoading;
  final bool? rouded;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(rouded ?? true ? 16 : 0),
      child: Obx(
        () => Container(
          width: width ?? 44.w,
          height: height,
          color: AppController.instance.isDarkMode.value
              ? AppColors.shimmerGradientDark.colors[0]
              : AppColors.shimmerGradient.colors[0],
          child: CachedNetworkImage(
            imageUrl: gif,
            imageBuilder: (_, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            errorWidget: (_, s, d) => Icon(
              Icons.broken_image,
              size: 30.sp,
            ),
            placeholder: (context, url) => ShimmerLoading(
              isLoading: true,
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
