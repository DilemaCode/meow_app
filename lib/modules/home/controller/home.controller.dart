import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:meow_app/data/models/cat.model.dart';
import 'package:meow_app/data/services/cats.repository.dart';
import 'package:meow_app/modules/app/controller/app.controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  HomeController({required this.catsRepository});

  static HomeController instance = Get.find();

  final CatsRepository catsRepository;

  RxBool isLoading = false.obs;

  RxInt limit = 11.obs;
  RxInt skip = 0.obs;

  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  RxList catsList = [CatModel(id: 'tags')].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    refreshGifs();
  }

  Future refreshGifs() async {
    isLoading.value = true;
    limit.value = 11;
    skip.value = 0;
    catsList.clear();
    catsList.add(CatModel(id: 'tags'));

    imageCache?.clear();
    await fetchGifs();
    await Future.delayed(Duration(seconds: 1));
    isLoading.value = false;
  }

  Future loadMoreGifs() async {
    limit.value = 11;
    skip.value += limit.value;
    await fetchGifs();
  }

  Future fetchGifs() async {
    try {
      List<CatModel> data =
          await catsRepository.fetchCats(skip: skip.value, limit: limit.value);
      catsList.addAll(data);
      refreshController.refreshCompleted();
      refreshController.loadComplete();
    } catch (e) {
      if (kDebugMode) {
        print('ERROR => fetchGifs: $e');
      }
      AppController.instance.errorSnackbar();
      refreshController.refreshCompleted();
      refreshController.loadComplete();
    }
  }

  List tags = [
    'gif',
    'jump',
    'fail',
    'kitten',
    'cute',
    'eye',
    'sleepin',
    'blac',
    'cat',
    'compute',
    'orang',
    'whit',
    'hallowee',
    'facecat',
    'fluff',
    'didizi',
  ]..shuffle();
}
