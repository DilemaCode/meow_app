import 'package:flutter/foundation.dart';

List<CatModel> catModelsFromJsonList(List data) {
  return data.map((e) => CatModel.fromJson(e as Map<String, dynamic>)).toList();
}

class CatModel {
  String? id;
  String? createdAt;
  List? tags;

  CatModel({
    this.id,
    this.createdAt,
    this.tags,
  });

  CatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    createdAt = json['created_at'] ?? '';
    tags = json['tags'] ?? [];
    if (kDebugMode) {
      print(tags);
    }
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'created_at': createdAt, 'tags': tags};
}
