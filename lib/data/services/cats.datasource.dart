import 'package:dio/dio.dart';
import 'package:meow_app/common/api_response.dart';
import 'package:meow_app/common/dependency_injection.dart';
import 'package:meow_app/data/models/cat.model.dart';

class CatsDataSource {
  final Dio dio = locator();
  final RequestBase requestBase = locator();

  Future<ApiResponse<List<CatModel>>> fetchCats({
    List? tags,
    int? skip,
    int? limit,
  }) async {
    Map<String, dynamic>? data = {
      'tags': tags.toString().replaceAll('[', '').replaceAll(']', ''),
      'skip': '$skip',
      'limit': '${limit ?? 10}',
    };

    data.removeWhere((key, value) {
      return value == null || value == 'null' || value == '';
    });

    String query = Uri(queryParameters: data).query;

    final res = dio.get(
      '/api/cats?$query',
    );

    return await requestBase<List<CatModel>>(
      functionUrl: () => res,
      mapping: (data) => catModelsFromJsonList(data['data']),
    );
  }

  Future<ApiResponse<CatModel>> fetchSingleCat({required String id}) async {
    final res = dio.get(
      '/cat' + id,
    );

    return await requestBase<CatModel>(
      functionUrl: () => res,
      mapping: (data) => CatModel.fromJson(data['data']),
    );
  }

  Future<ApiResponse<CatModel>> fetchRandomGif() async {
    final res = dio.get(
      '/cat/gif?json=true',
    );

    return await requestBase<CatModel>(
      functionUrl: () => res,
      mapping: (data) => CatModel.fromJson(data['data']),
    );
  }
}
