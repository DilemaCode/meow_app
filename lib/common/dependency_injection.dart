import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meow_app/common/api_response.dart';
import 'package:meow_app/common/config.dart';
import 'package:meow_app/data/services/cats.repository.dart';
import 'package:meow_app/modules/app/controller/app.controller.dart';

GetIt locator = GetIt.instance;

class DependencyInjection {
  static Future<void> init() async {
    locator.registerLazySingleton<AppController>(() => AppController());

    locator.registerLazySingleton<CatsRepository>(() => CatsRepository());

    locator.registerLazySingleton(() => Connectivity());

    locator.registerLazySingleton(() => RequestBase(locator()));

    locator.registerLazySingleton<Dio>(
      () => buildDioClient(),
    );
  }
}

Dio buildDioClient() {
  final client = Dio(BaseOptions(
    baseUrl: Config.BASE_URL!,
    connectTimeout: 25000,
    receiveTimeout: 3000,
  ));
  client.interceptors.add(LogInterceptor());

  return client;
}
