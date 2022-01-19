import 'package:get/get.dart';
import 'package:meow_app/modules/app/controller/inapp.controller.dart';

class InAppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<InAppController>(InAppController());
  }
}
