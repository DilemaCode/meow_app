import 'package:get/get.dart';
import 'package:meow_app/modules/app/controller/inapp.binding.dart';
import 'package:meow_app/modules/app/pages/inapp.builder.dart';
import 'package:meow_app/modules/app/pages/splash.page.dart';
import 'package:meow_app/modules/app/controller/splash.binding.dart';
import 'package:meow_app/modules/cat/controller/cat.binding.dart';
import 'package:meow_app/modules/cat/pages/cat.screen.dart';
import 'package:meow_app/modules/home/controller/home.binding.dart';
import 'package:meow_app/modules/ramdom/controller/random.binding.dart';
import 'package:meow_app/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.ROOT,
      binding: SplashBinding(),
      page: () => SplashPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.Home,
      bindings: [
        InAppBinding(),
        HomeBinding(),
        RandomBinding(),
      ],
      page: () => InAppBuilder(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.Cat,
      binding: CatBinding(),
      page: () => CatPage(),
      transition: Transition.fade,
    ),
  ];
}
