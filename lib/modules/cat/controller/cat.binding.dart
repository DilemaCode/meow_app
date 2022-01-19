import 'package:get/get.dart';
import 'package:meow_app/modules/cat/controller/cat.controller.dart';

class CatBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<CatController>(CatController());
  }
}
