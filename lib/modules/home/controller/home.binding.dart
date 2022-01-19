import 'package:get/get.dart';
import 'package:meow_app/common/dependency_injection.dart';
import 'package:meow_app/modules/home/controller/home.controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<HomeController>(HomeController(catsRepository: locator()));
  }
}
