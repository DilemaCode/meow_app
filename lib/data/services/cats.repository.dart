import 'package:meow_app/data/models/cat.model.dart';
import 'package:meow_app/data/services/cats.datasource.dart';

class CatsRepository {
  CatsDataSource homeDS = CatsDataSource();

  Future<List<CatModel>> fetchCats({
    List? tags,
    int? skip,
    int? limit,
  }) async {
    var res = await homeDS.fetchCats(
      tags: tags,
      skip: skip,
      limit: limit,
    );

    if (res.isSuccess) return res.data as List<CatModel>;
    throw Exception([res.statusCode, res.message]);
  }

  Future<CatModel> fetchSingleCat({required String id}) async {
    var res = await homeDS.fetchSingleCat(id: id);

    if (res.isSuccess) return res.data as CatModel;
    throw Exception([res.statusCode, res.message]);
  }

  Future<CatModel> fetchRamdomCat() async {
    var res = await homeDS.fetchRandomGif();

    if (res.isSuccess) return res.data as CatModel;
    throw Exception([res.statusCode, res.message]);
  }
}
