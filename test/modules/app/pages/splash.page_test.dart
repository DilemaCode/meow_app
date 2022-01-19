import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:meow_app/common/api_response.dart';
import 'package:meow_app/data/models/cat.model.dart';
import 'package:meow_app/data/services/cats.repository.dart';
import 'package:meow_app/main.dart';
import 'package:meow_app/modules/app/controller/app.controller.dart';
import 'package:meow_app/modules/app/controller/inapp.binding.dart';
import 'package:meow_app/modules/app/controller/splash.binding.dart';
import 'package:meow_app/modules/home/controller/home.controller.dart';
import 'package:meow_app/modules/ramdom/controller/random.controller.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockCatRepo extends Mock implements CatsRepository {
  @override
  Future<List<CatModel>> fetchCats({
    List? tags,
    int? skip,
    int? limit,
  }) async {
    return catModelsFromJsonList(gifs);
  }

  @override
  Future<CatModel> fetchRamdomCat() async {
    return CatModel();
  }
}

class MockConnectivity extends Mock implements Connectivity {}

GetIt _locator = GetIt.instance;

void main() {
  setUpAll(() async {
    await dotenv.load(fileName: '.env');
    initDependecies();
    initControllers();
  });
  testWidgets('splash.page ...', (tester) async {
    await tester.runAsync(() async {
      SplashBinding().dependencies();
      await tester.pumpWidget(const App());
      final welcomeFinder = find.text('MeowApp');
      expect(welcomeFinder, findsOneWidget);
    });
  });
}

Future<void> initDependecies() async {
  _locator.registerLazySingleton<AppController>(() => AppController());

  _locator.registerLazySingleton<CatsRepository>(() => MockCatRepo());

  _locator.registerLazySingleton<Connectivity>(() => MockConnectivity());

  _locator.registerLazySingleton(() => RequestBase(_locator()));

  _locator.registerLazySingleton<Dio>(
    () => MockDio(),
  );
}

void initControllers() async {
  InAppBinding().dependencies();
  Get.put<HomeController>(HomeController(catsRepository: _locator()));
  Get.put<RandomController>(RandomController(catsRepository: _locator()));
}

List gifs = [
  {
    "id": "595f280a557291a9750ebf58",
    "created_at": "2016-12-28T11:51:30.730Z",
    "tags": ["advent-calendar-2016", "gif"]
  },
  {
    "id": "595f280a557291a9750ebf62",
    "created_at": "2016-09-22T19:20:55.627Z",
    "tags": ["jump", "fail", "gif"]
  }
];

Map<String, dynamic> cat = {
  "id": "595f280a557291a9750ebf48",
  "created_at": "2016-10-06T10:41:06.588Z",
  "tags": ["gif"],
  "url": "/cat/595f280a557291a9750ebf48"
};
