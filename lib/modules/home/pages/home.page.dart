import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meow_app/common/config.dart';
import 'package:meow_app/core/themes/colors.dart';
import 'package:meow_app/core/utils/sizer.dart';
import 'package:meow_app/data/models/cat.model.dart';
import 'package:meow_app/global_witgets/custom_smart_refresh_header_ios.dart';
import 'package:meow_app/global_witgets/cat_card.widget.dart';
import 'package:meow_app/global_witgets/custom_grid_delegate.widget.dart';
import 'package:meow_app/global_witgets/header.widget.dart';
import 'package:meow_app/global_witgets/loading_cat.widget.dart';
import 'package:meow_app/global_witgets/no_data.widget.dart';
import 'package:meow_app/global_witgets/shimmer.widget.impl.dart';
import 'package:meow_app/modules/app/controller/app.controller.dart';
import 'package:meow_app/modules/home/controller/home.controller.dart';
import 'package:meow_app/routes/app_routes.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Obx(
        () => CupertinoScrollbar(
          child: Shimmer(
            linearGradient: AppController.instance.isDarkMode.value
                ? AppColors.shimmerGradientDark
                : AppColors.shimmerGradient,
            child: SmartRefresher(
              onRefresh: () async {
                await controller.refreshGifs();
              },
              onLoading: () async {
                await controller.loadMoreGifs();
              },
              enablePullDown: true,
              enablePullUp: true,
              header: HeaderSmartRefreshHeader(),
              footer: FooterSmartRefreshHeader(),
              controller: controller.refreshController,
              child: CustomScrollView(
                cacheExtent: 500,
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: AppHeaderWidget(
                      title: 'Hello',
                      titleSize: 40.sp,
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      showDivider: true,
                    ),
                  ),
                  if (controller.isLoading.value)
                    SliverFillRemaining(
                        child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        child: LoadingCat(),
                      ),
                    )),
                  if (!controller.isLoading.value &&
                      controller.catsList.length == 1)
                    SliverFillRemaining(
                      child: NoDataWidget(),
                    ),
                  if (!controller.isLoading.value &&
                      controller.catsList.length > 1)
                    SliverPadding(
                      padding:
                          EdgeInsets.only(left: 4.w, right: 4.w, bottom: 5.h),
                      sliver: SliverGrid(
                        gridDelegate: XSliverGridDelegate(
                          crossAxisCount: 2,
                          smallCellExtent: 100,
                          bigCellExtent: 40.h,
                          mainAxisSpacing: 4.w,
                          crossAxisSpacing: 4.w,
                          isFirstCellBig: true,
                        ),
                        delegate: SliverChildListDelegate(
                          List.generate(
                            controller.catsList.length,
                            (i) {
                              CatModel? cat = controller.catsList[i];
                              if (cat!.id == 'tags') return _buildTags();
                              return InkWell(
                                onTap: () =>
                                    Get.toNamed(AppRoutes.Cat, arguments: cat),
                                child: Hero(
                                  tag: 'cat' + cat.id!,
                                  child: CatCard(
                                      gif:
                                          '${Config.BASE_URL}/cat/${cat.id}?width=100'),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTags() {
    return SizedBox(
      width: 44.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending Tags',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 1.5.h),
          Wrap(
            runSpacing: 1.w,
            spacing: 1.w,
            children: List.generate(
              6,
              (i) => Container(
                padding: EdgeInsets.symmetric(vertical: .7.h, horizontal: 3.w),
                margin: EdgeInsets.symmetric(vertical: .5.h),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.tagsColors[i].withOpacity(0.8),
                ),
                child: Text('#' + controller.tags[i].toString()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
