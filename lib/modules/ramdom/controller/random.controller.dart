import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:meow_app/data/models/cat.model.dart';
import 'package:meow_app/data/services/cats.repository.dart';
import 'package:meow_app/modules/app/controller/app.controller.dart';

class RandomController extends GetxController {
  RandomController({required this.catsRepository});
  final CatsRepository catsRepository;

  static RandomController instance = Get.find();

  RxBool isLoading = false.obs;
  Rx<CatModel> cat = CatModel().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchRandomGif();
  }

  void fetchRandomGif() async {
    try {
      isLoading.value = true;
      CatModel data = await catsRepository.fetchRamdomCat();
      cat.value = CatModel();
      cat.value = data;
      isLoading.value = false;
    } catch (e) {
      if (kDebugMode) {
        print('ERROR => fetchRandomGif: $e');
      }
      isLoading.value = false;
      AppController.instance.errorSnackbar();
    }
  }
}
