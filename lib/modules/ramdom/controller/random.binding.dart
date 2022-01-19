import 'package:get/get.dart';
import 'package:meow_app/common/dependency_injection.dart';
import 'package:meow_app/modules/ramdom/controller/random.controller.dart';

class RandomBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<RandomController>(RandomController(catsRepository: locator()));
  }
}
