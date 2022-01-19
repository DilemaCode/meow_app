import 'package:get/get.dart';
import 'package:meow_app/modules/app/controller/splash.controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<SplashController>(SplashController());
  }
}
