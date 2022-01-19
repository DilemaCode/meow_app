import 'package:get/get.dart';
import 'package:meow_app/modules/app/controller/app.controller.dart';
import 'package:meow_app/routes/app_routes.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find();

  RxBool isDarkMode = Get.isDarkMode.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    AppController.instance.playMeow();

    Future.delayed(Duration(seconds: 3))
        .then((value) => Get.offAndToNamed(AppRoutes.Home));
  }
}
